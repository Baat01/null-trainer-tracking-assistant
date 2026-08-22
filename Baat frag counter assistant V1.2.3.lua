-- =====================================================================
-- AUTO-TRACKER LUA : GESTION DES MÉGA-ÉVOLUTIONS & 0 LAG (V23)
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
local lastTrainerDisplayId = 0
local lastEnemyHP = {0, 0, 0, 0, 0, 0}

local trainerHistory = {} 
local fragStats = {}      
local partyOrders = {} 

local trackerBuffer = nil
local logLines = {}
local forceRender = false

-- 1. Nettoyage des noms (regroupe les Méga et Primo avec la forme de base)
local function cleanPokemonName(name)
    if not name then return "Inconnu" end
    -- Retire les suffixes -Mega, -Mega-X, -Mega-Y, -Primal, etc.
    local clean = name:gsub("%-Mega.*", ""):gsub("%-Primal.*", "")
    return clean
end

-- 2. Fonction pour conserver un historique de logs (max 5 lignes)
local function logToTracker(msg)
    table.insert(logLines, msg)
    if #logLines > 5 then table.remove(logLines, 1) end
    forceRender = true 
end

-- 3. Fonction pour garantir que la fenêtre de tracking est bien ouverte
local function ensureBuffers()
    if not trackerBuffer then
        trackerBuffer = console:createBuffer("Frags & Live Tracker")
        if trackerBuffer then trackerBuffer:setSize(350, 400) end
    end
end

-- 4. Fonction de rendu graphique (appelée UNIQUEMENT sur événement)
local function renderUI()
    ensureBuffers()
    if not trackerBuffer then return end

    trackerBuffer:clear()
    
    local displayId = (currentTrainerId ~= 0 and currentTrainerId) or lastTrainerDisplayId
    
    if displayId ~= 0 and fragStats[displayId] and partyOrders[displayId] then
        if currentTrainerId ~= 0 then
            trackerBuffer:print("=== FRAGS DU COMBAT (ID " .. displayId .. ") ===\n")
        else
            trackerBuffer:print("=== DERNIER COMBAT (ID " .. displayId .. ") ===\n")
        end
        
        for _, pkm in ipairs(partyOrders[displayId]) do
            local kills = fragStats[displayId][pkm] or 0
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

-- 5. Sauvegarde dans le fichier JSON (fin de combat)
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

-- 6. Ajout d'un frag (rattaché au Pokémon de base)
local function addFrag(pokemonName)
    if not currentTrainerId or currentTrainerId == 0 then return end
    
    local baseName = cleanPokemonName(pokemonName)
    
    if not fragStats[currentTrainerId] then
        fragStats[currentTrainerId] = {}
    end
    if not partyOrders[currentTrainerId] then
        partyOrders[currentTrainerId] = {}
    end
    
    local exists = false
    for _, name in ipairs(partyOrders[currentTrainerId]) do
        if name == baseName then
            exists = true
            break
        end
    end
    if not exists then
        table.insert(partyOrders[currentTrainerId], baseName)
    end
    
    local currentKills = fragStats[currentTrainerId][baseName] or 0
    fragStats[currentTrainerId][baseName] = currentKills + 1
    forceRender = true 
end

local function getKillerName()
    local attackerId = emu:read8(gBattlerAttacker)
    local party = getParty and getParty()
    
    if not party then return "Non attribué" end
    
    local function getPkmName(partyIdx)
        if partyIdx and partyIdx >= 0 and partyIdx < 6 then
            local pMon = party[partyIdx + 1] 
            if pMon and pMon.species ~= 0 then
                local rawName = (mons and mons[pMon.species]) or "Inconnu"
                return cleanPokemonName(rawName)
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
                    cleanPokemonName(mons[mon.species]),
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
                        cleanPokemonName(mons[mon.species]),
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
    local outcome = emu:read8(gBattleOutcome)
    local tId = emu:read16(gTrainerBattleOpponent_A)
    local bCount = emu:read8(gBattlersCount)
    local bFlags = emu:read32(gBattleTypeFlags)
    
    local isTrainerBattle = (math.floor(bFlags / 8) % 2 ~= 0)
    local inBattle = (bCount > 0 and outcome == 0 and tId ~= 0 and isTrainerBattle)
    
    -- DÉBUT DE COMBAT
    if inBattle and not wasInBattle then
        wasInBattle = true
        currentTrainerId = tId
        lastTrainerDisplayId = tId
        
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
            logToTracker("⚠️ Relance détectée ! Frags réinitialisés.")
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
                    local rawName = (mons and mons[pMon.species]) or "Inconnu"
                    local pkmName = cleanPokemonName(rawName)
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
            lastEnemyHP[i] = (eMon and eMon.hp) or 0
        end
        
    -- FIN DE COMBAT
    elseif not inBattle and wasInBattle then
        wasInBattle = false
        logToTracker("🏁 Fin du combat. Sauvegarde dans JSON...")
        saveJSON()
        currentTrainerId = 0
        forceRender = true
    end
    
    -- PENDANT LE COMBAT (Surveillance des KOs)
    if inBattle and currentTrainerId ~= 0 then
        local eCount = emu:read8(gEnemyPartyCount)
        for i = 1, eCount do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            if eMon and eMon.species ~= 0 then
                local curHp = eMon.hp or 0
                if lastEnemyHP[i] and lastEnemyHP[i] > 0 and curHp == 0 then
                    local enemyName = (mons and mons[eMon.species]) or ("Espèce " .. eMon.species)
                    local killerName = getKillerName()
                    
                    addFrag(killerName)
                    logToTracker("💀 " .. enemyName .. " mis KO par " .. killerName)
                end
                lastEnemyHP[i] = curHp
            end
        end
    end

    -- MISE À JOUR VISUELLE : Uniquement si un événement modifie l'état
    if forceRender then
        renderUI()
        forceRender = false
    end
end

local function initDirectTracker()
    trainerHistory = {}
    fragStats = {}
    partyOrders = {}
    saveJSON() 
    ensureBuffers()
    logToTracker("✅ Script démarré : Prêt à compter les frags !")
    renderUI()
end

callbacks:add("start", initDirectTracker)
callbacks:add("frame", trackCombatDirect)

if emu then
    initDirectTracker()
end
