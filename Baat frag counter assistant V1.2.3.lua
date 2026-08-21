-- =====================================================================
-- AUTO-TRACKER LUA : ANTI-SAUVAGES & OPTI SAUVEGARDE
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
local gBattleTypeFlags = 0x02004cb4 -- Adresse des Flags de combat
local partyMonSize = 104

local wasInBattle = false
local currentTrainerId = 0
local lastEnemyHP = {0, 0, 0, 0, 0, 0}

local trainerHistory = {} 
local fragStats = {}      
local partyOrders = {} 

local trackerBuffer = nil
local logLines = {}

-- 1. Fonction pour conserver un historique de logs (max 5 lignes)
local function logToTracker(msg)
    table.insert(logLines, msg)
    if #logLines > 5 then table.remove(logLines, 1) end
end

-- 2. Fonction pour garantir que la fenêtre de tracking est bien ouverte
local function ensureBuffers()
    if not trackerBuffer then
        trackerBuffer = console:createBuffer("Frags & Live Tracker")
        if trackerBuffer then trackerBuffer:setSize(350, 400) end
    end
end

-- 3. Fonction de sauvegarde dans le fichier (Appelée uniquement à la fin du combat)
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

local function addFrag(pokemonName)
    if not fragStats[currentTrainerId] then
        fragStats[currentTrainerId] = {}
    end
    local currentKills = fragStats[currentTrainerId][pokemonName] or 0
    fragStats[currentTrainerId][pokemonName] = currentKills + 1
end

local function getKillerName()
    local attackerId = emu:read8(gBattlerAttacker)
    local party = getParty and getParty()
    
    if not party then return "Non attribué" end
    
    local function getPkmName(partyIdx)
        if partyIdx and partyIdx >= 0 and partyIdx < 6 then
            local pMon = party[partyIdx + 1] 
            if pMon and pMon.species ~= 0 then
                return (mons and mons[pMon.species]) or "Inconnu"
            end
        end
        return nil
    end

    if attackerId == 0 or attackerId == 2 then
        local partyIndex = emu:read8(gBattlerPartyIndexes + attackerId)
        local name = getPkmName(partyIndex)
        if name then return name end
    end
    
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

local function exportBoxToTXT()
    local file = io.open("box_data.txt", "w")
    if not file then return end
    
    local out = ""
    if getParty then
        for _, mon in ipairs(getParty()) do
            if mon.species ~= 0 and mons and mons[mon.species] ~= nil then
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
                if mon and mon.species ~= 0 and mons and mons[mon.species] ~= nil then
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

local function trackCombatDirect()
    ensureBuffers()

    local outcome = emu:read8(gBattleOutcome)
    local tId = emu:read16(gTrainerBattleOpponent_A)
    local bCount = emu:read8(gBattlersCount)
    local bFlags = emu:read32(gBattleTypeFlags)
    
    -- Vérifie mathématiquement si le bit "8" (Trainer Battle) est présent dans bFlags
    local isTrainerBattle = (math.floor(bFlags / 8) % 2 ~= 0)
    
    -- Le combat n'est validé QUE si c'est un Dresseur
    local inBattle = (bCount > 0 and outcome == 0 and tId ~= 0 and isTrainerBattle)

    -- =====================================================
    -- 📊 AFFICHAGE FRAGS & LOGS (Interface principale)
    -- =====================================================
    if trackerBuffer then
        trackerBuffer:clear()
        if currentTrainerId ~= 0 and fragStats[currentTrainerId] and partyOrders[currentTrainerId] then
            trackerBuffer:print("=== FRAGS (DRESSEUR ID " .. currentTrainerId .. ") ===\n")
            for _, pkm in ipairs(partyOrders[currentTrainerId]) do
                local kills = fragStats[currentTrainerId][pkm] or 0
                trackerBuffer:print("- " .. pkm .. " : " .. kills .. " frag(s)\n")
            end
            trackerBuffer:print("--------------------------\n\n")
        else
            trackerBuffer:print("=== AUCUN COMBAT DE DRESSEUR ===\n\n")
        end
        
        trackerBuffer:print("=== DERNIÈRES ACTIONS ===\n")
        for _, line in ipairs(logLines) do
            trackerBuffer:print(line .. "\n")
        end
    end
    
    -- =====================================================
    -- LOGIQUE DE COMBAT
    -- =====================================================
    if inBattle and not wasInBattle then
        wasInBattle = true
        currentTrainerId = tId
        
        exportBoxToTXT()
        logToTracker("📦 Box exportée avec succès !")
        
        local foundIdx = nil
        for i, histId in ipairs(trainerHistory) do
            if histId == currentTrainerId then
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
            logToTracker("⚠️ Relance détectée ! Frags réinitialisés en mémoire.")
        else
            table.insert(trainerHistory, currentTrainerId)
            fragStats[currentTrainerId] = {}
            partyOrders[currentTrainerId] = {}
        end
        
        if not partyOrders[currentTrainerId] then
            partyOrders[currentTrainerId] = {}
        end
        
        local party = getParty and getParty()
        if party then
            for _, pMon in ipairs(party) do
                if pMon and pMon.species ~= 0 then
                    local pkmName = (mons and mons[pMon.species]) or "Inconnu"
                    if not fragStats[currentTrainerId][pkmName] then
                        fragStats[currentTrainerId][pkmName] = 0
                        table.insert(partyOrders[currentTrainerId], pkmName)
                    end
                end
            end
        end
        
        logToTracker("⚔️ Combat démarré ! (Dresseur " .. currentTrainerId .. ")")
        
        for i = 1, 6 do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            lastEnemyHP[i] = eMon.hp
        end
        
    elseif not inBattle and wasInBattle then
        wasInBattle = false
        logToTracker("🏁 Fin du combat. Sauvegarde dans JSON...")
        
        saveJSON()
        
        currentTrainerId = 0
    end
    
    if inBattle and currentTrainerId ~= 0 then
        local eCount = emu:read8(gEnemyPartyCount)
        for i = 1, eCount do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            if eMon.species ~= 0 then
                if lastEnemyHP[i] > 0 and eMon.hp == 0 then
                    local enemyName = (mons and mons[eMon.species]) or "Espèce " .. eMon.species
                    local killerName = getKillerName()
                    
                    addFrag(killerName)
                    logToTracker("💀 " .. enemyName .. " mis KO par " .. killerName)
                end
                lastEnemyHP[i] = eMon.hp
            end
        end
    end
end

local function initDirectTracker()
    trainerHistory = {}
    fragStats = {}
    partyOrders = {}
    saveJSON()
    ensureBuffers()
    logToTracker("✅ Script démarré : Prêt à compter les frags !")
end

callbacks:add("start", initDirectTracker)
callbacks:add("frame", trackCombatDirect)

if emu then
    initDirectTracker()
end
