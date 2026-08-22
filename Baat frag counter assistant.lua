-- =====================================================================
-- AUTO-TRACKER LUA : AUTO-DÉCHIFFREMENT GBA & ALERTES (V29)
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
local gTrainerBattleOpponent_B = 0x02019630 
local gBattleTypeFlags = 0x02004cb4 
local partyMonSize = 104

local wasInBattle = false
local currentTrainerId = 0
local currentTrainerBId = 0
local lastTrainerDisplayId = 0
local lastEnemyHP = {0, 0, 0, 0, 0, 0}

local trainerHistory = {} 
local fragStats = {}      
local partyOrders = {} 

local trackerBuffer = nil
local debugBuffer = nil
local logLines = {}
local forceRender = false
local frameCounter = 0

-- 1. Nettoyage des formes
local function cleanPokemonName(name)
    if not name or name == "" or name == "Inconnu" then return "Inconnu" end
    local clean = name:gsub("%-Mega.*", ""):gsub("%-Primal.*", "")
    return clean
end

-- 2. Déchiffrement de secours de l'espèce (XOR Personality ^ OTID)
local function resolveSpeciesId(pMon)
    if not pMon or not pMon.species or pMon.species == 0 then return 0 end
    local sp = pMon.species
    
    -- Si l'ID est valide dans la table, on le renvoie directement
    if mons and mons[sp] then return sp end
    
    -- Sinon, tentative de déchiffrement XOR GBA
    if pMon.personality and pMon.otId then
        local key = (pMon.personality ~ pMon.otId) & 0xFFFF
        local decrypted = sp ~ key
        if mons and mons[decrypted] then
            return decrypted
        end
    end
    
    return sp
end

-- 3. Lecture index combattant (u16)
local function getBattlerPartyIndex(battlerId)
    if not battlerId or battlerId < 0 or battlerId > 3 then return 0 end
    return emu:read16(gBattlerPartyIndexes + (battlerId * 2))
end

-- 4. Ajout d'une action à l'affichage
local function logToTracker(msg)
    table.insert(logLines, msg)
    if #logLines > 6 then table.remove(logLines, 1) end
    forceRender = true 
end

-- 5. Diagnostic Traceback
local function dumpDetailedTraceback(reason, extraInfo)
    logToTracker("⚠️ [ANOMALIE] " .. tostring(reason))
    
    local file = io.open("lua_traceback.txt", "a")
    if not file then return end
    
    local ramPartyCount = emu:read8(gPlayerPartyCount)
    local party = (getParty and getParty()) or {}
    local bCount = emu:read8(gBattlersCount)
    local bFlags = emu:read32(gBattleTypeFlags)
    local attackerId = emu:read8(gBattlerAttacker)
    
    file:write("=====================================================================\n")
    file:write(string.format("[%s] 🚨 ANOMALIE DÉTECTÉE : %s\n", os.date("%Y-%m-%d %H:%M:%S"), tostring(reason)))
    file:write(string.format("Dresseur A ID : %s | Dresseur B ID : %s | BattlersCount: %d | Flags: %d | AttackerId: %d\n", 
        tostring(currentTrainerId ~= 0 and currentTrainerId or lastTrainerDisplayId), tostring(currentTrainerBId), bCount, bFlags, attackerId))
    
    if extraInfo and extraInfo ~= "" then
        file:write(string.format("Contexte de l'erreur : %s\n", tostring(extraInfo)))
    end

    file:write("\n--- [1] INDEX DES COMBATTANTS SUR LE TERRAIN ---\n")
    for b = 0, 3 do
        local pIdx = getBattlerPartyIndex(b)
        file:write(string.format("  * Battler %d -> PartyIndex: %d\n", b, pIdx))
    end

    file:write(string.format("\n--- [2] ÉQUIPE JOUEUR (RAM Count: %d | Lua Table Count: %d) ---\n", ramPartyCount, #party))
    for i, pMon in ipairs(party) do
        local spId = resolveSpeciesId(pMon)
        local rawName = (mons and mons[spId]) or "NIL_IN_MONS_TABLE"
        local hp = (pMon and pMon.hp) or 0
        file:write(string.format("  Slot #%d: RawSpecies=%d | ResolvedSpecies=%d | Nom='%s' | HP=%d\n", 
            i, pMon.species or 0, spId, cleanPokemonName(rawName), hp))
    end

    file:write("\n--- [3] ADVERSAIRES (6 Slots Scannés) ---\n")
    for i = 1, 6 do
        local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
        local spId = (eMon and eMon.species) or 0
        local eName = (mons and mons[spId]) or "Inconnu"
        local hp = (eMon and eMon.hp) or 0
        file:write(string.format("  Enemy #%d: SpeciesID=%d (%s) | HP=%d\n", i, spId, eName, hp))
    end

    file:write("\n--- [4] DERNIÈRES ACTIONS DU TRACKER ---\n")
    for _, line in ipairs(logLines) do
        file:write("  - " .. line .. "\n")
    end
    file:write("=====================================================================\n\n")
    file:close()
end

-- 6. Initialisation Buffers
local function ensureBuffers()
    if not trackerBuffer then
        trackerBuffer = console:createBuffer("Frags & Live Tracker")
        if trackerBuffer then trackerBuffer:setSize(350, 400) end
    end
    if not debugBuffer then
        debugBuffer = console:createBuffer("Debug Tracker")
        if debugBuffer then debugBuffer:setSize(300, 350) end
    end
end

-- 7. Rendu graphique
local function renderUI(bCount, outcome, tId, bFlags, isTrainerBattle, inBattle)
    ensureBuffers()
    
    local party = (getParty and getParty()) or {}
    local pIdx0 = getBattlerPartyIndex(0)
    local pIdx2 = getBattlerPartyIndex(2)
    local mon0 = party[pIdx0 + 1]
    local mon2 = party[pIdx2 + 1]
    local sp0 = resolveSpeciesId(mon0)
    local sp2 = resolveSpeciesId(mon2)
    local name0 = (mons and mons[sp0]) or "N/A"
    local name2 = (mons and mons[sp2]) or "N/A"

    if debugBuffer then
        debugBuffer:clear()
        debugBuffer:print("=== 🐛 SUPER DEBUG EN DIRECT ===\n")
        debugBuffer:print("Trainer A RAM  : " .. tostring(tId or 0) .. "\n")
        debugBuffer:print("Trainer B RAM  : " .. tostring(emu:read16(gTrainerBattleOpponent_B)) .. "\n")
        debugBuffer:print("inBattle (Lua) : " .. tostring(inBattle) .. "\n")
        debugBuffer:print("BattlersCount  : " .. tostring(bCount or 0) .. "\n")
        debugBuffer:print("RAM PartyCount : " .. tostring(emu:read8(gPlayerPartyCount)) .. "\n")
        debugBuffer:print("------------------------------\n")
        debugBuffer:print(string.format("Slot 1 (B0): [Idx %d] %s\n", pIdx0, name0))
        debugBuffer:print(string.format("Slot 2 (B2): [Idx %d] %s\n", pIdx2, name2))
        debugBuffer:print("Attacker ID    : " .. tostring(emu:read8(gBattlerAttacker)) .. "\n")
        debugBuffer:print("==============================\n")
    end

    if trackerBuffer then
        trackerBuffer:clear()
        local displayId = (currentTrainerId ~= 0 and currentTrainerId) or lastTrainerDisplayId
        
        if displayId ~= 0 and fragStats[displayId] and partyOrders[displayId] then
            if currentTrainerBId ~= 0 then
                trackerBuffer:print(string.format("=== COMBAT DUO (IDs: %d & %d) ===\n", displayId, currentTrainerBId))
            else
                trackerBuffer:print("=== FRAGS DU COMBAT (ID " .. displayId .. ") ===\n")
            end
            
            for _, pkm in ipairs(partyOrders[displayId]) do
                if pkm ~= "Inconnu" and pkm ~= "Non attribué" then
                    local kills = fragStats[displayId][pkm] or 0
                    trackerBuffer:print("- " .. pkm .. " : " .. kills .. " frag(s)\n")
                end
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
end

-- 8. Sauvegarde JSON
local function saveJSON()
    local file = io.open("frags_by_trainer.json", "w")
    if not file then return end
    
    local out = '{\n  "encounters": [\n'
    for i, tId in ipairs(trainerHistory) do
        out = out .. string.format('    {"trainerId": %d, "frags": {', tId)
        local fragParts = {}
        if partyOrders[tId] then
            for _, pkm in ipairs(partyOrders[tId]) do
                if pkm and pkm ~= "Inconnu" and pkm ~= "Non attribué" then
                    local kills = fragStats[tId][pkm] or 0
                    table.insert(fragParts, string.format('"%s": %d', pkm, kills))
                end
            end
        end
        out = out .. table.concat(fragParts, ", ") .. "}}"
        if i < #trainerHistory then out = out .. ",\n" else out = out .. "\n" end
    end
    out = out .. '  ]\n}'
    file:write(out)
    file:close()
end

-- 9. Ajout d'un frag
local function addFrag(pokemonName)
    if not currentTrainerId or currentTrainerId == 0 then return end
    
    if not pokemonName or pokemonName == "Inconnu" or pokemonName == "Non attribué" then
        dumpDetailedTraceback("Frag sur Pokémon Inconnu/Non attribué", "Nom: " .. tostring(pokemonName))
        return
    end
    
    local baseName = cleanPokemonName(pokemonName)
    if baseName == "Inconnu" then
        dumpDetailedTraceback("Nom Inconnu après nettoyage", "Nom d'origine: " .. tostring(pokemonName))
        return
    end
    
    if not fragStats[currentTrainerId] then fragStats[currentTrainerId] = {} end
    if not partyOrders[currentTrainerId] then partyOrders[currentTrainerId] = {} end
    
    local exists = false
    for _, name in ipairs(partyOrders[currentTrainerId]) do
        if name == baseName then exists = true; break end
    end
    if not exists then table.insert(partyOrders[currentTrainerId], baseName) end
    
    local currentKills = fragStats[currentTrainerId][baseName] or 0
    fragStats[currentTrainerId][baseName] = currentKills + 1
    forceRender = true 
end

-- 10. Détermination du tueur
local function getKillerName()
    local attackerId = emu:read8(gBattlerAttacker)
    local party = getParty and getParty()
    
    if not party then 
        dumpDetailedTraceback("getParty() indisponible lors du KO", "")
        return "Non attribué" 
    end
    
    local function getPkmName(partyIdx, sourceLabel)
        if partyIdx and partyIdx >= 0 and partyIdx < 6 then
            local pMon = party[partyIdx + 1] 
            if not pMon then
                dumpDetailedTraceback("Slot équipe vide lors du KO", string.format("Source: %s | Idx: %d", sourceLabel, partyIdx))
                return nil
            end
            
            local spId = resolveSpeciesId(pMon)
            if spId ~= 0 then
                local rawName = (mons and mons[spId])
                if not rawName then
                    dumpDetailedTraceback("SpeciesID inconnu dans table mons[]", string.format("SpeciesID: %d | Idx: %d", spId, partyIdx))
                    return "Inconnu"
                end
                return cleanPokemonName(rawName)
            end
        else
            dumpDetailedTraceback("Index équipe hors limites (>= 6)", string.format("Source: %s | Idx: %s", sourceLabel, tostring(partyIdx)))
        end
        return nil
    end

    if attackerId == 0 or attackerId == 2 then
        local partyIndex = getBattlerPartyIndex(attackerId)
        local name = getPkmName(partyIndex, "Attaquant direct (Battler " .. attackerId .. ")")
        if name and name ~= "Inconnu" then return name end
    end
    
    local partyIdx0 = getBattlerPartyIndex(0)
    local name0 = getPkmName(partyIdx0, "Fallback Battler 0")
    local battlersCount = emu:read8(gBattlersCount)
    
    if battlersCount <= 2 then
        if name0 and name0 ~= "Inconnu" then return name0 end
    else
        local partyIdx2 = getBattlerPartyIndex(2)
        local name2 = getPkmName(partyIdx2, "Fallback Battler 2")
        
        local pMon0 = party[partyIdx0 + 1]
        local pMon2 = party[partyIdx2 + 1]
        
        if pMon0 and pMon0.hp and pMon0.hp > 0 and name0 and name0 ~= "Inconnu" then return name0 end
        if pMon2 and pMon2.hp and pMon2.hp > 0 and name2 and name2 ~= "Inconnu" then return name2 end
        if name0 and name0 ~= "Inconnu" then return name0 end
    end

    dumpDetailedTraceback("Coup fatal non attribué", string.format("AttackerId brut: %d", attackerId))
    return "Non attribué"
end

-- 11. Export Box
local function exportBoxToTXT()
    local file = io.open("box_data.txt", "w")
    if not file then return end
    
    local out = ""
    if getParty then
        for _, mon in ipairs(getParty()) do
            local spId = resolveSpeciesId(mon)
            if spId ~= 0 and mons and mons[spId] ~= nil then
                local monName = cleanPokemonName(mons[spId])
                if monName ~= "Inconnu" then
                    out = out .. string.format(
                        "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                        monName,
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
    
    if storageLoc and readBoxMon then
        local boxBaseAddress = storageLoc + 4
        local totalBoxMons = 420 
        local slotSize = 84
        for i = 0, totalBoxMons - 1 do
            local address = boxBaseAddress + i * slotSize
            if emu:read32(address) ~= 0 then
                local mon = readBoxMon(address)
                local spId = resolveSpeciesId(mon)
                if spId ~= 0 and mons and mons[spId] ~= nil then
                    local monName = cleanPokemonName(mons[spId])
                    if monName ~= "Inconnu" then
                        out = out .. string.format(
                            "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                            monName,
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
    end
    file:write(out)
    file:close()
end

-- 12. Suivi de combat
local function trackCombatDirect()
    local outcome = emu:read8(gBattleOutcome)
    local tId_A = emu:read16(gTrainerBattleOpponent_A)
    local tId_B = emu:read16(gTrainerBattleOpponent_B)
    local bCount = emu:read8(gBattlersCount)
    local bFlags = emu:read32(gBattleTypeFlags)
    
    local isTrainerBattle = (math.floor(bFlags / 8) % 2 ~= 0)
    local inBattle = (bCount > 0 and outcome == 0 and tId_A ~= 0 and isTrainerBattle)
    
    -- DÉBUT DE COMBAT
    if inBattle and not wasInBattle then
        wasInBattle = true
        currentTrainerId = tId_A
        currentTrainerBId = tId_B
        lastTrainerDisplayId = tId_A
        
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
        
        if not partyOrders[currentTrainerId] then partyOrders[currentTrainerId] = {} end
        
        local party = getParty and getParty()
        if party then
            for idx, pMon in ipairs(party) do
                local spId = resolveSpeciesId(pMon)
                if spId ~= 0 then
                    local rawName = (mons and mons[spId])
                    local pkmName = cleanPokemonName(rawName)
                    
                    if pkmName == "Inconnu" then
                        dumpDetailedTraceback("Pokémon Inconnu au départ", string.format("Slot #%d (ID %d)", idx, spId))
                    else
                        if not fragStats[currentTrainerId][pkmName] then
                            fragStats[currentTrainerId][pkmName] = 0
                            table.insert(partyOrders[currentTrainerId], pkmName)
                        end
                    end
                end
            end
        end
        
        if currentTrainerBId ~= 0 then
            logToTracker(string.format("⚔️ Combat Duo lancé ! (IDs: %d & %d)", currentTrainerId, currentTrainerBId))
        else
            logToTracker("⚔️ Combat démarré ! (Dresseur " .. currentTrainerId .. ")")
        end
        
        for i = 1, 6 do
            local eMon = readPartyMon(gEnemyParty + (i - 1) * partyMonSize)
            lastEnemyHP[i] = (eMon and eMon.hp) or 0
        end
        
    -- FIN DE COMBAT
    elseif not inBattle and wasInBattle then
        wasInBattle = false
        logToTracker("🏁 Fin du combat. Sauvegarde...")
        saveJSON()
        currentTrainerId = 0
        currentTrainerBId = 0
        forceRender = true
    end
    
    -- PENDANT LE COMBAT
    if inBattle and currentTrainerId ~= 0 then
        for i = 1, 6 do
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
            else
                lastEnemyHP[i] = 0
            end
        end
    end

    frameCounter = frameCounter + 1
    if forceRender or frameCounter >= 45 then
        renderUI(bCount, outcome, tId_A, bFlags, isTrainerBattle, inBattle)
        forceRender = false
        frameCounter = 0
    end
end

local function initDirectTracker()
    trainerHistory = {}
    fragStats = {}
    partyOrders = {}
    saveJSON() 
    ensureBuffers()
    logToTracker("✅ Tracker prêt (Auto-Déchiffrement Actif)")
    renderUI(0, 0, 0, 0, false, false)
end

callbacks:add("start", initDirectTracker)
callbacks:add("frame", trackCombatDirect)

if emu then
    initDirectTracker()
end
