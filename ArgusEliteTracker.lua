local addonName, addonData = ...
local debugging = false

local function debug(...)
    if debugging then
        print(...)
    end
end


local defaultFontName = "Fonts/FRIZQT__.TTF"
local plainBackdrop = {edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0.75, bgFile = [[Interface\Tooltips\UI-Tooltip-Background]], tileSize = 4, tile = false}

local zones = {
    krokuun = {
        { questId = 48564, name = "Commander Endaxis",          searchTerm = "endax" },     -- 1
        { questId = 48562, name = "Commander Sathrenael",       searchTerm = "sathr" },     -- 2
        { questId = 48563, name = "Commander Vecaya",           searchTerm = "vecay" },     -- 3
        { questId = 48666, name = "Imp Mother Laglath",         searchTerm = "lagla" },     -- 4
        { questId = 48561, name = "Khazaduum",                  searchTerm = "khaza" },     -- 5
        { questId = 48667, name = "Naroua",                     searchTerm = "narou" },     -- 6
        { questId = 48627, name = "Siegemaster Voraan",         searchTerm = "voraan" },    -- 7
        { questId = 48565, name = "Sister Subversia",           searchTerm = "subver" },    -- 8
        { questId = 48628, name = "Talestra the Vile",          searchTerm = "talest" },    -- 9
        { questId = 48665, name = "Tar Spitter",                searchTerm = "spitter" },   -- 10
        { questId = 48664, name = "Tereck the Selector",        searchTerm = "tereck" },    -- 11
        { questId = 48629, name = "Vagath the Betrayed",        searchTerm = "vagath" },    -- 12
   },
    antoranWastes = {
        { questId = 48817, name = "Admiral Rel'var",            searchTerm = "rel'var" },   -- 1
        { questId = 48818, name = "All-Seer Xanarian",          searchTerm = "xanari" },    -- 2
        { questId = 49183, name = "Blistermaw",                 searchTerm = "blister" },   -- 3
        { questId = 48865, name = "Chief Alchemist Munculus",   searchTerm = "muncu" },     -- 4
        { questId = 48816, name = "Commander Texlaz",           searchTerm = "texla" },     -- 5
        { questId = 48968, name = "Doomcaster Suprax",          searchTerm = "supra" },     -- 6
        { questId = 49241, name = "Gar'zoth",                   searchTerm = "zoth" },      -- 7
        { questId = 48821, name = "Houndmaster Kerrax",         searchTerm = "kerra" },     -- 8
        { questId = 48815, name = "Inquisitor Vethroz",         searchTerm = "vethroz" },   -- 9
        { questId = 48813, name = "Lieutenant Xakaar",          searchTerm = "xaka" },      -- 10
        { questId = 49240, name = "Mistress Il'thendra",        searchTerm = "thendr" },    -- 12
        { questId = 48970, name = "Mother Rosula",              searchTerm = "rosul" },     -- 13
        { questId = 48809, name = "Puscilla",                   searchTerm = "pusc" },      -- 14
        { questId = 48971, name = "Rezira the Seer",            searchTerm = "rezi" },      -- 15
        { questId = 48967, name = "Squadron Commander Vishax",  searchTerm = "vishax" },    -- 16
        { questId = 48966, name = "The Many-Faced Devourer",    searchTerm = "faced" },     -- 17
        { questId = 48812, name = "Varga",                      searchTerm = "varga" },     -- 18
        { questId = 48811, name = "Ven'orn",                    searchTerm = "ven'orn" },   -- 19
        { questId = 48824, name = "Void Warden Valsuran",       searchTerm = "valsur" },    -- 20
        { questId = 48810, name = "Vrax'thul",                  searchTerm = "vrax" },      -- 21
        { questId = 48822, name = "Watcher Aival",              searchTerm = "aival" },     -- 22
        { questId = 48820, name = "Worldsplitter Skuul",        searchTerm = "skuul" },     -- 23
        { questId = 48814, name = "Wrath-Lord Yarez",           searchTerm = "yarez" },     -- 24
   },
    macAree = {
        { questId = 48709, name = "Ataxon",                     searchTerm = "atax" },      -- 1
        { questId = 48700, name = "Baruut the Bloodthirsty",    searchTerm = "baruut" },    -- 2
        { questId = 48707, name = "Captain Faruq",              searchTerm = "faruq" },     -- 3
        { questId = 48720, name = "Commander Xethgar",          searchTerm = "xeth" },      -- 4
        { questId = 48702, name = "Feasel the Muffin Thief",    searchTerm = "feasel" },    -- 5
        { questId = 48711, name = "Herald of Chaos",            searchTerm = "herald" },    -- 6
        { questId = 48718, name = "Instructor Tarahna",         searchTerm = "tarah" },     -- 7
        { questId = 48713, name = "Jed'hin Champion Vorusk",    searchTerm = "vorusk" },    -- 8
        { questId = 48697, name = "Kaara the Pale",             searchTerm = "kaara" },     -- 9
        { questId = 48714, name = "Overseer Y'Beda",            searchTerm = "beda" },      -- 10
        { questId = 48717, name = "Overseer Y'Morna",           searchTerm = "morna" }, --jens :'D -- 11
        { questId = 48716, name = "Overseer Y'Sorna",           searchTerm = "sorna" },     -- 12
        { questId = 48712, name = "Sabuul",                     searchTerm = "sabuul" },    -- 13
        { questId = 48692, name = "Shadowcaster Voruun",        searchTerm = "voruun" },    -- 14
        { questId = 48721, name = "Skreeg the Devourer",        searchTerm = "skreeg" },    -- 15
        { questId = 48935, name = "Slithon the Last",           searchTerm = "slithon" },   -- 16
        { questId = 48710, name = "Sorolis the Ill-Fated",      searchTerm = "sorolis" },   -- 17
        { questId = 48693, name = "Soultwisted Monstrosity",    searchTerm = "monstros" },  -- 18
        { questId = 48706, name = "Turek the Lucid",            searchTerm = "turek" },     -- 19
        { questId = 48708, name = "Umbraliss",                  searchTerm = "umbrali" },   -- 20
        { questId = 48705, name = "Venomtail Skyfin",           searchTerm = "venomt" },    -- 21
        { questId = 48704, name = "Vigilant Kuro",              searchTerm = "kuro" },      -- 22
        { questId = 48703, name = "Vigilant Thanos",            searchTerm = "thanos" },    -- 23
        { questId = 48695, name = "Wrangler Kravos",            searchTerm = "kravos" },    -- 24
        { questId = 48719, name = "Zul'tan the Numerous",       searchTerm = "zul'tan" },   -- 25
    }
}


aetzonesdebug = nil
aetdebug = nil
local searching = false

-- /run print(GetCurrentMapAreaID())
local aet = CreateFrame("frame", "ArgusEliteTrackerFram", UIParent)
local events = {}
local zoneIds = { krokuun = 1135, antoranWastes = 1171, macAree = 1170 }
local selectedZone = zones.krokuun
local selectedZoneName = "krokuun"
local groupCreationActive = false

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


local function UpdateKilledStatusForAll()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.killed = IsQuestFlaggedCompleted(elite.questId)
        end
    end
end


local function HideFiltered()

    if editMode then
        for k,elite in pairs(selectedZone) do
            elite.hidden = false
        end
        return 0
    end

    local numberOfHidden = 0

    for i, elite in ipairs(selectedZone) do
        elite.hidden = false
        hiddenElites = {}

        local function hideElite(elite)
            local exists = hiddenElites[elite.name] ~= nil

            if not exists then
                hiddenElites[elite.name] = true
                elite.hidden = true
                numberOfHidden = numberOfHidden + 1
            end
            return exists
        end

        if ArgusEliteTrackerConfig.onlyShowElitesWithGroups then
            if elite.searchResults < 1 then
                hideElite(elite)
            end
        end

        if ArgusEliteTrackerConfig.hideKilledElites == true then
            if elite.killed then
                hideElite(elite)
            end
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled then
            if elite.isWq then
                if elite.hidden then
                    if hideElite(elite) then
                        numberOfHidden = numberOfHidden - 1
                    end
                    elite.hidden = false
                end
                if elite.killed then
                    if ArgusEliteTrackerConfig.hideKilledElites then
                        if hideElite(elite) then
                            numberOfHidden = numberOfHidden -1
                        end
                        elite.hidden = true
                    else
                        if hideElite(elite) then
                            numberOfHidden = numberOfHidden -1
                        end
                        elite.hidden = false
                    end
                end
                if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden then
                    if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
                        if elite.hidden then
                            numberOfHidden = numberOfHidden - 1
                        end
                        elite.hidden = false
                    end
                end
            end
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden then
            if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
                if elite.hidden then
                    numberOfHidden = numberOfHidden - 1
                end
                elite.hidden = false
            end
        else
            if ArgusEliteTrackerConfig.forceHidden[elite.questId] then
                if not elite.hidden then
                    numberOfHidden = numberOfHidden + 1
                end
                elite.hidden = true
            end
        end
    end

    return numberOfHidden
end

-- You're my man
function updateArgusEliteTrackerFrame()
    UpdateKilledStatusForAll()

    aet.elitesContainer:ClearAllPoints()
    aet.elitesContainer.krokuun:ClearAllPoints()
    aet.elitesContainer.antoranWastes:ClearAllPoints()
    aet.elitesContainer.macAree:ClearAllPoints()

    numberOfHidden = HideFiltered()
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
        aet.elitesContainer.krokuun:SetSize(75, 20)
        aet.elitesContainer.antoranWastes:SetPoint("TOPLEFT", aet.elitesContainer, "BOTTOMLEFT", (aet:GetWidth() / 3), 30)
        aet.elitesContainer.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, 20)
        aet.elitesContainer.macAree:SetPoint("TOPLEFT", aet.elitesContainer, "BOTTOMLEFT", 10 + (aet:GetWidth() / 3) * 2 + 5, 30)
        aet.elitesContainer.macAree:SetSize(75, 20)
        -- aet.elitesContainer:SetPoint("BOTTOMLEFT", aet.zonesContainer, "TOPLEFT", 0, 0)
        -- aet.elitesContainer:SetPoint("TOPLEFT", 0, -18)
    else
        aet.elitesContainer:SetPoint("TOPLEFT", 0, -24)
        aet.elitesContainer.krokuun:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -10)
        aet.elitesContainer.krokuun:SetSize(75, 20)
        aet.elitesContainer.antoranWastes:SetPoint("topleft", aet.elitesContainer, "topleft", (aet:GetWidth() / 3), -10)
        aet.elitesContainer.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, 20)
        aet.elitesContainer.macAree:SetPoint("topleft", aet.elitesContainer, "topleft", 10 + (aet:GetWidth() / 3) * 2 + 5, -10)
        aet.elitesContainer.macAree:SetSize(75, 20)
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


local function updateWorldQuests(elites, zoneId)
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


local function updateWorldQuestsForAllArgusZones()
    local currentMapOpen = GetCurrentMapAreaID()

    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        updateWorldQuests(elites, zoneId)
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


------------------------------------
--  Search all groups
------------------------------------

local secondCounterAll = 0
local searchForSecondsAll = 5


local function searchForAllGroupsCallback()

    searching = false
    updateWorldQuestsForAllArgusZones()
    resetAllGroups()

    local numResults, resultTable = C_LFGList.GetSearchResults()
     -- Blizzard wut, resultTable has a limit of 100,
     -- but numResults shows over 100 results was found (highest I had was 180 something)
    -- debug(numResults, resultTable)
    -- local counter = 0

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local  id, activityId, groupName, comment, voiceChat, iLvl,
                honorLevel, age, numBNetFriends, numCharFriends, numGuildMates, isDelisted = C_LFGList.GetSearchResultInfo(resultId);
        
        groupName = groupName:lower()
        local ageInMinutes = age / 60

        for name, _ in pairs(zones) do
            for _, elite in pairs(zones[name]) do
                elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE

                if not elite.killed then
                    elite:SetNa()
                end

                if groupName:find(elite.searchTerm, 1, true) and not isDelisted and ageInMinutes < 5 then
                    aet.groups[id] = elite
                    elite.groups[id] = { id = id, age = age }
                    elite.searchResults = elite.searchResults + 1
                    break
                end
            end
        end
    end

    updateArgusEliteTrackerFrame()
end


local function onUpdateAll(self, elapsed)
    secondCounterAll = secondCounterAll + elapsed

    if secondCounterAll >= searchForSecondsAll then
        self:SetScript("OnUpdate", nil)
        secondCounterAll = 0
        resetAll()
        enableAllButtons()
        searchForAllGroupsCallback()
    end
end


local function searchForAll()
    updateArgusEliteTrackerFrame()
    searching = true
    disableAllButtons()
    -- local languages = C_LFGList.GetLanguageSearchFilter()
    -- Need to understand this better, seems like there's a limit to 100 responses
    -- C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(""), 0, 0, languages)
    C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(""))
    aet.SearchAll:SetScript("OnUpdate", onUpdateAll)
end


------------------------------------
--  Search for one group
------------------------------------
local function updateSearchedElite(elite)

    searching = false
    resetAllGroups()
    elite.searchResults = 0

    local numResults, resultTable = C_LFGList.GetSearchResults()

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local id, activityId, groupName, comment, voiceChat, iLvl, honorLevel,
            age, numBNetFriends, numCharFriends, numGuildMates, isDelisted = C_LFGList.GetSearchResultInfo(resultId);

        groupName = groupName:lower()

        local ageInMinutes = age / 60
        
        if groupName:find(elite.searchTerm, 1, true) and not isDelisted and ageInMinutes < 5 then
            aet.groups[id] = elite
            elite.groups[id] = { id = id, age = age }
            elite.searchResults = elite.searchResults + 1
        end
    end

    updateArgusEliteTrackerFrame()
end


local secondCounter = 0
local searchForSeconds = 5

local function onUpdate(self, elapsed)
    secondCounter = secondCounter + elapsed

    if secondCounter >= searchForSeconds then
        self:SetScript("OnUpdate", nil)
        secondCounter = 0
        enableAllButtons()
        updateSearchedElite(self.elite)
    end
end


local function searchForGroup(elite)

    searching = true
    updateWorldQuestsForAllArgusZones()
    elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE
    local languages = C_LFGList.GetLanguageSearchFilter()

    if elite.isWq and elite.wqId ~= nil then
        C_LFGList.Search(1, LFGListSearchPanel_ParseSearchTerms(elite.searchTerm), 0, 0, languages)
    else
        C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(elite.searchTerm), 0, 0, languages)
    end

    disableAllButtons()
    elite.button:SetScript("OnUpdate", onUpdate)
end


local function initiateSearch(self)
    self.elite.searchResults = 0
    self.elite:SetNa()
    searchForGroup(self.elite)
end


-- LFGList.lua l730
-- local activities = C_LFGList.GetAvailableActivities(self.selectedCategory, 0, bit.bor(self.baseFilters, self.selectedFilters));
-- LFGList.lua l884
-- if(C_LFGList.CreateListing(activityID, name, itemLevel, honorLevel, voiceChatInfo, description, autoAccept, privateGroup, questID)) then

local function initiateZones()
    local yOffset = 15
    local statusWidth = 50

    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        updateWorldQuests(elites, zoneId)

        for i, elite in pairs(zones[name]) do
            local name = elite.name
            local buttonText = elite.name

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
            elite.cButton:SetBackdropBorderColor(1, 1, 1, 0)
            elite.cButton:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.cButton:SetSize(40, 16)
            elite.cButton.Label = addonData:createLabel("Create", 12, "CENTER", elite.cButton)
            elite.cButton.elite = elite
            elite.cButton:SetScript("OnClick", function(self)
                self.elite:CreateGroup()
            end)


            elite.jButton = CreateFrame("button", nil, aet.elitesContainer)
            elite.jButton:SetBackdrop(plainBackdrop)
            elite.jButton:SetBackdropColor(0, 0, 0, 0)
            elite.jButton:SetBackdropBorderColor(1, 1, 1, 0)
            elite.jButton:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.jButton:SetSize(40, 16)
            elite.jButton.Label = addonData:createLabel("Join", 12, "CENTER", elite.jButton)
            elite.jButton.elite = elite
            elite.jButton:SetScript("OnClick", function(self) 
                self.elite:ApplyToGroup()
            end)


            elite.lButton = CreateFrame("button", nil, aet.elitesContainer)
            elite.lButton:SetBackdrop(plainBackdrop)
            elite.lButton:SetBackdropColor(0, 0, 0, 0)
            elite.lButton:SetBackdropBorderColor(1, 1, 1, 0)
            elite.lButton:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.lButton:SetSize(40, 16)
            elite.lButton.Label = addonData:createLabel("Leave", 12, "CENTER", elite.lButton)
            elite.lButton.elite = elite
            elite.lButton:SetScript("OnClick", function(self) 
                self.elite:LeaveGroup()
            end)


            elite.button = CreateFrame("button", nil, aet.elitesContainer)
            elite.button:SetBackdrop(plainBackdrop)
            elite.button:SetBackdropColor(0, 0, 0, 0)
            elite.button:SetBackdropBorderColor(1, 1, 1, 0)
            elite.button:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.button:SetSize(aet:GetWidth() - 50 - statusWidth - 10, 16)
            elite.button.Label = addonData:createLabel(buttonText, 12, "CENTER", elite.button)
            elite.button.elite = elite
            elite.button:SetScript("OnClick", initiateSearch)


            elite.status = CreateFrame("Frame", nil, aet.elitesContainer)
            elite.status:SetBackdrop(plainBackdrop)
            elite.status:SetBackdropColor(0, 0, 0, 0)
            elite.status:SetBackdropBorderColor(1, 1, 1, 0)
            elite.status:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.status:SetSize(statusWidth, 15)
            elite.status.Label = addonData:createLabel("N/A", 12, "CENTER", elite.status)


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
                    self.button:SetPoint("topleft", aet.elitesContainer, "topleft", 50, yOffset)
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
                    local id = select(1, C_LFGList.GetSearchResultInfo(id))

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
                    self.status.Label:SetText("(" .. self.searchResults .. ") N/A")
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


            function elite:Update()
                if editMode then
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
                    return
                else
                    self.button:SetBackdropColor(0, 0, 0, 0)
                    self.status:Show()
                    self.button:SetScript("OnClick", initiateSearch)
                end

                if self.killed then
                    self.button.Label:SetTextColor(1, 1, 1, 0.2)
                    self.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
                    self.status.Label:SetText("Killed")
                elseif self.isWq then
                    self.status.Label:SetTextColor(0.85, 0.85, 0.2, 1)
                    self.status.Label:SetText("WQ")
                else
                    if self.searchResults > 0 then
                        self.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
                        self.status.Label:SetText("(" .. self.searchResults .. ") YES")
                    else
                        self.status.Label:SetTextColor(0.96, 0.30, 0.29, 1)
                        self.status.Label:SetText("(0) NO")
                    end
                end

                self:RemoveInvalidGroups()

                if self:GetGroupCount() > 0 then
                    local applied = self:GetApplied()
                    local groupCount = self:GetGroupCount()
                    
                    self.jButton.Label:SetText("Join " .. tostring(groupCount-applied))

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
            end


            function elite:ApplyToGroup()
                if C_LFGList.GetNumApplications() >= 5 then
                    DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000Applied to too many groups.")
                    return
                end

                local any = false
                for _, v in pairs(self.groups) do
                    if not v.applied then 
                        local tank, healer, dps = UnitGetAvailableRoles("player")
                        C_LFGList.ApplyToGroup(v.id, "Joined from ArgusEliteTracker", tank, healer, dps)
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
                    if(C_LFGList.CreateListing(activityId, "", 0, 0, "", self.name .. ". Group created with ArgusEliteTracker.", true, false, self.wqId)) then
                        self.inGroup = true
                    else
                        debug("nOOoOooOoOo")
                    end
                else
                    if(C_LFGList.CreateListing(16, self.name, 0, 0, "", self.name .. ". Group created with ArgusEliteTracker.", true, false)) then
                        self.inGroup = true
                    else
                        debug("NOOOOOOO")
                    end
                end
            end

            elite:Hide()
            elite:Show()
        end
    end
    -- This will cause an ADDON_ACTION_BLOCKED event (because it didn't originate from a user hardware click?)
    -- searchForAll()
end


---------------------------------------------
--  Create the addon frames
---------------------------------------------
function createArgusEliteTrackerFrames()
    aet:SetPoint("CENTER", 0, 0)
    aet:SetSize(300, 24)
    
    aet:SetMovable(true)
    aet:EnableMouse(true)
    aet:RegisterForDrag("LeftButton")
    aet:SetResizable(true)
    aet:SetClampedToScreen(true)

    aet.elitesContainer = CreateFrame("frame", nil, aet)
    aet.elitesContainer:SetSize(300, 50)
    aet.elitesContainer:SetBackdrop(plainBackdrop)
    aet.elitesContainer:SetBackdropColor(0, 0, 0, 1)
    aet.elitesContainer:SetBackdropBorderColor(1, 1, 1, 0)

    -- Create a header for our addon frame
    aet.TitleBar = CreateFrame("frame", nil, aet)
    aet.TitleBar:SetPoint("topleft", 0, -1)
    aet.TitleBar:SetPoint("topright", 0, 1)
    aet.TitleBar:SetHeight(24)
    aet.TitleBar:EnableMouse(false)
    aet.TitleBar:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 2, edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0 })
    aet.TitleBar:SetBackdrop(plainBackdrop)
    aet.TitleBar:SetBackdropColor(1, .84, 0, 1)
    aet.TitleBar:SetBackdropBorderColor(0, 0, 0, 0)
    aet.TitleBar.Label = aet.TitleBar:CreateFontString()
    aet.TitleBar.Label:SetFont(defaultFontName, 12)
    aet.TitleBar.Label:SetPoint("CENTER", aet.TitleBar, "CENTER", 0, 0)
    aet.TitleBar.Label:SetText("Argus Elite Tracker")

    aet.elitesContainer:SetFrameLevel(aet.TitleBar:GetFrameLevel() - 1)


    aet.SearchAll = CreateFrame("button", "AetSearchAllButton", aet.TitleBar)
    aet.SearchAll:SetPoint("left", aet.TitleBar, "left", 4, 0)
    aet.SearchAll:SetSize(58, 15)
    aet.SearchAll:EnableMouse(true)
    aet.SearchAll:SetBackdrop(plainBackdrop)
    aet.SearchAll:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.SearchAll:SetBackdropColor(0, 0, 0, 1)
    aet.SearchAll:SetBackdropBorderColor(1, 1, 1, 0)
    aet.SearchAll.Label = addonData:createLabel("Search all", 10, "CENTER", aet.SearchAll)
    aet.SearchAll.Label:SetTextColor(0.95, 0.95, 0.95, 0.95, 1)

    aet.Edit = CreateFrame("button", "AetEditButton", aet.TitleBar)
    aet.Edit:SetPoint("right", aet.TitleBar, "right", -66, 0)
    aet.Edit:SetSize(15, 15)
    aet.Edit:SetBackdrop(plainBackdrop)
    aet.Edit:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Edit:SetBackdropColor(0, 0, 0, 1)
    aet.Edit:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Edit.Label = addonData:createLabel("E", 10, "CENTER", aet.Edit)
    aet.Edit.Label:SetTextColor(0.75, 0.75, 0.75, 0.75, 1)

    aet.Reset = CreateFrame("button", "AetResetButton", aet.TitleBar)
    aet.Reset:SetPoint("right", aet.TitleBar, "right", -50, 0)
    aet.Reset:SetSize(15, 15)
    aet.Reset:SetBackdrop(plainBackdrop)
    aet.Reset:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Reset:SetBackdropColor(0, 0, 0, 1)
    aet.Reset:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Reset.Label = addonData:createLabel("R", 10, "CENTER", aet.Reset)
    aet.Reset.Label:SetTextColor(0.75, 0.75, 0.75, 0.75, 1)

    aet.Options = CreateFrame("button", "AetOptionsButton", aet.TitleBar)
    aet.Options:SetPoint("right", aet.TitleBar, "right", -34, 0)
    aet.Options:SetSize(15, 15)
    aet.Options:EnableMouse(true)
    aet.Options:SetBackdrop(plainBackdrop)
    aet.Options:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Options:SetBackdropColor(0, 0, 0, 1)
    aet.Options:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Options.Label = addonData:createLabel("?", 10, "CENTER", aet.Options)
    aet.Options.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    aet.Minimize = CreateFrame("button", "AetMinimizeButton", aet.TitleBar)
    aet.Minimize:SetPoint("right", aet.TitleBar, "right", -18, 0)
    aet.Minimize:SetSize(15, 15)
    aet.Minimize:SetBackdrop(plainBackdrop)
    aet.Minimize:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Minimize:SetBackdropColor(0, 0, 0, 1)
    aet.Minimize:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Minimize.Label = addonData:createLabel("-", 10, "CENTER", aet.Minimize)
    aet.Minimize.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    aet.Close = CreateFrame("button", "AetCloseButton" ,aet.TitleBar)
    aet.Close:SetPoint("right", aet.TitleBar, "right", -2, 0)
    aet.Close:SetSize(15, 15)
    aet.Close:SetBackdrop(plainBackdrop)
    aet.Close:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Close:SetBackdropColor(0, 0, 0, 1)
    aet.Close:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Close.Label = addonData:createLabel("X", 10, "CENTER", aet.Close)
    aet.Close.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    -- krokuun
    aet.elitesContainer.krokuun = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.krokuun:SetBackdrop(plainBackdrop)
    aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.50)
    aet.elitesContainer.krokuun:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.krokuun:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.krokuun:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -10)
    aet.elitesContainer.krokuun:SetSize(75, 20)
    aet.elitesContainer.krokuun.Label = addonData:createLabel("Krokuun", 12, "CENTER", aet.elitesContainer.krokuun)

    -- antoranWastes
    aet.elitesContainer.antoranWastes = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.antoranWastes:SetBackdrop(plainBackdrop)
    aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.2)
    aet.elitesContainer.antoranWastes:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.antoranWastes:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.antoranWastes:SetPoint("topleft", aet.elitesContainer, "topleft", (aet:GetWidth() / 3), -10)
    aet.elitesContainer.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, 20)
    aet.elitesContainer.antoranWastes.Label = addonData:createLabel("Antoran Wastes", 12, "CENTER", aet.elitesContainer.antoranWastes)

    -- macAree
    aet.elitesContainer.macAree = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.macAree:SetBackdrop(plainBackdrop)
    aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.2)
    aet.elitesContainer.macAree:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.macAree:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.macAree:SetPoint("topleft", aet.elitesContainer, "topleft", 10 + (aet:GetWidth() / 3) * 2 + 5, -10)
    aet.elitesContainer.macAree:SetSize(75, 20)
    aet.elitesContainer.macAree.Label = addonData:createLabel("Mac'Aree", 12, "CENTER", aet.elitesContainer.macAree)

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
        InterfaceOptionsFrame_OpenToCategory(addonData.configPanel)
    end)

    aet.Reset:SetScript("OnClick", function()
        resetAll()
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
        debug("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
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
    if argument == "" then argument = "TOGGLE" end

    if string.upper(argument) == "HELP" then
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker: Commands are |cFF00FF00help|r|cFFFFFF00, |cFF00FF00show|r|cFFFFFF00, |cFF00FF00hide|cFFFFFF00, |cFF00FF00toggle|r|cFFFFFF00")
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker: Slash commands are |cFF00FF00/aet|r|cFFFFFF00, |cFF00FF00/arguselitetracker|r|cFFFFFF00.")
    end
    if string.upper(argument) == "HIDE" then
        debug("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
        ArgusEliteTrackerConfig.closed = true
        aet:Hide()
    end
    if string.upper(argument) == "SHOW" then
        debug("Argus Elite Tracker is |cFF00FF00visible|r|cFFFFFF00.")
        ArgusEliteTrackerConfig.closed = false
        aet:Show()
    end
    if string.upper(argument) == "TOGGLE" then
        debug("Argus Elite Tracker |cFF00FF00toggled|r|cFFFFFF00.")

        if aet:IsVisible() then
            aet:Hide()
            ArgusEliteTrackerConfig.closed = true
        else
            aet:Show()
            ArgusEliteTrackerConfig.closed = false
        end
    end
    if string.upper(argument) == "OPTIONS" or string.upper(argument) == "CONFIG" then
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
end

function events:PLAYER_ENTERING_WORLD(...)
    debug("|cFF00FF00" .. addonName .. "|r|cFFFFFFFF is loaded.")
    aet:Hide()
    aet.elitesContainer:Hide()
    C_Timer.After(1, afterPlayerEnteredWorld)
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
    end)
    
    updateArgusEliteTrackerFrame()
end

function events:GROUP_JOINED(...)
    for name,elites in pairs(zones) do
        for i,elite in pairs(zones[name]) do
            for id, value in pairs(elite.groups) do
                value.applied = false
            end
        end
    end

    updateArgusEliteTrackerFrame()
end

function events:PARTY_LEADER_CHANGED(...)
    updateArgusEliteTrackerFrame()
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