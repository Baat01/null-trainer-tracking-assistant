-- =====================================================================
-- AUTO-TRACKER LUA : FRAGS PAR DRESSEUR & GESTION DES RELANCES
-- (Conçu pour être lu par un script Python - V6 Reset au lancement)
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
    
    -- Afficher les frags du combat en cours
    if fragStats[currentTrainerId] then
        for pkm, kills in pairs(fragStats[currentTrainerId]) do
            trackerBuffer:print("- " .. pkm .. " : " .. kills .. " frag(s)\n")
        end
        trackerBuffer:print("--------------------------------\n")
    end
    
    for _, line in ipairs(logLines) do
        trackerBuffer:print(line .. "\n")
    end
end

-- 2. Sauvegarde en JSON
local function saveJSON()
    local file = io.open("frags_by_trainer.json", "w")
    if not file then return end
    
    local out = '{\n  "encounters": [\n'
    for i, tId in ipairs(trainerHistory) do
        out = out .. string.format('    {"trainerId": %d, "frags": {', tId)
        
        local fragParts = {}
        for pkm, kills in pairs(fragStats[tId]) do
            table.insert(fragParts, string.format('"%s": %d', pkm, kills))
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

-- 4. Déterminer qui porte le coup fatal
local function getKillerName()
    local attackerId = emu:read8(gBattlerAttacker)
    if attackerId == 0 or attackerId == 2 then
        local partyIndex = emu:read8(gBattlerPartyIndexes + attackerId)
        local pMon = readPartyMon(gPlayerParty + partyIndex * partyMonSize)
        if pMon and pMon.species ~= 0 then
            return mons[pMon.species] or "Inconnu"
        end
    end
    return "Non attribué"
end

-- 5. Exporter l'équipe et le PC dans un fichier TXT pour le Python
local function exportBoxToTXT()
    local file = io.open("box_data.txt", "w")
    if not file then return end
    
    local out = ""
    
    -- 5a. Export de l'équipe actuelle
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
    
    -- 5b. Export du PC complet (14 boîtes * 30 slots = 420 slots)
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
    
    -- DÉBUT DU COMBAT
    if inBattle and not wasInBattle then
        wasInBattle = true
        currentTrainerId = emu:read16(gTrainerBattleOpponent_A)
        
        -- Création instantanée du dump de la box
        exportBoxToTXT()
        logToTracker("Box exportée avec succès ! (box_data.txt)")
        
        -- GESTION DU ROLLBACK (Oubli des frags si on relance)
        local foundIdx = nil
        for i, tId in ipairs(trainerHistory) do
            if tId == currentTrainerId then
                foundIdx = i
                break
            end
        end
        
        if foundIdx then
            -- On vide les frags de l'équipe pour le dresseur actuel 
            -- et TOUS ceux rencontrés chronologiquement après lui
            for i = foundIdx, #trainerHistory do
                fragStats[trainerHistory[i]] = {}
            end
            logToTracker("Relance détectée ! Frags réinitialisés à partir d'ici.")
        else
            -- C'est un nouveau dresseur, on l'ajoute à l'historique
            table.insert(trainerHistory, currentTrainerId)
            fragStats[currentTrainerId] = {}
        end
        
        -- INIT: Ajout de toute l'équipe du joueur à 0 frag pour le dresseur ACTUEL
        local pCount = emu:read8(gPlayerPartyCount)
        for i = 1, pCount do
            local pMon = readPartyMon(gPlayerParty + (i - 1) * partyMonSize)
            if pMon and pMon.species ~= 0 then
                local pkmName = mons[pMon.species] or "Inconnu"
                if not fragStats[currentTrainerId][pkmName] then
                    fragStats[currentTrainerId][pkmName] = 0
                end
            end
        end
        
        saveJSON()
        logToTracker("Combat démarré ! (Dresseur " .. currentTrainerId .. ")")
        
        -- Mémoriser les HP initiaux de l'adversaire
        for i = 1, 6 do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            lastEnemyHP[i] = eMon.hp
        end
        
    -- FIN DU COMBAT
    elseif not inBattle and wasInBattle then
        wasInBattle = false
        logToTracker("Fin du combat.")
        saveJSON()
    end
    
    -- PENDANT LE COMBAT
    if inBattle then
        local eCount = emu:read8(gEnemyPartyCount)
        for i = 1, eCount do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            if eMon.species ~= 0 then
                if lastEnemyHP[i] > 0 and eMon.hp == 0 then
                    local enemyName = mons[eMon.species] or "Espèce " .. eMon.species
                    local killerName = getKillerName()
                    
                    addFrag(killerName)
                    logToTracker("" .. enemyName .. " tué par " .. killerName)
                    saveJSON()
                end
                lastEnemyHP[i] = eMon.hp
            end
        end
    end
end

-- 7. Initialisation
local function initDirectTracker()
    -- On écrase volontairement les données à chaque lancement
    trainerHistory = {}
    fragStats = {}
    saveJSON() -- Cela va créer un fichier frags_by_trainer.json vide: {"encounters": []}

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