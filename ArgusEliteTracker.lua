local addonName, addonData = ...
local debugging = true

local function debug(...)
    if debugging then
        print(...)
    end
end

local HereBeDragonsPins = LibStub("HereBeDragons-Pins-1.0")

ArgusEliteTracker.frame = CreateFrame("frame", "ArgusEliteTrackerFrame", UIParent)
ArgusEliteTracker.addonData = addonData
local aet = ArgusEliteTracker.frame
local L = ArgusEliteTracker.L
local S = ArgusEliteTracker.S
local W = ArgusEliteTracker.W

local selectedSearchTermLanguage = GetLocale()

aetzonesdebug = nil
aetdebug = nil
local searching = false


local defaultFontName = "Fonts/FRIZQT__.TTF"
local plainBackdrop = {edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0.75, bgFile = [[Interface\Tooltips\UI-Tooltip-Background]], tileSize = 4, tile = false}


local zones = {
    krokuun = {
        { questId = 48564, name = L["Commander Endaxis"],          x = .4442, y = .5875, mapId = 1135, searchTerm = S["Commander Endaxis"] },           -- 1
        { questId = 48562, name = L["Commander Sathrenael"],       x = .3368, y = .7587, mapId = 1135, searchTerm = S["Commander Sathrenael"] },        -- 2
        { questId = 48563, name = L["Commander Vecaya"],           x = .3924, y = .5952, mapId = 1135, searchTerm = S["Commander Vecaya"] },            -- 3
        { questId = 48666, name = L["Imp Mother Laglath"],         x = .4153, y = .7026, mapId = 1135, searchTerm = S["Imp Mother Laglath"] },          -- 4
        { questId = 48561, name = L["Khazaduum"],                  x = .4507, y = .0896, mapId = 1135, searchTerm = S["Khazaduum"] },                   -- 5
        { questId = 48667, name = L["Naroua"],                     x = .7021, y = .3438, mapId = 1135, searchTerm = S["Naroua"] },                      -- 6
        { questId = 48627, name = L["Siegemaster Voraan"],         x = .5815, y = .7474, mapId = 1135, searchTerm = S["Siegemaster Voraan"] },          -- 7
        { questId = 48565, name = L["Sister Subversia"],           x = .5394, y = .3139, mapId = 1135, searchTerm = S["Sister Subversia"] },            -- 8
        { questId = 48628, name = L["Talestra the Vile"],          x = .5555, y = .8018, mapId = 1135, searchTerm = S["Talestra the Vile"] },           -- 9
        { questId = 48665, name = L["Tar Spitter"],                x = .6928, y = .8045, mapId = 1135, searchTerm = S["Tar Spitter"] },                 -- 10
        { questId = 48664, name = L["Tereck the Selector"],        x = .6927, y = .5886, mapId = 1135, searchTerm = S["Tereck the Selector"] },         -- 11
        { questId = 48629, name = L["Vagath the Betrayed"],        x = .6113, y = .2069, mapId = 1135, searchTerm = S["Vagath the Betrayed"] },         -- 12
   },
    antoranWastes = {
        { questId = 48817, name = L["Admiral Rel'var"],            x = .7362, y = .7079, mapId = 1171, searchTerm = S["Admiral Rel'var"] },             -- 1
        { questId = 48818, name = L["All-Seer Xanarian"],          x = .7530, y = .5681, mapId = 1171, searchTerm = S["All-Seer Xanarian"] },           -- 2
        { questId = 49183, name = L["Blistermaw"],                 x = .6178, y = .3697, mapId = 1171, searchTerm = S["Blistermaw"] },                  -- 3
        { questId = 48865, name = L["Chief Alchemist Munculus"],   x = .6091, y = .2275, mapId = 1171, searchTerm = S["Chief Alchemist Munculus"] },    -- 4
        { questId = 48816, name = L["Commander Texlaz"],           x = .8189, y = .6821, mapId = 1171, searchTerm = S["Commander Texlaz"] },            -- 5
        { questId = 48968, name = L["Doomcaster Suprax"],          x = .5849, y = .1180, mapId = 1171, searchTerm = S["Doomcaster Suprax"] },           -- 6
        { questId = 49241, name = L["Gar'zoth"],                   x = .5623, y = .4585, mapId = 1171, searchTerm = S["Gar'zoth"]},                     -- 7
        { questId = 48821, name = L["Houndmaster Kerrax"],         x = .6296, y = .2486, mapId = 1171, searchTerm = S["Houndmaster Kerrax"] },          -- 8
        { questId = 48815, name = L["Inquisitor Vethroz"],         x = .6068, y = .4767, mapId = 1171, searchTerm = S["Inquisitor Vethroz"] },          -- 9
        { questId = 48813, name = L["Lieutenant Xakaar"],          x = .6240, y = .5428, mapId = 1171, searchTerm = S["Lieutenant Xakaar"] },           -- 10
        { questId = 49240, name = L["Mistress Il'thendra"],        x = .5737, y = .3352, mapId = 1171, searchTerm = S["Mistress Il'thendra"] },         -- 12
        { questId = 48970, name = L["Mother Rosula"],              x = .6672, y = .1812, mapId = 1171, searchTerm = S["Mother Rosula"] },               -- 13
        { questId = 48809, name = L["Puscilla"],                   x = .6442, y = .2035, mapId = 1171, searchTerm = S["Puscilla"] },                    -- 14
        { questId = 48971, name = L["Rezira the Seer"],            x = .6503, y = .8231, mapId = 1171, searchTerm = S["Rezira the Seer"] },             -- 15
        { questId = 48967, name = L["Squadron Commander Vishax"],  x = .8372, y = .8114, mapId = 1171, searchTerm = S["Squadron Commander Vishax"] },   -- 16
        { questId = 48966, name = L["The Many-Faced Devourer"],    x = .5483, y = .3915, mapId = 1171, searchTerm = S["The Many-Faced Devourer"] },     -- 17
        { questId = 48812, name = L["Varga"],                      x = .6432, y = .4862, mapId = 1171, searchTerm = S["Varga"] },                       -- 18
        { questId = 48811, name = L["Ven'orn"],                    x = .6487, y = .5651, mapId = 1171, searchTerm = S["Ven'orn"] },                     -- 19
        { questId = 48824, name = L["Void Warden Valsuran"],       x = .5536, y = .2166, mapId = 1171, searchTerm = S["Void Warden Valsuran"] },        -- 20
        { questId = 48810, name = L["Vrax'thul"],                  x = .5306, y = .3612, mapId = 1171, searchTerm = S["Vrax'thul"] },                   -- 21
        { questId = 48822, name = L["Watcher Aival"],              x = .5273, y = .3003, mapId = 1171, searchTerm = S["Watcher Aival"] },               -- 22
        { questId = 48820, name = L["Worldsplitter Skuul"],        x = .5090, y = .5580, mapId = 1171, searchTerm = S["Worldsplitter Skuul"] },         -- 23
        { questId = 48814, name = L["Wrath-Lord Yarez"],           x = .6177, y = .6453, mapId = 1171, searchTerm = S["Wrath-Lord Yarez"] },            -- 24
   },
    macAree = {
        { questId = 48709, name = L["Ataxon"],                     x = .3012, y = .4018, mapId = 1170, searchTerm = S["Ataxon"] },                      -- 1
        { questId = 48700, name = L["Baruut the Bloodthirsty"],    x = .4365, y = .6072, mapId = 1170, searchTerm = S["Baruut the Bloodthirsty"] },     -- 2
        { questId = 48707, name = L["Captain Faruq"],              x = .2683, y = .3046, mapId = 1170, searchTerm = S["Captain Faruq"] },               -- 3
        { questId = 48720, name = L["Commander Xethgar"],          x = .5670, y = .1477, mapId = 1170, searchTerm = S["Commander Xethgar"] },           -- 4
        { questId = 48702, name = L["Feasel the Muffin Thief"],    x = .4120, y = .1178, mapId = 1170, searchTerm = S["Feasel the Muffin Thief"] },     -- 5
        { questId = 48711, name = L["Herald of Chaos"],            x = .3580, y = .5897, mapId = 1170, searchTerm = S["Herald of Chaos"] },             -- 6
        { questId = 48718, name = L["Instructor Tarahna"],         x = .6172, y = .5031, mapId = 1170, searchTerm = S["Instructor Tarahna"] },          -- 7
        { questId = 48713, name = L["Jed'hin Champion Vorusk"],    x = .4838, y = .4106, mapId = 1170, searchTerm = S["Jed'hin Champion Vorusk"] },     -- 8
        { questId = 48697, name = L["Kaara the Pale"],             x = .3866, y = .5560, mapId = 1170, searchTerm = S["Kaara the Pale"] },              -- 9
        { questId = 48714, name = L["Overseer Y'Beda"],            x = .5863, y = .3808, mapId = 1170, searchTerm = S["Overseer Y'Beda"] },             -- 10
        { questId = 48717, name = L["Overseer Y'Morna"],           x = .6084, y = .3041, mapId = 1170, searchTerm = S["Overseer Y'Morna"] },--jens :'D     11
        { questId = 48716, name = L["Overseer Y'Sorna"],           x = .5801, y = .3116, mapId = 1170, searchTerm = S["Overseer Y'Sorna"] },            -- 12
        { questId = 48712, name = L["Sabuul"],                     x = .4355, y = .4919, mapId = 1170, searchTerm = S["Sabuul"] },                      -- 13
        { questId = 48692, name = L["Shadowcaster Voruun"],        x = .4476, y = .7173, mapId = 1170, searchTerm = S["Shadowcaster Voruun"] },         -- 14
        { questId = 48721, name = L["Skreeg the Devourer"],        x = .4979, y = .0940, mapId = 1170, searchTerm = S["Skreeg the Devourer"] },         -- 15
        { questId = 48935, name = L["Slithon the Last"],           x = .4976, y = .5288, mapId = 1170, searchTerm = S["Slithon the Last"] },            -- 16
        { questId = 48710, name = L["Sorolis the Ill-Fated"],      x = .7025, y = .4608, mapId = 1170, searchTerm = S["Sorolis the Ill-Fated"] },       -- 17
        { questId = 48693, name = L["Soultwisted Monstrosity"],    x = .5277, y = .6723, mapId = 1170, searchTerm = S["Soultwisted Monstrosity"] },     -- 18
        { questId = 48706, name = L["Turek the Lucid"],            x = .3911, y = .6662, mapId = 1170, searchTerm = S["Turek the Lucid"] },             -- 19
        { questId = 48708, name = L["Umbraliss"],                  x = .3492, y = .3724, mapId = 1170, searchTerm = S["Umbraliss"] },                   -- 20
        { questId = 48705, name = L["Venomtail Skyfin"],           x = .3401, y = .4783, mapId = 1170, searchTerm = S["Venomtail Skyfin"] },            -- 21
        { questId = 48704, name = L["Vigilant Kuro"],              x = .6388, y = .6425, mapId = 1170, searchTerm = S["Vigilant Kuro"] },               -- 22
        { questId = 48703, name = L["Vigilant Thanos"],            x = .3632, y = .2371, mapId = 1170, searchTerm = S["Vigilant Thanos"] },             -- 23
        { questId = 48695, name = L["Wrangler Kravos"],            x = .5565, y = .5995, mapId = 1170, searchTerm = S["Wrangler Kravos"] },             -- 24
        { questId = 48719, name = L["Zul'tan the Numerous"],       x = .6653, y = .2851, mapId = 1170, searchTerm = S["Zul'tan the Numerous"] },        -- 25
    }
}

-- /run print(GetCurrentMapAreaID())
local events = {}
ArgusEliteTracker.eliteNameMap = {}
local zoneIds = { krokuun = 1135, antoranWastes = 1171, macAree = 1170 }
local selectedZone = zones.krokuun
local selectedZoneName = "krokuun"
local groupCreationActive = false

local tooltip = CreateFrame("GameTooltip", addonName.."Tooltip", UIParent, "GameTooltipTemplate")

aet.quests = {
    -- questId = elite
}

aet.groups = {
    -- groupId = { elite }
}


if debugging then
    aetzonesdebug = zones
    aetdebug = aet
end


local function resetAll()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.searchResults = 0
            elite:SetNa()
        end
    end
end


local function addCommanderOfArgusIds()

    local count = GetAchievementNumCriteria(12078)
    local commanderTracker = {}
    
    for index = 1, count, 1 do
        local name,_,completed = GetAchievementCriteriaInfo(12078, index)
        commanderTracker[L[name]] = index
   end

    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.coaId = commanderTracker[elite.name]
            elite:Update()
        end
    end
end


-- local function UpdateKilledStatusForAll()
--     for name, elites in pairs(zones) do
--         for i, elite in pairs(zones[name]) do
--             elite.killed = IsQuestFlaggedCompleted(elite.questId)
--         end
--     end
-- end

numberOfHidden = 0


function ArgusEliteTracker:hideFiltered()

    if editMode then
        for _, elite in pairs(selectedZone) do
            elite.hidden = false
        end
        return 0
    end


    ArgusEliteTracker:updateWorldQuestsForAllArgusZones()
    numberOfHidden = 0
    hiddenElites = {}

    local function hideElite(elite)
        if not hiddenElites[elite.name] then
            hiddenElites[elite.name] = true
            numberOfHidden = numberOfHidden + 1
        end
        elite.hidden = true
    end

    local function showElite(elite)
        if hiddenElites[elite.name] then
            hiddenElites[elite.name] = nil
            numberOfHidden = numberOfHidden - 1
        end
        elite.hidden = false
    end

    for i, elite in ipairs(selectedZone) do
        elite.hidden = false

        if ArgusEliteTrackerConfig.onlyShowElitesWithGroups then
            if elite.searchResults < 1 then
                hideElite(elite)
            else
                showElite(elite)
            end
        end

        if ArgusEliteTrackerConfig.hideKilledElites then
            if elite.killed then
                hideElite(elite)
            end
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled then
            if elite.isWq then
                if elite.hidden then
                    showElite(elite)
                end
            end

            if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden then
                if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
                    showElite(elite)
                end
            end
        end

        if ArgusEliteTrackerConfig.commanderOfArgusMode then
            hideElite(elite)
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden then
            if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
                if elite.isWq then
                    showElite(elite)
                else
                    hideElite(elite)
                end
            end
        else
            if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
                hideElite(elite)
            end
        end
    end

    return numberOfHidden
end

-- ArgusEliteTracker.hideFiltered = function()
--     if editMode then
--         for k,elite in pairs(selectedZone) do
--             elite.hidden = false
--         end
--         return 0
--     end

--     numberOfHidden = 0

--     for i, elite in ipairs(selectedZone) do
--         elite.hidden = false
--         hiddenElites = {}

--         local function hideElite(elite)
--             debug("CALLED HIDE ELITE")
--             local exists = hiddenElites[elite.name] ~= nil

--             if not exists then
--                 debug(elite.name, " was not hidden")
--                 hiddenElites[elite.name] = true
--                 elite.hidden = true
--                 numberOfHidden = numberOfHidden + 1
--                 debug("number of hidden: ", numberOfHidden)
--             end
--             return exists
--         end

--         -- doesn't trigger
--         if ArgusEliteTrackerConfig.onlyShowElitesWithGroups then
--             if elite.searchResults < 1 then
--                 hideElite(elite)
--             end
--         end

--         -- doesn't trigger
--         if ArgusEliteTrackerConfig.hideKilledElites == true then
--             if elite.killed then
--                 hideElite(elite)
--             end
--         end

--         -- does trigger
--         if ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled then
--             -- does trigger
--             if elite.isWq then
--                 -- doesn't trigger because nothing before it has been triggered
--                 if elite.hidden then
--                     debug("elite is already hidden in wq")
--                     if hideElite(elite) then
--                         debug("elite was hidden in elite.isWq.elite.hidden.hideElite")
--                         numberOfHidden = numberOfHidden - 1
--                     end
--                     debug("unhiding elite")
--                     elite.hidden = false
--                 end
--                 -- does trigger because elite has been killed
--                 if elite.killed then
--                     debug("elite has been killed in wq")
--                     -- doesn't trigger because option isn't enabled
--                     if ArgusEliteTrackerConfig.hideKilledElites then
--                         debug("hideKilledElites is on")
--                         if hideElite(elite) then
--                             debug("elite was hidden, decrease numberofhidden")
--                             numberOfHidden = numberOfHidden -1
--                         end
--                         debug("hiding elite")
--                         elite.hidden = true
--                     -- triggers
--                     else
--                         debug("hideKilledElites is off")
--                         -- hides elite + 1 hidden
--                         if not hideElite(elite)then
--                             debug("elite was not hidden in eliteiswq.elite.killed.else.hideelite")
--                             numberOfHidden = numberOfHidden -1
--                         end
--                         debug("unhiding elite")
--                         elite.hidden = false
--                     end
--                 end
--                 -- doesn't trigger because option isn't enabled
--                 if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden then
--                     if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
--                         if elite.hidden then
--                             numberOfHidden = numberOfHidden - 1
--                         end
--                         elite.hidden = false
--                     end
--                 end
--             end
--         end

--         -- doesn't trigger
--         if ArgusEliteTrackerConfig.commanderOfArgusMode then
--             if elite.coaComplete then
--                 hideElite(elite)
--             end
--         end

--         -- doesn't trigger
--         if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden then
--             if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
--                 if elite.isWq then
--                     if elite.hidden then
--                         numberOfHidden = numberOfHidden - 1
--                     end
--                     elite.hidden = false
--                 else
--                     hideElite(elite)
--                 end
--             end
--         else
--             if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
--                 if not elite.hidden then
--                     numberOfHidden = numberOfHidden + 1
--                 end
--                 elite.hidden = true
--             end
--         end
--     end

--     return numberOfHidden
-- end

-- local HideFiltered = ArgusEliteTracker.hideFiltered

function updateArgusEliteTrackerMapIcons(elite)

    if ArgusEliteTrackerConfig.disableMapIcons then
        return
    end

    if not(elite == nil) then
        elite:UpdateMapIcon()
        return
    end

    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite:UpdateMapIcon()
        end
    end
end

-- You're my man
function updateArgusEliteTrackerFrame()
    -- UpdateKilledStatusForAll()

    aet.elitesContainer:ClearAllPoints()
    aet.elitesContainer.krokuun:ClearAllPoints()
    aet.elitesContainer.antoranWastes:ClearAllPoints()
    aet.elitesContainer.macAree:ClearAllPoints()

    numberOfHidden = ArgusEliteTracker:hideFiltered()
    local height = ((#selectedZone - numberOfHidden) * 16) + 50

    local visibleCounter = 1
    local beginOffset = -25

    if ArgusEliteTrackerConfig.growUpwards then
        beginOffset = 5
    end


    for i, elite in ipairs(selectedZone) do
        local yOffset = beginOffset + (-(visibleCounter * 16))

        if not elite.hidden then
            elite:Show(yOffset)
            visibleCounter = visibleCounter + 1
        else
            elite:Hide()
        end

        if not searching then
            elite:Update()
        end
    end

    if ArgusEliteTrackerConfig.growUpwards then
        aet.elitesContainer:SetPoint("BOTTOMLEFT", aet, "TOPLEFT", 0, -2)
        aet.elitesContainer.krokuun:SetPoint("TOPLEFT", aet.elitesContainer, "BOTTOMLEFT", 10, 30)
        aet.elitesContainer.krokuun:SetSize(W.ZoneKrokuunButtonWidth, W.ZoneButtonHeight)
        aet.elitesContainer.antoranWastes:SetPoint("TOPLEFT", aet.elitesContainer, "BOTTOMLEFT", aet.elitesContainer:GetWidth() / 2 - W.ZoneAntoranWastesButtonWidth / 2, 30)
        aet.elitesContainer.antoranWastes:SetSize(W.ZoneAntoranWastesButtonWidth, W.ZoneButtonHeight)
        aet.elitesContainer.macAree:SetPoint("BOTTOMRIGHT", aet.elitesContainer, "BOTTOMRIGHT", -10, 10)
        aet.elitesContainer.macAree:SetSize(W.ZoneMacAreeButtonWidth, W.ZoneButtonHeight)
        -- aet.elitesContainer:SetPoint("BOTTOMLEFT", aet.zonesContainer, "TOPLEFT", 0, 0)
        -- aet.elitesContainer:SetPoint("TOPLEFT", 0, -18)
    else
        aet.elitesContainer:SetPoint("TOPLEFT", 0, -24)
        aet.elitesContainer.krokuun:SetPoint("TOPLEFT", aet.elitesContainer, "TOPLEFT", 10, -10)
        aet.elitesContainer.krokuun:SetSize(W.ZoneKrokuunButtonWidth, W.ZoneButtonHeight)
        aet.elitesContainer.antoranWastes:SetPoint("TOPLEFT", aet.elitesContainer, "TOPLEFT", aet.elitesContainer:GetWidth() / 2 - W.ZoneAntoranWastesButtonWidth / 2, -10)
        aet.elitesContainer.antoranWastes:SetSize(W.ZoneAntoranWastesButtonWidth, W.ZoneButtonHeight)
        aet.elitesContainer.macAree:SetPoint("TOPRIGHT", aet.elitesContainer, "TOPRIGHT", -10, -10)
        aet.elitesContainer.macAree:SetSize(W.ZoneMacAreeButtonWidth, W.ZoneButtonHeight)
    end
    aet.elitesContainer:SetHeight(height)
end


local function playerIsOnArgus()
    local currentMapId, _ = GetCurrentMapAreaID()
    local onArgus = false

    for i, v in pairs(zoneIds) do
        if zoneIds[i] == currentMapId then
            onArgus = true
        end
    end
    
    -- because wtf :s
    if onArgus == false then
        if currentMapId == 1184 then onArgus = true end
    end

    return onArgus
end


local function hideZone(zone)
    for i, elite in ipairs(zones[zone]) do
        elite:Hide()
    end
end


local function disableAllButtons()
    aet.SearchAll:EnableMouse(false)
    aet.SearchAll.Label:SetTextColor(1, 1, 1, 0.2)

    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.button:EnableMouse(false)
            elite.button.Label:SetTextColor(1, 1, 1, 0.2)
            elite.cButton:EnableMouse(false)
            elite.cButton.Label:SetTextColor(1, 1, 1, 0.2)
            elite.jButton:EnableMouse(false)
            elite.jButton.Label:SetTextColor(1, 1, 1, 0.2)
        end
    end
end


local function enableAllButtons()
    aet.SearchAll:EnableMouse(true)
    aet.SearchAll.Label:SetTextColor(1, 1, 1, 0.90)

    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.button:EnableMouse(true)
            elite.button.Label:SetTextColor(1, 1, 1, 1)
            elite.cButton:EnableMouse(true)
            elite.cButton.Label:SetTextColor(1, 1, 1, 1)
            elite.jButton:EnableMouse(true)
            elite.jButton.Label:SetTextColor(1, 1, 1, 1)
        end
    end
end


function ArgusEliteTracker:updateWorldQuests(elites, zoneId)
    SetMapByID(zoneId)
    local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(zoneId)
    local worldQuestNames = {}

    if taskInfo ~= nil then
        for i, info in ipairs(taskInfo) do
            local questName = C_TaskQuest.GetQuestInfoByQuestID(info.questId)
            if questName ~= nil then
                table.insert(worldQuestNames, { questName = questName, questId = info.questId })
            end
        end

        for i, elite in ipairs(elites) do
            elite.isWq = false
            elite.wqId = nil
            for index = 1, #worldQuestNames do
                if worldQuestNames[index].questName:lower():find(elite.name:lower(), 1, true) then
                    elite.isWq = true
                    elite.wqId = worldQuestNames[index].questId
                end
            end
        end
    end
end


function ArgusEliteTracker:updateWorldQuestsForAllArgusZones()
    local currentMapOpen = GetCurrentMapAreaID()

    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        ArgusEliteTracker:updateWorldQuests(elites, zoneId)
    end

    SetMapByID(currentMapOpen)
end


local function resetAllGroups()
    for name, _ in pairs(zones) do
        for _, elite in pairs(zones[name]) do
            table.wipe(elite.groups)
        end
    end
end

local function addTomTomWaypoint(elite)
    elite.tomtom = TomTom:AddMFWaypoint(elite.mapId, true, elite.x, elite.y, { title = elite.name })
    TomTom:SetClosestWaypoint()
end


------------------------------------
--  Search all groups
------------------------------------

local function searchForAllGroupsCallback()

    searching = false
    resetAll()
    enableAllButtons()
    ArgusEliteTracker:updateWorldQuestsForAllArgusZones()
    resetAllGroups()

    local numResults, resultTable = C_LFGList.GetSearchResults()
     -- Blizzard wut, resultTable has a limit of 100,
     -- but numResults shows over 100 results was found (highest I had was 180 something)

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local  id, activityId, groupName, comment, voiceChat, iLvl,
                honorLevel, age, numBNetFriends, numCharFriends, numGuildMates, isDelisted = C_LFGList.GetSearchResultInfo(resultId);
        
        groupName = groupName:lower()
        local ageInMinutes = age / 60

        for name, _ in pairs(zones) do
            for _, elite in pairs(zones[name]) do
                -- elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE

                if not elite.killed then
                    elite:SetNa()
                    
                    if elite.isWq then
                        addTomTomWaypoint(elite)
                    end
                end

                local found = false
                
                for locale, searchTerm in pairs(elite.searchTerm) do
                    if groupName:find(searchTerm, 1, true) and not isDelisted and ageInMinutes < 15 then
                        aet.groups[id] = elite
                        elite.groups[id] = { id = id, age = age }
                        elite.searchResults = elite.searchResults + 1
                        found = true

                        if name == selectedZoneName and elite.killed == false then
                            addTomTomWaypoint(elite)
                        end

                        break
                    end
                end

                if found then break end
            end
        end
    end

    updateArgusEliteTrackerFrame()
    updateArgusEliteTrackerMapIcons()
end


local function searchForAll()
    updateArgusEliteTrackerFrame()
    updateArgusEliteTrackerMapIcons()

    searching = true
    disableAllButtons()
    local languages = C_LFGList.GetLanguageSearchFilter()

    local filter = {}

    for localeFilter, value in pairs(ArgusEliteTrackerConfig.searchAllConfig) do
        if value == true then
            filter[localeFilter] = true
        end
    end

    -- filter.WhRh = true


    -- Need to understand this better, seems like there's a limit to 100 responses
    -- C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(""), 0, 0, languages)
    C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(""), 0, 0, filter)
    C_Timer.After(2, searchForAllGroupsCallback)
end


------------------------------------
--  Search for one group
------------------------------------
local function updateSearchedElite(elite)

    searching = false
    enableAllButtons()
    resetAllGroups()
    elite.searchResults = 0

    local numResults, resultTable = C_LFGList.GetSearchResults()

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local id, activityId, groupName, comment, voiceChat, iLvl, honorLevel,
            age, numBNetFriends, numCharFriends, numGuildMates, isDelisted = C_LFGList.GetSearchResultInfo(resultId);

        groupName = groupName:lower()

        local ageInMinutes = age / 60
        
        for locale, searchTerm in pairs(elite.searchTerm) do
            if groupName:find(searchTerm, 1, true) and not isDelisted and ageInMinutes < 15 then
                aet.groups[id] = elite
                elite.groups[id] = { id = id, age = age }
                elite.searchResults = elite.searchResults + 1
                break
            end
        end
    end

    updateArgusEliteTrackerFrame()
    updateArgusEliteTrackerMapIcons(elite)
end


local function searchForGroup(elite)

    searching = true
    ArgusEliteTracker:updateWorldQuestsForAllArgusZones()
    elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE
    local languages = C_LFGList.GetLanguageSearchFilter()

    debug("Searching with".." "..elite.searchTerm[ArgusEliteTrackerConfig.SearchWithLanguage])

    if elite.isWq and elite.wqId ~= nil then
        C_LFGList.Search(1, LFGListSearchPanel_ParseSearchTerms(elite.searchTerm[ArgusEliteTrackerConfig.SearchWithLanguage]), 0, 0, languages)
    else
        C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(elite.searchTerm[ArgusEliteTrackerConfig.SearchWithLanguage]), 0, 0, languages)
    end

    disableAllButtons()
    C_Timer.After(2, function() 
        updateSearchedElite(elite)
    end)
end


-- local function remakeTomTomWaypoints()
--     if TomTom and IsAddOnLoaded("TomTom") then

--         for name, elites in pairs(zones) do
--             for i, elite in pairs(zones[name]) do

--                 if not elite.killed then
--                     elite.tomtom = TomTom:AddMFWaypoint(elite.mapId, false, elite.x, elite.y, { title = elite.name })
--                     TomTom:SetClosestWaypoint()
--                 end
--                 if elite.tomtom then
--                     TomTom:RemoveWaypoint(elite.tomtom)
--                     elite.tomtom = nil
--                 end
        
                

--             end
--         end

        
--     end
-- end



local function initiateSingleSearch(self, button)
    local elite = self.elite

    if(button == "LeftButton") then
        elite.searchResults = 0
        elite:SetNa()
        searchForGroup(elite)
    elseif button == "RightButton" then
        if TomTom and IsAddOnLoaded("TomTom") then
            if elite.tomtom then
                TomTom:RemoveWaypoint(elite.tomtom)
                elite.tomtom = nil
            end

            elite.tomtom = TomTom:AddMFWaypoint(elite.mapId, false, elite.x, elite.y, { title = elite.name })
            TomTom:SetClosestWaypoint()
        end
    end
end

local function CreateBackDrop(frame, alpha)
    -- frame:SetBackdrop({
    --     bgFile = [[Interface/AddOns/nAuras/Media/Plain]], 
    --     edgeFile = [[Interface/AddOns/nAuras/Media/Plain]], 
    --     edgeSize = 2, 
    -- })
    -- frame:SetBackdropColor(0.15, 0.15, 0.15, 1)
    -- frame:SetBackdropBorderColor(1, 1, 1, 0)
end

local function eliteWorldmap_OnEnter(self)
    
    local elite = self.elite
    tooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
    tooltip:SetText(elite.name)


    if elite.killed then
        tooltip:AddLine("Killed", 0, 1, 0)
    else
        tooltip:AddLine("Not killed", 1, 0, 0)
    end

    if elite.isWq then
        tooltip:AddLine("Is World Quest", 1, 1, 0)
    end

    if elite.searchResults > 0 then
        tooltip:AddLine("Is available", 0, 1, 0)
    else
        tooltip:AddLine("Is not available", 1, 0, 0)
    end

    tooltip:AddLine("Coordinates: ("..elite.x..","..elite.y..")", 1, 1, 1)
    tooltip:Show()
end

local function eliteWorldmap_OnLeave()
    tooltip:Hide()
end

local function eliteWorldmap_OnClick(self)
    searchForGroup(self.elite)
end

function createIconForArgusEliteTrackerElite(elite)

    local bgFrame = CreateFrame("Button", nil, WorldMapButton)
    bgFrame:SetPoint("CENTER", WorldMapButton, "CENTER", WorldMapButton)
    bgFrame:SetSize(27,27)
    bgFrame:SetFrameLevel(WorldMapButton:GetFrameLevel() + 99999)
    bgFrame:SetFrameStrata(WorldMapButton:GetFrameStrata())

    local iconTable = UnitPopupButtons.RAID_TARGET_8
    local bgTexture = bgFrame:CreateTexture(nil, "OVERLAY")
    bgTexture:SetTexCoord(iconTable.tCoordLeft, iconTable.tCoordRight, iconTable.tCoordTop, iconTable.tCoordBottom)
    bgTexture:SetTexture(iconTable.icon)
    bgTexture:ClearAllPoints()
    bgTexture:SetAllPoints(bgFrame)
    bgFrame.texture = bgTexture

    local frame = CreateFrame("Button", nil, bgFrame)
    frame:SetPoint("CENTER", bgFrame, "CENTER", bgFrame)
    frame:SetSize(20,20)
    frame:SetFrameLevel(bgFrame:GetFrameLevel() + 100000)
    frame:SetFrameStrata(bgFrame:GetFrameStrata())

    local texture = frame:CreateTexture(nil, "OVERLAY")
    
    texture:SetTexCoord(iconTable.tCoordLeft, iconTable.tCoordRight, iconTable.tCoordTop, iconTable.tCoordBottom)
    texture:SetTexture(iconTable.icon)
    texture:ClearAllPoints()
    texture:SetAllPoints(frame)
    frame.texture = texture

    bgFrame:EnableMouse()
    bgFrame:SetScript("OnEnter", eliteWorldmap_OnEnter)
    bgFrame:SetScript("OnLeave", eliteWorldmap_OnLeave)
    bgFrame:SetScript("OnClick", eliteWorldmap_OnClick)
    frame:EnableMouse()
    frame:SetScript("OnEnter", eliteWorldmap_OnEnter)
    frame:SetScript("OnLeave", eliteWorldmap_OnLeave)
    frame:SetScript("OnClick", eliteWorldmap_OnClick)

    frame:Show()
    bgFrame:Hide()
    elite.hbmIcon = bgFrame
    bgFrame.elite = elite
    frame.elite = elite
    elite.hbmIcon.name = addonName..elite.name
    CreateBackDrop(frame, 1)
end

function disableIconForArgusEliteTrackerElite(elite)
    HereBeDragonsPins:RemoveAllWorldMapIcons(addonName)
end

function enableArgusEliteTrackerMapIcons()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            createIconForArgusEliteTrackerElite(elite)
            HereBeDragonsPins:AddWorldMapIconMF(addonName, elite.hbmIcon, elite.mapId, nil, elite.x, elite.y)
        end
    end
end

function disableArgusEliteTrackerMapIcons()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            disableIconForArgusEliteTrackerElite(elite)
        end
    end
end


-- LFGList.lua l730
-- local activities = C_LFGList.GetAvailableActivities(self.selectedCategory, 0, bit.bor(self.baseFilters, self.selectedFilters));
-- LFGList.lua l884
-- if(C_LFGList.CreateListing(activityID, name, itemLevel, honorLevel, voiceChatInfo, description, autoAccept, privateGroup, questID)) then

local function initiateZones()

    debug(UnitPopupButtons.RAID_TARGET_8)


    local yOffset = W.EliteYOffset
    local statusWidth = W.EliteStatusWidth
    local counter = 0

    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        ArgusEliteTracker:updateWorldQuests(elites, zoneId)

        for i, elite in pairs(zones[name]) do
            local name = elite.name
            local buttonText = elite.name

            ArgusEliteTracker.eliteNameMap[name] = elite

            elite.searchResults = 0
            elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE
            elite.groups = {}

            local eliteIsForceHidden = ArgusEliteTrackerConfig.forceHidden[elite.questId]

            if eliteIsForceHidden == nil then
                ArgusEliteTrackerConfig.forceHidden[elite.questId] = false
            end


            elite.cButton = CreateFrame("button", nil, aet.elitesContainer)
            elite.cButton:SetBackdrop(plainBackdrop)
            elite.cButton:SetBackdropColor(0, 0, 0, 0)
            elite.cButton:SetBackdropBorderColor(0, 0, 1, 0)
            elite.cButton:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.cButton:SetSize(W.GroupButtonWidth, W.EliteButtonsHeight)
            elite.cButton.Label = addonData:createLabel(L["Create"], W.FontSizeBig, "CENTER", elite.cButton)
            elite.cButton.elite = elite
            elite.cButton:SetScript("OnClick", function(self)
                self.elite:CreateGroup()
            end)


            elite.jButton = CreateFrame("button", nil, aet.elitesContainer)
            elite.jButton:SetBackdrop(plainBackdrop)
            elite.jButton:SetBackdropColor(0, 0, 0, 0)
            elite.jButton:SetBackdropBorderColor(1, 1, 1, 0)
            elite.jButton:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.jButton:SetSize(W.GroupButtonWidth, W.EliteButtonsHeight)
            elite.jButton.Label = addonData:createLabel(L["Join"], W.FontSizeBig, "CENTER", elite.jButton)
            elite.jButton.elite = elite
            elite.jButton:SetScript("OnClick", function(self) 
                self.elite:ApplyToGroup()
            end)


            elite.lButton = CreateFrame("button", nil, aet.elitesContainer)
            elite.lButton:SetBackdrop(plainBackdrop)
            elite.lButton:SetBackdropColor(0, 0, 0, 0)
            elite.lButton:SetBackdropBorderColor(1, 1, 1, 0)
            elite.lButton:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.lButton:SetSize(W.GroupButtonWidth, W.EliteButtonsHeight)
            elite.lButton.Label = addonData:createLabel(L["Leave"], W.FontSizeBig, "CENTER", elite.lButton)
            elite.lButton.elite = elite
            elite.lButton:SetScript("OnClick", function(self) 
                self.elite:LeaveGroup()
            end)


            elite.button = CreateFrame("button", nil, aet.elitesContainer)
            elite.button:SetBackdrop(plainBackdrop)
            elite.button:SetBackdropColor(0, 0, 0, 0)
            elite.button:SetBackdropBorderColor(1, 0, 0, 0)
            elite.button:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.button:SetSize(aet:GetWidth() - W.GroupButtonWidth - statusWidth - 30, W.EliteButtonsHeight)
            elite.button.Label = addonData:createLabel(buttonText, W.FontSizeBig, "CENTER", elite.button)
            elite.button.elite = elite
            elite.button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            elite.button:SetScript("OnClick", initiateSingleSearch)


            elite.status = CreateFrame("Frame", addonName, aet.elitesContainer)
            elite.status:SetBackdrop(plainBackdrop)
            elite.status:SetBackdropColor(0, 0, 0, 0)
            elite.status:SetBackdropBorderColor(0, 1, 0, 0)
            elite.status:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.status:SetSize(statusWidth, W.EliteButtonsHeight)
            elite.status.Label = addonData:createLabel(L["N/A"], W.FontSizeBig, "CENTER", elite.status)


            if not(ArgusEliteTrackerConfig.disableMapIcons) then
                createIconForArgusEliteTrackerElite(elite)
            end

            -- aet.elitesContainer:SetSize(W.ElitesContainerWidth, W.ElitesContainerHeight)
            -- aet.elitesContainer:SetBackdrop(plainBackdrop)
            -- aet.elitesContainer:SetBackdropColor(0, 0, 0, 1)
            -- aet.elitesContainer:SetBackdropBorderColor(1, 1, 1, 0)

            -- elite.hbmframe = CreateFrame("Frame", addonName.."icon"..counter, WorldMapButton)
            -- elite.hbmframe:SetBackdrop(plainBackdrop)
            -- elite.hbmframe:SetBackdropColor(0,0,0,1)
            -- elite.hbmframe:SetBackdropBorderColor(1,1,1,0)
            -- elite.hbmframe:SetFrameStrata(WorldMapButton:GetFrameStrata())
            -- elite.hbmframe:SetFrameLevel(WorldMapButton:GetFrameLevel() + 1)
            -- elite.hbmframe:SetSize(100, 100)
            -- elite.hbmframe:SetPoint("CENTER", WorldMapButton, "CENTER")

            -- local texture = elite.hbmframe:CreateTexture(nil, "OVERLAY")
            -- local icon = UnitPopupButtons.RAID_TARGET_8
            -- elite.hbmframe.texture = texture
            -- texture:SetAllPoints(elite.hbmframe)
            -- texture:SetTexCoord(icon.tCoordLeft, icon.tCoordRight, icon.tCoordTop, icon.tCoordBottom)
            -- elite.hbmframe.texture:SetVertexColor(1,1,1,1)
            -- texture:SetTexture(icon)
            -- texture:ClearAllPoints()
            -- texture:SetAllPoints(elite.hbmframe)
            -- debug(UnitPopupButtons.RAID_TARGET_8)

            

            -- elite.hbmframe:Hide()
            -- elite.hbmframe.label = addonData.createLabel("HALLO", W.FontSizeBig, "CENTER", elite.hbmframe)
            if not(ArgusEliteTrackerConfig.disableMapIcons) then
                HereBeDragonsPins:AddWorldMapIconMF(addonName, elite.hbmIcon, elite.mapId, nil, elite.x, elite.y)
            end
            
            
            -- UnitPopupButtons.RAID_TARGET_8

            function elite:Hide()
                self.cButton:Hide()
                self.jButton:Hide()
                self.lButton:Hide()
                self.button:Hide()
                self.status:Hide()
            end


            function elite:Show(yOffset)
                if yOffset ~= nil then
                    self.cButton:SetPoint("topleft", aet.elitesContainer, "topleft", 10, yOffset)
                    self.jButton:SetPoint("topleft", aet.elitesContainer, "topleft", 10, yOffset)
                    self.lButton:SetPoint("topleft", aet.elitesContainer, "topleft", 10, yOffset)
                    self.button:SetPoint("topleft", aet.elitesContainer, "topleft", 4 + self.cButton:GetWidth() + 10, yOffset)
                    self.status:SetPoint("topright", aet.elitesContainer, "topright", -10, yOffset)
                end

                -- self:UpdateGroupButtons()
                self:UpdateGroups()
                self.button:Show()
                self.status:Show()
            end


            function elite:GetGroupCount()
                local counter = 0
                for id, value in pairs(self.groups) do
                    counter = counter + 1
                end
                return counter
            end


            function elite:GetApplied()
                local counter = 0
                for id, value in pairs(self.groups) do
                    if value.applied then
                        counter = counter + 1
                    end
                end
                return counter
            end


            function elite:RemoveInvalidGroups()
                local toRemove = {}

                for k,v in pairs(self.groups) do
                    local id = select(1, C_LFGList.GetSearchResultInfo(k))

                    if id == nil then
                        table.insert(toRemove, id)
                    end
                end

                for k,v in pairs(toRemove) do
                    self.groups[v] = nil
                end
            end


            function elite:EnableCreateGroup()
                if searching then return end

                groupCreationActive = select(1, C_LFGList.GetActiveEntryInfo())
                if groupCreationActive then return end

                self.cButton:EnableMouse(true)
                self.cButton.Label:SetTextColor(1, 1, 1, 1)
            end

            function elite:DisableCreateGroup()
                self.cButton:EnableMouse(false)
                self.cButton.Label:SetTextColor(1, 1, 1, 0.2)
            end

            function elite:EnableJoinGroup()
                self.jButton:EnableMouse(true)
            end

            function elite:DisableJoinGroup()
                self.jButton:EnableMouse(false)
                self.jButton.Label:SetTextColor(1, 1, 1, 0.2)
            end

            function elite:EnableLeaveGroup()
                if searching then return end
                self.lButton:EnableMouse(true)
                self.lButton.Label:SetTextColor(1, 1, 1, 1)
            end

            function elite:DisableLeaveGroup()
                self.lButton:EnableMouse(false)
                self.lButton.Label:SetTextColor(1, 1, 1, 0.2)
            end

            function elite:EnableCreateAndJoinGroup()
                self:EnableCreateGroup()
                self:EnableJoinGroup()
            end

            function elite:DisableCreateAndJoinGroup()
                self:DisableCreateGroup()
                self:DisableJoinGroup()
            end

            function elite:SetNa()
                if(not self.killed) and (not self.isWq) then
                    self.status.Label:SetTextColor(1, 0.45, 0.08, 1)
                    self.status.Label:SetText("(" .. self.searchResults .. ") " .. L["N/A"])
                end
            end


            function elite:UpdateGroups()
                self:RemoveInvalidGroups()

                if editMode then
                    self.jButton:Hide()
                    self.cButton:Hide()
                    self.lButton:Hide()
                    return
                end

                groupCreationActive = select(1, C_LFGList.GetActiveEntryInfo())

                if groupCreationActive then
                    self:DisableCreateAndJoinGroup()
                else
                    if C_LFGList.IsCurrentlyApplying() then
                        -- debug("currently applying")
                        self:DisableCreateGroup()

                        if C_LFGList.GetNumApplications() >= 5 then
                            -- debug("listed for too many groups")
                            self:DisableJoinGroup()
                        else
                            if IsInGroup() then
                                -- debug("we're in a group")
                                if UnitIsGroupLeader("player") then
                                    -- debug("we are the leader")
                                    self:EnableJoinGroup()
                                else
                                    -- debug("we are NOT the leader")
                                    self:DisableJoinGroup()
                                end
                            else
                                -- debug("we're not in a group")
                                self:EnableJoinGroup()
                            end
                        end
                    else
                        if IsInGroup() then
                            -- debug("we are in a group")
                            if UnitIsGroupLeader("player") then
                                -- debug("we are the leader")
                                self:EnableCreateAndJoinGroup()
                            else
                                -- debug("we are not the leader")
                                self:DisableCreateAndJoinGroup()
                            end
                        else
                            -- debug("we are not in a group")
                            self:EnableCreateAndJoinGroup()
                        end
                    end
                end

                if self:GetGroupCount() > 0 then
                    self.jButton:Show()
                    self.cButton:Hide()
                elseif self:GetGroupCount() == 0 then
                    self.cButton:Show()
                    self.jButton:Hide()
                end

                self.lButton:Hide()

                if self.inGroup then
                    self.jButton:Hide()
                    self.cButton:Hide()
                    self.lButton:Show()
                end
            end

            function elite:EditMode()
                ArgusEliteTrackerConfig.forceHidden[self.questId] = not ArgusEliteTrackerConfig.forceHidden[self.questId]
                self:Update()
            end

            function elite:UpdateCommanderOfArgus()
                local coaComplete = false
                if self.coaId ~= nil then
                    local _, _, complete = GetAchievementCriteriaInfo(12078, self.coaId)
                    coaComplete = complete
                end

                self.coaComplete = coaComplete
            end

            function elite:UpdateLabel()
                local text = not self.coaComplete and  L["*"] .. " " .. elite.name or elite.name
                elite.button.Label:SetText(text)
            end


            function elite:UpdateKilledStatus()
                self.killed = IsQuestFlaggedCompleted(self.questId)
            end

            function elite:SetEditModeOn()
                self.status:Hide()
                self.button:SetScript("OnClick", function()
                    self:EditMode()
                end)
                self.button.Label:SetTextColor(1, 1, 1, 1)

                if ArgusEliteTrackerConfig.forceHidden[self.questId] then
                    self.button:SetBackdropColor(0.957, 0.306, 0.259, 0.9)
                else
                    self.button:SetBackdropColor(0.259, 0.957, 0.384, 0.9)
                end
            end

            function elite:SetEditModeOff()
                self.button:SetBackdropColor(0, 0, 0, 0)
                self.status:Show()
                self.button:SetScript("OnClick", initiateSingleSearch)
            end

            function elite:UpdateMapIcon()

                if ArgusEliteTrackerConfig.disableMapIcons then
                   return
                end

                if self.killed then
                    self.hbmIcon.texture:SetVertexColor(.10, .10, .10, 1)
                elseif self.isWq then
                    self.hbmIcon.texture:SetVertexColor(1, 1, 0, 1)
                else
                    if self.searchResults > 0 then
                        self.hbmIcon.texture:SetVertexColor(0, 0.9, 0, 1)
                    else
                        self.hbmIcon.texture:SetVertexColor(0.9, 0, 0, 1)
                    end
                end
            end

            function elite:Update()
                if editMode then
                    self:SetEditModeOn()
                    return
                else
                    self:SetEditModeOff()
                end

                self:UpdateKilledStatus()
                self:UpdateCommanderOfArgus()
                self:UpdateLabel()
                self:UpdateMapIcon()

                if self.killed then
                    self.button.Label:SetTextColor(1, 1, 1, 0.2)
                    self.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
                    self.status.Label:SetText(L["Killed"])
                    -- self.hbmIcon.texture:SetVertexColor(1, 1, 1, .3)
                elseif self.isWq then
                    self.status.Label:SetTextColor(0.85, 0.85, 0.2, 1)
                    self.status.Label:SetText(L["WQ"])
                    -- self.hbmIcon.texture:SetVertexColor(1, 1, 0, 1)
                else
                    if self.searchResults > 0 then
                        self.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
                        self.status.Label:SetText("(" .. self.searchResults .. ") " .. L["YES"])
                        -- self.hbmIcon.texture:SetVertexColor(0, 0.9, 0, 1)
                    else
                        self.status.Label:SetTextColor(0.96, 0.30, 0.29, 1)
                        self.status.Label:SetText("(0) " .. L["NO"])
                        -- self.hbmIcon.texture:SetVertexColor(0.9, 0, 0, 1)
                    end
                end

                self:RemoveInvalidGroups()

                if self:GetGroupCount() > 0 then
                    local applied = self:GetApplied()
                    local groupCount = self:GetGroupCount()
                    
                    self.jButton.Label:SetText(L["Join"] .. " " .. tostring(groupCount-applied))

                    if groupCount - applied == 0 then
                        self.jButton.Label:SetTextColor(0.20, 0.91, 0.46, 0.5)
                    elseif applied > 0 then
                        self.jButton.Label:SetTextColor(0.20, 0.91, 0.46, 1)
                    else
                        self.jButton.Label:SetTextColor(1, 1, 1, 1)
                    end
                end

                self:UpdateGroups()

                if self.hidden then
                    self:Hide()
                end
            end


            function elite:LeaveGroup()
                LeaveParty()
                self.inGroup = false
                self:Update()
                updateArgusEliteTrackerFrame()
            end


            function elite:ApplyToGroup()
                if C_LFGList.GetNumApplications() >= 5 then
                    DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000" .. L["Applied to too many groups."])
                    return
                end

                local any = false
                for _, v in pairs(self.groups) do
                    if not v.applied then 
                        local tank, healer, dps = UnitGetAvailableRoles("player")
                        C_LFGList.ApplyToGroup(v.id, L["Joined from ArgusEliteTracker"], tank, healer, dps)
                        v.applied = true
                        any = true
                        break
                    end
                end

                self:Update()
                updateArgusEliteTrackerFrame()
            end


            function elite:CreateGroup()
                -- LFGList.lua l884
                -- C_LFGList.CreateListing(activityID, name, itemLevel, honorLevel, voiceChatInfo, description, autoAccept, privateGroup, questID)
                if self.isWq and self.wqId ~= nil then
                    local activityId = C_LFGList.GetActivityIDForQuestID(self.wqId)
                    if(C_LFGList.CreateListing(activityId, "", 0, 0, "", self.name .. ". " .. L["Group created with ArgusEliteTracker."], true, false, self.wqId)) then
                        self.inGroup = true
                    else
                        debug("nOOoOooOoOo")
                    end
                else
                    if(C_LFGList.CreateListing(16, self.name, 0, 0, "", self.name .. ". " .. L["Group created with ArgusEliteTracker."], true, false)) then
                        self.inGroup = true
                    else
                        debug("NOOOOOOO")
                    end
                end

                self:Update()
                updateArgusEliteTrackerFrame()
            end

            elite:Hide()
            elite:Show()
        end
    end

    addCommanderOfArgusIds()
    -- updateArgusEliteTrackerFrame()
    -- This will cause an ADDON_ACTION_BLOCKED event (because it didn't originate from a user hardware click?)
    -- searchForAll()
end


---------------------------------------------
--  Create the addon frames
---------------------------------------------
function createArgusEliteTrackerFrames()
    aet:ClearAllPoints()
    aet:SetPoint("CENTER", 0, 0)
    
    aet:SetMovable(true)
    aet:EnableMouse(true)
    aet:RegisterForDrag("LeftButton")
    aet:SetResizable(true)
    aet:SetClampedToScreen(true)
    aet:SetUserPlaced(true)
    aet:SetSize(W.AetWindowWidth, W.AetWindowHeight)

    aet.elitesContainer = CreateFrame("frame", nil, aet)
    aet.elitesContainer:SetSize(W.ElitesContainerWidth, W.ElitesContainerHeight)
    aet.elitesContainer:SetBackdrop(plainBackdrop)
    aet.elitesContainer:SetBackdropColor(0, 0, 0, 1)
    aet.elitesContainer:SetBackdropBorderColor(1, 1, 1, 0)

    -- Create a header for our addon frame
    aet.TitleBar = CreateFrame("frame", nil, aet)
    aet.TitleBar:SetPoint("topleft", 0, -1)
    -- aet.TitleBar:SetPoint("topright", 0, 1)
    aet.TitleBar:SetHeight(W.TitleBarHeight)
    aet.TitleBar:SetWidth(W.TitleBarWidth)
    aet.TitleBar:EnableMouse(false)
    aet.TitleBar:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 2, edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0 })
    aet.TitleBar:SetBackdrop(plainBackdrop)
    aet.TitleBar:SetBackdropColor(1, .84, 0, 1)
    aet.TitleBar:SetBackdropBorderColor(0, 0, 0, 0)
    aet.TitleBar.Label = aet.TitleBar:CreateFontString()
    aet.TitleBar.Label:SetFont(defaultFontName, W.FontSizeBig)
    aet.TitleBar.Label:SetPoint("CENTER", aet.TitleBar, "CENTER", 0, 0)
    aet.TitleBar.Label:SetText(L["Argus Elite Tracker"])

    aet.elitesContainer:SetFrameLevel(aet.TitleBar:GetFrameLevel() - 1)


    aet.SearchAll = CreateFrame("button", "AetSearchAllButton", aet.TitleBar)
    aet.SearchAll:SetPoint("left", aet.TitleBar, "left", 4, 0)
    aet.SearchAll:SetSize(W.SearchAllButtonWidth, W.ButtonHeight)
    aet.SearchAll:EnableMouse(true)
    aet.SearchAll:SetBackdrop(plainBackdrop)
    aet.SearchAll:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.SearchAll:SetBackdropColor(0, 0, 0, 1)
    aet.SearchAll:SetBackdropBorderColor(1, 1, 1, 0)
    aet.SearchAll.Label = addonData:createLabel(L["Search all"], W.FontSizeSmall, "CENTER", aet.SearchAll)
    aet.SearchAll.Label:SetTextColor(0.95, 0.95, 0.95, 0.95, 1)

    aet.Edit = CreateFrame("button", "AetEditButton", aet.TitleBar)
    aet.Edit:SetPoint("right", aet.TitleBar, "right", -66, 0)
    aet.Edit:SetSize(W.SmallButtonWidth, W.ButtonHeight)
    aet.Edit:SetBackdrop(plainBackdrop)
    aet.Edit:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Edit:SetBackdropColor(0, 0, 0, 1)
    aet.Edit:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Edit.Label = addonData:createLabel(L["E"], W.FontSizeSmall, "CENTER", aet.Edit)
    aet.Edit.Label:SetTextColor(0.75, 0.75, 0.75, 0.75, 1)

    aet.Reset = CreateFrame("button", "AetResetButton", aet.TitleBar)
    aet.Reset:SetPoint("right", aet.TitleBar, "right", -50, 0)
    aet.Reset:SetSize(W.SmallButtonWidth, W.ButtonHeight)
    aet.Reset:SetBackdrop(plainBackdrop)
    aet.Reset:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Reset:SetBackdropColor(0, 0, 0, 1)
    aet.Reset:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Reset.Label = addonData:createLabel(L["R"], W.FontSizeSmall, "CENTER", aet.Reset)
    aet.Reset.Label:SetTextColor(0.75, 0.75, 0.75, 0.75, 1)

    aet.Options = CreateFrame("button", "AetOptionsButton", aet.TitleBar)
    aet.Options:SetPoint("right", aet.TitleBar, "right", -34, 0)
    aet.Options:SetSize(W.SmallButtonWidth, W.ButtonHeight)
    aet.Options:EnableMouse(true)
    aet.Options:SetBackdrop(plainBackdrop)
    aet.Options:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Options:SetBackdropColor(0, 0, 0, 1)
    aet.Options:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Options.Label = addonData:createLabel(L["?"], W.FontSizeSmall, "CENTER", aet.Options)
    aet.Options.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    aet.Minimize = CreateFrame("button", "AetMinimizeButton", aet.TitleBar)
    aet.Minimize:SetPoint("right", aet.TitleBar, "right", -18, 0)
    aet.Minimize:SetSize(W.SmallButtonWidth, W.ButtonHeight)
    aet.Minimize:SetBackdrop(plainBackdrop)
    aet.Minimize:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Minimize:SetBackdropColor(0, 0, 0, 1)
    aet.Minimize:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Minimize.Label = addonData:createLabel(L["-"], W.FontSizeSmall, "CENTER", aet.Minimize)
    aet.Minimize.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    aet.Close = CreateFrame("button", "AetCloseButton" ,aet.TitleBar)
    aet.Close:SetPoint("right", aet.TitleBar, "right", -2, 0)
    aet.Close:SetSize(W.SmallButtonWidth, W.ButtonHeight)
    aet.Close:SetBackdrop(plainBackdrop)
    aet.Close:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Close:SetBackdropColor(0, 0, 0, 1)
    aet.Close:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Close.Label = addonData:createLabel(L["X"], W.FontSizeSmall, "CENTER", aet.Close)
    aet.Close.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    -- krokuun
    aet.elitesContainer.krokuun = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.krokuun:SetBackdrop(plainBackdrop)
    aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.50)
    aet.elitesContainer.krokuun:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.krokuun:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.krokuun:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -10)
    aet.elitesContainer.krokuun:SetSize(W.ZoneKrokuunButtonWidth, W.ZoneButtonHeight)
    aet.elitesContainer.krokuun.Label = addonData:createLabel(L["Krokuun"], W.FontSizeBig, "CENTER", aet.elitesContainer.krokuun)

    -- antoranWastes
    aet.elitesContainer.antoranWastes = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.antoranWastes:SetBackdrop(plainBackdrop)
    aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.2)
    aet.elitesContainer.antoranWastes:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.antoranWastes:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.antoranWastes:SetPoint("topleft", aet.elitesContainer, "topleft", (aet:GetWidth() / 3), -10)
    -- aet.elitesContainer.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, W.ZoneButtonHeight)
    aet.elitesContainer.antoranWastes:SetSize(W.ZoneAntoranWastesButtonWidth, W.ZoneButtonHeight)
    aet.elitesContainer.antoranWastes.Label = addonData:createLabel(L["Antoran Wastes"], W.FontSizeBig, "CENTER", aet.elitesContainer.antoranWastes)

    -- macAree
    aet.elitesContainer.macAree = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.macAree:SetBackdrop(plainBackdrop)
    aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.2)
    aet.elitesContainer.macAree:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.macAree:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.macAree:SetPoint("topleft", aet.elitesContainer, "topleft", 10 + (aet:GetWidth() / 3) * 2 + 5, -10)
    aet.elitesContainer.macAree:SetSize(W.ZoneMacAreeButtonWidth, W.ZoneButtonHeight)
    aet.elitesContainer.macAree.Label = addonData:createLabel(L["Mac'Aree"], W.FontSizeBig, "CENTER", aet.elitesContainer.macAree)

        ---------------------------------------------
    --  Register scripts
    ---------------------------------------------

    aet:SetScript("OnDragStart", aet.StartMoving)
    aet:SetScript("OnDragStop", aet.StopMovingOrSizing)
    
    aet.elitesContainer.krokuun:SetScript("OnClick", function()
        selectedZone = zones.krokuun
        aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.50)
        aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.20)
        hideZone("antoranWastes")
        hideZone("macAree")
        selectedZoneName = "krokuun"
        updateArgusEliteTrackerFrame()
    end)

    aet.elitesContainer.antoranWastes:SetScript("OnClick", function()
        selectedZone = zones.antoranWastes
        aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.50)
        aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.20)
        hideZone("krokuun")
        hideZone("macAree")
        selectedZoneName = "antoranWastes"
        updateArgusEliteTrackerFrame()
    end)

    aet.elitesContainer.macAree:SetScript("OnClick", function()
        selectedZone = zones.macAree
        aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.50)
        hideZone("krokuun")
        hideZone("antoranWastes")
        selectedZoneName = "macAree"
        updateArgusEliteTrackerFrame()
    end)

    aet.SearchAll:SetScript("OnClick", function()
        searchForAll()
    end)

    aet.Edit:SetScript("OnClick", function()
        editMode = not editMode
        updateArgusEliteTrackerFrame()
    end)

    aet.Options:SetScript("OnClick", function()
        InterfaceOptionsFrame_OpenToCategory(addonData.configPanel.name)
    end)

    aet.Reset:SetScript("OnClick", function()
        resetAll()
        resetAllGroups()
        updateArgusEliteTrackerFrame()
    end)

    aet.Minimize:SetScript("OnClick", function()
        if aet.elitesContainer:IsVisible() then
            ArgusEliteTrackerConfig.minimized = true
            aet.elitesContainer:Hide()
            aet.Minimize.Label:SetText("+")
        else
            ArgusEliteTrackerConfig.minimized = false
            aet.elitesContainer:Show()
            aet.Minimize.Label:SetText("-")
        end
    end)

    aet.Close:SetScript("OnClick", function()
        aet:Hide()
        ArgusEliteTrackerConfig.closed = true
        debug(L["Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00."])
    end)

    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            aet.quests[elite.questId] = elite
        end
    end

    initiateZones()
end


---------------------------------------------
--  Create slash commands
---------------------------------------------

SLASH_ARGUSELITETRACKER1 = "/aet"
SLASH_ARGUSELITETRACKER2 = "/arguselitetracker"

SlashCmdList.ARGUSELITETRACKER = function(argument)
    if argument == "" then argument = L["TOGGLE"] end

    if string.upper(argument) == L["HELP"] then
        DEFAULT_CHAT_FRAME:AddMessage(L["Argus Elite Tracker: Commands are |cFF00FF00help|r|cFFFFFF00, |cFF00FF00show|r|cFFFFFF00, |cFF00FF00hide|cFFFFFF00, |cFF00FF00toggle|r|cFFFFFF00"])
        DEFAULT_CHAT_FRAME:AddMessage(L["Argus Elite Tracker: Slash commands are |cFF00FF00/aet|r|cFFFFFF00, |cFF00FF00/arguselitetracker|r|cFFFFFF00."])
    end
    if string.upper(argument) == L["HIDE"] then
        debug(L["Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00."])
        ArgusEliteTrackerConfig.closed = true
        aet:Hide()
    end
    if string.upper(argument) == L["SHOW"] then
        debug(L["Argus Elite Tracker is |cFF00FF00visible|r|cFFFFFF00."])
        ArgusEliteTrackerConfig.closed = false
        aet:Show()
    end
    if string.upper(argument) == L["TOGGLE"] then
        debug(L["Argus Elite Tracker |cFF00FF00toggled|r|cFFFFFF00."])

        if aet:IsVisible() then
            aet:Hide()
            ArgusEliteTrackerConfig.closed = true
        else
            aet:Show()
            ArgusEliteTrackerConfig.closed = false
        end
    end
    if string.upper(argument) == L["OPTIONS"] or string.upper(argument) == L["CONFIG"] then
        InterfaceOptionsFrame_OpenToCategory(addonData.configPanel)
    end
end


function afterPlayerEnteredWorld()
    local onArgus = playerIsOnArgus()

    if ArgusEliteTrackerConfig.closed == true then
        ArgusEliteTrackerConfig.closed = true
        aet:Hide()
    else
        ArgusEliteTrackerConfig.closed = false
        aet:Show()
    end

    if ArgusEliteTrackerConfig.minimized then
        aet.elitesContainer:Hide()
        aet.Minimize.Label:SetText("+")
    else
        aet.Minimize.Label:SetText("-")
        aet.elitesContainer:Show()
    end

    if onArgus then
        if ArgusEliteTrackerConfig.autoOpenOnArgus then
            aet:Show()
            aet.elitesContainer:Show()
            ArgusEliteTrackerConfig.closed = false
            ArgusEliteTrackerConfig.minimized = false
            aet.Minimize:SetText("-")
        end
    end

    updateArgusEliteTrackerFrame()
    updateArgusEliteTrackerMapIcons()
end

function events:PLAYER_ENTERING_WORLD(...)
    debug("|cFF00FF00" .. addonName .. "|r|cFFFFFFFF " .. L["is loaded."])
    aet:Hide()
    aet.elitesContainer:Hide()
    C_Timer.After(1, afterPlayerEnteredWorld)
    aet:SetWidth(W.AetWindowWidth)
end


local function removeGroup(id)
    if aet.groups[id] ~= nil then
        elite = aet.groups[id]
        elite.groups[id] = nil
        aet.groups[id] = nil
        updateArgusEliteTrackerFrame()
    end
end


function events:LFG_LIST_SEARCH_RESULT_UPDATED(...)
    id = ...
    local   id, activityId, groupName, comment, voiceChat, iLvl, honorLevel,
            age, numBNetFriends, numCharFriends, numGuildMates, isDelisted = C_LFGList.GetSearchResultInfo(id);

    if isDelisted then
        if aet.groups[id] ~= nil then
            removeGroup(id)
        end
    end
end

function events:LFG_LIST_APPLICATION_STATUS_UPDATED(...)

    local id, newStatus, oldStatus = ...

    if      newStatus == "declined"             then removeGroup(id)
    elseif  newStatus == "declined_full"        then removeGroup(id)
    elseif  newStatus == "declined_delisted"    then removeGroup(id)
    elseif  newStatus == "timedout"             then removeGroup(id)
    elseif  newStatus == "invitedeclined"       then removeGroup(id)
    elseif  newStatus == "failed"               then removeGroup(id)
    elseif  newStatus == "cancelled"            then removeGroup(id)
    -- elseif  newStatus == "applied"              then debug("we applied")
    -- elseif  newStatus == "invited"              then debug("we were invited ^_^")
    end
    updateArgusEliteTrackerFrame()
end

function events:LFG_LIST_JOINED_GROUP(...)
    id = ...
    
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            if aet.groups[id] then
                if aet.groups[id] == elite then
                    elite.inGroup = true
                    elite.groups[id] = nil
                    aet.groups[id] = nil
                else
                    elite.inGroup = false
                end
            else
                elite.inGroup = false
            end
        end
    end

    updateArgusEliteTrackerFrame()
end


function events:GROUP_LEFT(...)
    -- If we are in a party when joining
    -- LFG_LIST_JOINED_GROUP will be called first, then GROUP_LEFT
    -- then GROUP_JOINED, then PARTY_LEADER_CHANGED
    -- To keep the inGroup = true variable for the elite we joined,
    -- wait 1.5 seconds to hopefully skip this event if we are once again
    -- in a group
    C_Timer.After(1.5, function() 
        if not IsInGroup() then
            for name,elites in pairs(zones) do
                for i,elite in pairs(zones[name]) do
                    elite.inGroup = false
                end
            end
        end
        updateArgusEliteTrackerFrame()
        updateArgusEliteTrackerMapIcons()
    end)
    
    updateArgusEliteTrackerFrame()
    updateArgusEliteTrackerMapIcons()
end

function events:GROUP_JOINED(...)
    C_Timer.After(1.5, function()
        for name,elites in pairs(zones) do
            for i,elite in pairs(zones[name]) do
                for id, value in pairs(elite.groups) do
                    value.applied = false
                end
            end
        end
        updateArgusEliteTrackerFrame()
    end)

    updateArgusEliteTrackerFrame()
end

function events:PARTY_LEADER_CHANGED(...)
    updateArgusEliteTrackerFrame()
end



function events:COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags)
    if event == "UNIT_DIED" or event == "UNIT_DESTROYED" or event == "PARTY_KILL" then

        local elite = ArgusEliteTracker.eliteNameMap[destName]

        if elite ~= nil then
            elite.killed = true
            
            if elite.tomtom ~= null then
                if TomTom and IsAddOnLoaded("TomTom") then
                    TomTom:RemoveWaypoint(elite.tomtom)
                    TomTom:SetClosestWaypoint()
                end
            end
            
            updateArgusEliteTrackerFrame()
            updateArgusEliteTrackerMapIcons(elite)
        end

        -- debug("timestamp", timestamp)
        -- debug("event", event)
        -- debug("hideCaster", hideCaster)
        -- debug("sourceGUID", sourceGUID)
        -- debug("sourceName", sourceName)
        -- debug("sourceFlags", sourceFlags)
        -- debug("sourceRaidFlags", sourceRaidFlags)
        -- debug("destGUID", destGUID)
        -- debug("destName", destName)
        -- debug("destFlags", destFlags)
        -- debug("destRaidFlags", destRaidFlags)

    end
end

---------------------------------------------
--  Register events
---------------------------------------------

aet:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...)
end)

for key, value in pairs(events) do
    aet:RegisterEvent(key)
end