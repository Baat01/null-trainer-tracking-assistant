-- =====================================================================
-- AUTO-TRACKER LUA : FRAGS PAR DRESSEUR & GESTION DES RELANCES
-- (Conçu pour être lu par un script Python - V9 Sécurité getParty)
-- =====================================================================

local gPlayerPartyCount = 0x0200536D
local gEnemyPartyCount = 0x0200536E
local gPlayerParty = 0x02005370
local gEnemyParty = 0x020055E0
local gBattlerAttacker = 0x02004F00
local gBattlerPartyIndexes = 0x02004D42
local gBattleOutcome = 0x02005110
local gBattlersCount = 0x02004D40
local gTrainerBattleOpponent_A = 0x0201962E 
local partyMonSize = 104

-- Variables d'état
local wasInBattle = false
local currentTrainerId = 0
local lastEnemyHP = {0, 0, 0, 0, 0, 0}

-- Historique et Stats
local trainerHistory = {} 
local fragStats = {}      
local partyOrders = {} -- Fige l'ordre initial de l'équipe

-- Fenêtre et Logs
local trackerBuffer = nil
local logLines = {}

-- 1. Affichage UNIQUEMENT dans le buffer
local function logToTracker(msg)
    if not trackerBuffer then return end
    
    table.insert(logLines, msg)
    if #logLines > 8 then table.remove(logLines, 1) end
    
    trackerBuffer:clear()
    trackerBuffer:print("=== FRAGS DU DRESSEUR ACTUEL (ID: " .. currentTrainerId .. ") ===\n\n")
    
    -- Affiche les frags en respectant strictement l'ordre initial de l'équipe
    if fragStats[currentTrainerId] and partyOrders[currentTrainerId] then
        for _, pkm in ipairs(partyOrders[currentTrainerId]) do
            local kills = fragStats[currentTrainerId][pkm] or 0
            trackerBuffer:print("- " .. pkm .. " : " .. kills .. " frag(s)\n")
        end
        trackerBuffer:print("--------------------------------\n")
    end
    
    for _, line in ipairs(logLines) do
        trackerBuffer:print(line .. "\n")
    end
end

-- 2. Sauvegarde en JSON (Respecte l'ordre initial)
local function saveJSON()
    local file = io.open("frags_by_trainer.json", "w")
    if not file then return end
    
    local out = '{\n  "encounters": [\n'
    for i, tId in ipairs(trainerHistory) do
        out = out .. string.format('    {"trainerId": %d, "frags": {', tId)
        
        local fragParts = {}
        if partyOrders[tId] then
            for _, pkm in ipairs(partyOrders[tId]) do
                local kills = fragStats[tId][pkm] or 0
                table.insert(fragParts, string.format('"%s": %d', pkm, kills))
            end
        else
            for pkm, kills in pairs(fragStats[tId]) do
                table.insert(fragParts, string.format('"%s": %d', pkm, kills))
            end
        end
        out = out .. table.concat(fragParts, ", ") .. "}}"
        
        if i < #trainerHistory then out = out .. ",\n" else out = out .. "\n" end
    end
    out = out .. '  ]\n}'
    
    file:write(out)
    file:close()
end

-- 3. Ajouter un frag au dresseur en cours
local function addFrag(pokemonName)
    if not fragStats[currentTrainerId] then
        fragStats[currentTrainerId] = {}
    end
    local currentKills = fragStats[currentTrainerId][pokemonName] or 0
    fragStats[currentTrainerId][pokemonName] = currentKills + 1
end

-- 4. Déterminer qui porte le coup fatal (VIA GETPARTY)
local function getKillerName()
    local attackerId = emu:read8(gBattlerAttacker)
    local party = getParty and getParty()
    
    -- Si getParty n'est pas dispo, on renvoie Non attribué
    if not party then return "Non attribué" end
    
    -- Fonction interne pour récupérer le nom de façon sécurisée
    local function getPkmName(partyIdx)
        if partyIdx and partyIdx >= 0 and partyIdx < 6 then
            local pMon = party[partyIdx + 1] -- Lua est indexé à partir de 1
            if pMon and pMon.species ~= 0 then
                return mons[pMon.species] or "Inconnu"
            end
        end
        return nil
    end

    -- CAS A : Attaque directe du joueur
    if attackerId == 0 or attackerId == 2 then
        local partyIndex = emu:read8(gBattlerPartyIndexes + attackerId)
        local name = getPkmName(partyIndex)
        if name then return name end
    end
    
    -- CAS B : FALLBACK (Poison, Brûlure, Recul, Memento...)
    local partyIdx0 = emu:read8(gBattlerPartyIndexes + 0)
    local name0 = getPkmName(partyIdx0)
    
    local battlersCount = emu:read8(gBattlersCount)
    
    if battlersCount <= 2 then
        if name0 then return name0 end
    else
        local partyIdx2 = emu:read8(gBattlerPartyIndexes + 2)
        local name2 = getPkmName(partyIdx2)
        
        local pMon0 = party[partyIdx0 + 1]
        local pMon2 = party[partyIdx2 + 1]
        
        if pMon0 and pMon0.hp > 0 and name0 then return name0 end
        if pMon2 and pMon2.hp > 0 and name2 then return name2 end
        if name0 then return name0 end
    end

    return "Non attribué"
end

-- 5. Exporter l'équipe et le PC dans un fichier TXT pour le Python
local function exportBoxToTXT()
    local file = io.open("box_data.txt", "w")
    if not file then return end
    
    local out = ""
    
    if getParty then
        for _, mon in ipairs(getParty()) do
            if mon.species ~= 0 and mons[mon.species] ~= nil then
                out = out .. string.format(
                    "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                    mons[mon.species],
                    (mon.nickname ~= "" and mon.nickname) or "None",
                    getMetLocationName(mon.metLocation),
                    getNature(mon),
                    getAbility(mon),
                    mon.hpIV or 0, mon.attackIV or 0, mon.defenseIV or 0,
                    mon.spAttackIV or 0, mon.spDefenseIV or 0, mon.speedIV or 0
                )
            end
        end
    end
    
    if storageLoc and readBoxMon then
        local boxBaseAddress = storageLoc + 4
        local totalBoxMons = 420 
        local slotSize = 84
        
        for i = 0, totalBoxMons - 1 do
            local address = boxBaseAddress + i * slotSize
            if emu:read32(address) ~= 0 then
                local mon = readBoxMon(address)
                if mon and mon.species ~= 0 and mons[mon.species] ~= nil then
                    out = out .. string.format(
                        "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                        mons[mon.species],
                        (mon.nickname ~= "" and mon.nickname) or "None",
                        getMetLocationName(mon.metLocation),
                        getNature(mon),
                        getAbility(mon),
                        mon.hpIV or 0, mon.attackIV or 0, mon.defenseIV or 0,
                        mon.spAttackIV or 0, mon.spDefenseIV or 0, mon.speedIV or 0
                    )
                end
            end
        end
    end
    
    file:write(out)
    file:close()
end

-- 6. Suivi des combats (exécuté à chaque frame)
local function trackCombatDirect()
    local outcome = emu:read8(gBattleOutcome)
    local inBattle = (emu:read8(gBattlersCount) > 0 and outcome == 0)
    
    if inBattle and not wasInBattle then
        wasInBattle = true
        currentTrainerId = emu:read16(gTrainerBattleOpponent_A)
        
        exportBoxToTXT()
        logToTracker("Box exportée avec succès ! (box_data.txt)")
        
        local foundIdx = nil
        for i, tId in ipairs(trainerHistory) do
            if tId == currentTrainerId then
                foundIdx = i
                break
            end
        end
        
        if foundIdx then
            for i = foundIdx, #trainerHistory do
                local rId = trainerHistory[i]
                fragStats[rId] = {}
                partyOrders[rId] = {}
            end
            logToTracker("Relance détectée ! Frags réinitialisés à partir d'ici.")
        else
            table.insert(trainerHistory, currentTrainerId)
            fragStats[currentTrainerId] = {}
            partyOrders[currentTrainerId] = {}
        end
        
        if not partyOrders[currentTrainerId] then
            partyOrders[currentTrainerId] = {}
        end
        
        -- INIT: Capture de l'ordre exact de l'équipe (VIA GETPARTY)
        local party = getParty and getParty()
        if party then
            for _, pMon in ipairs(party) do
                if pMon and pMon.species ~= 0 then
                    local pkmName = mons[pMon.species] or "Inconnu"
                    if not fragStats[currentTrainerId][pkmName] then
                        fragStats[currentTrainerId][pkmName] = 0
                        table.insert(partyOrders[currentTrainerId], pkmName) -- On fige l'ordre
                    end
                end
            end
        end
        
        saveJSON()
        logToTracker("Combat démarré ! (Dresseur " .. currentTrainerId .. ")")
        
        for i = 1, 6 do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            lastEnemyHP[i] = eMon.hp
        end
        
    elseif not inBattle and wasInBattle then
        wasInBattle = false
        logToTracker("Fin du combat.")
        saveJSON()
    end
    
    if inBattle then
        local eCount = emu:read8(gEnemyPartyCount)
        for i = 1, eCount do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            if eMon.species ~= 0 then
                if lastEnemyHP[i] > 0 and eMon.hp == 0 then
                    local enemyName = mons[eMon.species] or "Espèce " .. eMon.species
                    local killerName = getKillerName()
                    
                    addFrag(killerName)
                    logToTracker(enemyName .. " tué par " .. killerName)
                    saveJSON()
                end
                lastEnemyHP[i] = eMon.hp
            end
        end
    end
end

-- 7. Initialisation
local function initDirectTracker()
    trainerHistory = {}
    fragStats = {}
    partyOrders = {}
    saveJSON() 

    if not trackerBuffer then
        trackerBuffer = console:createBuffer("Frags & Live Tracker")
        trackerBuffer:setSize(350, 300)
    end
    
    logToTracker("Tracker réinitialisé ! Prêt pour une nouvelle session.")
end

callbacks:add("start", initDirectTracker)
callbacks:add("frame", trackCombatDirect)

if emu then
    initDirectTracker()
end
