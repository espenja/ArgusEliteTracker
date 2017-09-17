local addonName, addonData = ...
local debugging = true

local function debug(...)
    if debugging then
        print(...)
    end
end


local isLoaded = false

local defaultFontName = "Fonts/FRIZQT__.TTF"

local mainFrameBackgrop = nil
local plainBackdrop = {edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0.75, bgFile = [[Interface\Tooltips\UI-Tooltip-Background]], tileSize = 4, tile = false}

local zones = {
    krokuun = {
        { searchResults = 0, questId = 48564, killed = false, isWq = false, name = "Commander Endaxis", searchTerm = "endax" },
        { searchResults = 0, questId = 48562, killed = false, isWq = false, name = "Commander Sathrenael", searchTerm = "sathr" },
        { searchResults = 0, questId = 48563, killed = false, isWq = false, name = "Commander Vecaya", searchTerm = "vecay" },
        { searchResults = 0, questId = 48666, killed = false, isWq = false, name = "Imp Mother Laglath", searchTerm = "lagla" },
        { searchResults = 0, questId = 48561, killed = false, isWq = false, name = "Khazaduum", searchTerm = "khaza" },
        { searchResults = 0, questId = 48667, killed = false, isWq = false, name = "Naroua", searchTerm = "narou" },
        { searchResults = 0, questId = 48627, killed = false, isWq = false, name = "Siegemaster Voraan", searchTerm = "voraan" },
        { searchResults = 0, questId = 48565, killed = false, isWq = false, name = "Sister Subversia", searchTerm = "subver" },
        { searchResults = 0, questId = 48628, killed = false, isWq = false, name = "Talestra the Vile", searchTerm = "talest" },
        { searchResults = 0, questId = 48665, killed = false, isWq = false, name = "Tar Spitter", searchTerm = "spitter" },
        { searchResults = 0, questId = 48664, killed = false, isWq = false, name = "Tereck the Selector", searchTerm = "tereck" },
        { searchResults = 0, questId = 48629, killed = false, isWq = false, name = "Vagath the Betrayed", searchTerm = "vagath" },
   },
    antoranWastes = {
        { searchResults = 0, questId = 48817, killed = false, isWq = false, name = "Admiral Rel'var", searchTerm = "rel'var" },
        { searchResults = 0, questId = 48818, killed = false, isWq = false, name = "All-Seer Xanarian", searchTerm = "xanari" },
        { searchResults = 0, questId = 49183, killed = false, isWq = false, name = "Blistermaw", searchTerm = "blister" },
        { searchResults = 0, questId = 48865, killed = false, isWq = false, name = "Chief Alchemist Munculus", searchTerm = "muncu" },
        { searchResults = 0, questId = 48816, killed = false, isWq = false, name = "Commander Texlaz", searchTerm = "texla" },
        { searchResults = 0, questId = 48968, killed = false, isWq = false, name = "Doomcaster Suprax", searchTerm = "supra" },
        { searchResults = 0, questId = 49241, killed = false, isWq = false, name = "Gar'zoth", searchTerm = "zoth" },
        { searchResults = 0, questId = 48821, killed = false, isWq = false, name = "Houndmaster Kerrax", searchTerm = "kerra" },
        { searchResults = 0, questId = 48815, killed = false, isWq = false, name = "Inquisitor Vethroz", searchTerm = "vethroz" },
        { searchResults = 0, questId = 48813, killed = false, isWq = false, name = "Lieutenant Xakaar", searchTerm = "xaka" },
        { searchResults = 0, questId = 49240, killed = false, isWq = false, name = "Mistress Il'thendra", searchTerm = "thendr" },
        { searchResults = 0, questId = 48970, killed = false, isWq = false, name = "Mother Rosula", searchTerm = "rosul" },
        { searchResults = 0, questId = 48809, killed = false, isWq = false, name = "Puscilla", searchTerm = "pusc" },
        { searchResults = 0, questId = 48971, killed = false, isWq = false, name = "Rezira the Seer", searchTerm = "rezi" },
        { searchResults = 0, questId = 48967, killed = false, isWq = false, name = "Squadron Commander Vishax", searchTerm = "vishax" },
        { searchResults = 0, questId = 48966, killed = false, isWq = false, name = "The Many-Faced Devourer", searchTerm = "faced" },
        { searchResults = 0, questId = 48812, killed = false, isWq = false, name = "Varga", searchTerm = "varga" },
        { searchResults = 0, questId = 48811, killed = false, isWq = false, name = "Ven'orn", searchTerm = "ven'orn" },
        { searchResults = 0, questId = 48824, killed = false, isWq = false, name = "Void Warden Valsuran", searchTerm = "valsur" },
        { searchResults = 0, questId = 48810, killed = false, isWq = false, name = "Vrax'thul", searchTerm = "vrax" },
        { searchResults = 0, questId = 48822, killed = false, isWq = false, name = "Watcher Aival", searchTerm = "aival" },
        { searchResults = 0, questId = 48820, killed = false, isWq = false, name = "Worldsplitter Skuul", searchTerm = "skuul" },
        { searchResults = 0, questId = 48814, killed = false, isWq = false, name = "Wrath-Lord Yarez", searchTerm = "yarez" },
   },
    macAree = {
        { searchResults = 0, questId = 48709, killed = false, isWq = false, name = "Ataxon", searchTerm = "atax" },
        { searchResults = 0, questId = 48700, killed = false, isWq = false, name = "Baruut the Bloodthirsty", searchTerm = "baruut" },
        { searchResults = 0, questId = 48707, killed = false, isWq = false, name = "Captain Faruq", searchTerm = "faruq" },
        { searchResults = 0, questId = 48720, killed = false, isWq = false, name = "Commander Xethgar", searchTerm = "xeth" },
        { searchResults = 0, questId = 48702, killed = false, isWq = false, name = "Feasel the Muffin Thief", searchTerm = "feasel" },
        { searchResults = 0, questId = 48711, killed = false, isWq = false, name = "Herald of Chaos", searchTerm = "herald" },
        { searchResults = 0, questId = 48718, killed = false, isWq = false, name = "Instructor Tarahna", searchTerm = "tarah" },
        { searchResults = 0, questId = 48713, killed = false, isWq = false, name = "Jed'hin Champion Vorusk", searchTerm = "vorusk" },
        { searchResults = 0, questId = 48697, killed = false, isWq = false, name = "Kaara the Pale", searchTerm = "kaara" },
        { searchResults = 0, questId = 48714, killed = false, isWq = false, name = "Overseer Y'Beda", searchTerm = "beda" },
        { searchResults = 0, questId = 48717, killed = false, isWq = false, name = "Overseer Y'Morna", searchTerm = "morna" }, --jens :'D
        { searchResults = 0, questId = 48716, killed = false, isWq = false, name = "Overseer Y'Sorna", searchTerm = "sorna" },
        { searchResults = 0, questId = 48712, killed = false, isWq = false, name = "Sabuul", searchTerm = "sabuul" },
        { searchResults = 0, questId = 48692, killed = false, isWq = false, name = "Shadowcaster Voruun", searchTerm = "voruun" },
        { searchResults = 0, questId = 48721, killed = false, isWq = false, name = "Skreeg the Devourer", searchTerm = "skreeg" },
        { searchResults = 0, questId = 48935, killed = false, isWq = false, name = "Slithon the Last", searchTerm = "slithon" },
        { searchResults = 0, questId = 48710, killed = false, isWq = false, name = "Sorolis the Ill-Fated", searchTerm = "sorolis" },
        { searchResults = 0, questId = 48693, killed = false, isWq = false, name = "Soultwisted Monstrosity", searchTerm = "monstros" },
        { searchResults = 0, questId = 48706, killed = false, isWq = false, name = "Turek the Lucid", searchTerm = "turek" },
        { searchResults = 0, questId = 48708, killed = false, isWq = false, name = "Umbraliss", searchTerm = "umbrali" },
        { searchResults = 0, questId = 48705, killed = false, isWq = false, name = "Venomtail Skyfin", searchTerm = "venomt" },
        { searchResults = 0, questId = 48704, killed = false, isWq = false, name = "Vigilant Kuro", searchTerm = "kuro" },
        { searchResults = 0, questId = 48703, killed = false, isWq = false, name = "Vigilant Thanos", searchTerm = "thanos" },
        { searchResults = 0, questId = 48695, killed = false, isWq = false, name = "Wrangler Kravos", searchTerm = "kravos" },
        { searchResults = 0, questId = 48719, killed = false, isWq = false, name = "Zul'tan the Numerous", searchTerm = "zul'tan" },
    }
}


aetzonesdebug = nil
aetdebug = nil




-- /run print(GetCurrentMapAreaID())
local aet = CreateFrame("frame", "ArgusEliteTrackerFrames", UIParent)
local events = {}
local zoneIds = { krokuun = 1135, antoranWastes = 1171, macAree = 1170 }
local selectedZone = zones.krokuun
local selectedZoneName = "krokuun"
local groupCreationActive = false

aet.groups = {
    -- groupId = { elite }
}

if debugging then
    aetzonesdebug = zones
    aetdebug = aet
end



local function setEliteNa(elite)
    if(not elite.killed) and (not elite.isWq) then
        elite.status.Label:SetTextColor(1, 0.45, 0.08, 1)
        elite.status.Label:SetText("(" .. elite.searchResults .. ") N/A")
    end
end


local function resetAll()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.searchResults = 0
            setEliteNa(elite)
        end
    end
end


local function updateEliteStatus(elite)
    if elite.killed then
        elite.button.Label:SetTextColor(1, 1, 1, 0.2)
        elite.button:EnableMouse(false)
        elite.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
        elite.status.Label:SetText("Killed")
    elseif elite.isWq then
        elite.button:EnableMouse(false)
        elite.status.Label:SetTextColor(0.85, 0.85, 0.2, 1)
        elite.status.Label:SetText("WQ")
    else
        if elite.searchResults > 0 then
            elite.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
            elite.status.Label:SetText("(" .. elite.searchResults .. ") YES")
        else
            elite.status.Label:SetTextColor(0.96, 0.30, 0.29, 1)
            elite.status.Label:SetText("(0) NO")
        end
    end
end


local function HideFiltered()

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
            end
        end
    end

    return numberOfHidden
end



-- You're my man
function updateArgusEliteTrackerFrame()
    numberOfHidden = HideFiltered()
    local height = ((#selectedZone - numberOfHidden) * 15) + 50
    aet.elitesContainer:SetHeight(height)

    local visibleCounter = 1

    for i, elite in ipairs(selectedZone) do

        local yOffset = -25 + (-(visibleCounter * 15))

        if not elite.hidden then
            elite:Show(yOffset)
            visibleCounter = visibleCounter + 1
        else
            elite:Hide()
        end
        updateEliteStatus(elite)
    end
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

local function disableGroupFunctionality()
    for name,elites in pairs(zones) do
        for i,elite in pairs(zones[name]) do
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

local function enableGroupFunctionality()
    for name,elites in pairs(zones) do
        for i,elite in pairs(zones[name]) do
            elite.cButton:EnableMouse(false)
            elite.cButton.Label:SetTextColor(1, 1, 1, 1)
            elite.jButton:EnableMouse(false)
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
                table.insert(worldQuestNames, questName)
            end
        end

        for i, elite in ipairs(elites) do
            elite.isWq = false
            for index = 1, #worldQuestNames do
                if worldQuestNames[index]:lower() == elite.name:lower() then
                    elite.isWq = true
                end
            end
        end
    end
end


local function updateWorldQuestsForAllArgusZones()
    local currentMapOpen = GetCurrentMapAreaID()

    for name, elites in pairs(zones) do
        if name == selectedZoneName then
            last = name
        else
            local zoneId = zoneIds[name]
            updateWorldQuests(elites, zoneId)
        end
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

        for name, _ in pairs(zones) do
            for _, elite in pairs(zones[name]) do
                elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE

                if not elite.killed then
                    setEliteNa(elite)
                end

                if groupName:find(elite.searchTerm) and not isDelisted then
                    aet.groups[id] = elite
                    elite.groups[id] = { id = id, age = age }
                    elite.searchResults = elite.searchResults + 1
                    elite.groupCount = elite.groupCount + 1
                    break
                end

                updateEliteStatus(elite)
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

    table.wipe(elite.groups)

    -- if elite.killed or elite.isWq then
    --     return
    -- end

    elite.searchResults = 0
    local numResults, resultTable = C_LFGList.GetSearchResults()

    debug("returned: " .. tostring(#resultTable))

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local id, activityId, groupName, comment, voiceChat, iLvl, honorLevel,
            age, numBNetFriends, numCharFriends, numGuildMates, isDelisted = C_LFGList.GetSearchResultInfo(resultId);

        groupName = groupName:lower()
        debug(groupName)
        debug(groupName .. " is delisted: " .. tostring(isDelisted))
        
        if groupName:find(elite.searchTerm) and not isDelisted then
            aet.groups[id] = elite
            elite.groups[id] = { id = id, age = age }
            elite.searchResults = elite.searchResults + 1
            elite.groupCount = elite.groupCount + 1
        end
    end

    debug(elite.searchResults)
    updateEliteStatus(elite)
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

    updateWorldQuestsForAllArgusZones()
    elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE

    -- if elite.killed then
    --     updateEliteStatus(elite)
    --     return
    -- end

    local languages = C_LFGList.GetLanguageSearchFilter()
    C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(elite.searchTerm), 0, 0, languages)
    disableAllButtons()
    elite.button:SetScript("OnUpdate", onUpdate)
end


local function initiateSearch(self)
    self.elite.searchResults = 0
    setEliteNa(self.elite)
    searchForGroup(self.elite)
end


-- LFGList.lua l730
-- local activities = C_LFGList.GetAvailableActivities(self.selectedCategory, 0, bit.bor(self.baseFilters, self.selectedFilters));
-- LFGList.lua l884
-- if(C_LFGList.CreateListing(activityID, name, itemLevel, honorLevel, voiceChatInfo, description, autoAccept, privateGroup, questID)) then

local function initiateZones()

    -- C_Timer.After(5, function() debug("initiateZones called") end)
    local yOffset = 15
    local statusWidth = 50

    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        updateWorldQuests(elites, zoneId)

        for i, elite in pairs(zones[name]) do
            local name = elite.name
            local buttonText = elite.name

            elite.killed = IsQuestFlaggedCompleted(elite.questId) -- HERE
            elite.groups = {}
            elite.groupCount = 0
            -- debug(elite.name .. "is killed: " .. tostring(elite.killed))

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


            elite.button = CreateFrame("button", nil, aet.elitesContainer)
            elite.button:SetBackdrop(plainBackdrop)
            elite.button:SetBackdropColor(0, 0, 0, 0)
            elite.button:SetBackdropBorderColor(1, 1, 1, 0)
            elite.button:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.button:SetSize(aet:GetWidth() - 50 - statusWidth - 10, 16)
            elite.button.Label = addonData:createLabel(buttonText, 12, "CENTER", elite.button)
            elite.button.elite = elite

            if not elite.killed then
                elite.button:SetScript("OnClick", initiateSearch)
            end

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
                self.button:Hide()
                self.status:Hide()
            end

            function elite:Show(yOffset)

                if yOffset ~= nil then
                    elite.cButton:SetPoint("topleft", aet.elitesContainer, "topleft", 10, yOffset)
                    elite.jButton:SetPoint("topleft", aet.elitesContainer, "topleft", 10, yOffset)
                    elite.button:SetPoint("topleft", aet.elitesContainer, "topleft", 50, yOffset)
                    elite.status:SetPoint("topright", aet.elitesContainer, "topright", -10, yOffset)
                end

                -- self.cButton:Show()

                if elite.groupCount > 0 then
                    self.jButton:Show()
                    self.cButton:Hide()
                elseif elite.groupCount == 0 then
                    self.cButton:Show()
                    self.jButton:Hide()
                end

                -- self.jButton:Show()
                self.button:Show()
                self.status:Show()
            end

            function elite:Update()
                if elite.killed then
                    elite.button.Label:SetTextColor(1, 1, 1, 0.2)
                    -- elite.button:EnableMouse(false)
                    elite.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
                    elite.status.Label:SetText("Killed")
                elseif elite.isWq then
                    elite.button:EnableMouse(false)
                    elite.status.Label:SetTextColor(0.85, 0.85, 0.2, 1)
                    elite.status.Label:SetText("WQ")
                else
                    if elite.searchResults > 0 then
                        elite.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
                        elite.status.Label:SetText("(" .. elite.searchResults .. ") YES")
                    else
                        elite.status.Label:SetTextColor(0.96, 0.30, 0.29, 1)
                        elite.status.Label:SetText("(0) NO")
                    end
                end
            end

            function elite:ApplyToGroup()
                local any = false

                for _, v in pairs(self.groups) do
                    if not v.applied then 
                        C_LFGList.ApplyToGroup(v.id, "Joined from ArgusEliteTracker", true, true, true);
                        v.applied = true
                        any = true
                        break
                    end
                end

                if not any then
                    self.searchResults = 0
                    updateArgusEliteTrackerFrame()
                end
            end

            function elite:CreateGroup()
                local activityId = 16
                -- C_LFGList.CreateListing(activityID, name, itemLevel, honorLevel, voiceChatInfo, description, autoAccept, privateGroup, questID)
                debug(self.name)

                if(C_LFGList.CreateListing(16, "fictive", 0, 0, "", self.name .. ". Group created with ArgusEliteTracker.", true, false)) then
                    
                else
                    debug("NOOOOOOO")
                end
            end

            elite:Hide()

            if elite.killed or elite.isWq then
                updateEliteStatus(elite)
            else
                setEliteNa(elite)                
            end
        end
    end
    
    -- This will cause an ADDON_ACTION_BLOCKED event (because it didn't originate from a user hardware click?)
    -- searchForAll()
end


---------------------------------------------
--  Create the addon frames
---------------------------------------------
function createArgusEliteTrackerFrames()
    aet:SetSize(300, 20)
    aet:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16, edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 1 })
    aet:SetBackdropColor(0, 0, 0, 1)
    aet:SetBackdropBorderColor(0, 0, 0, 1)
    aet:SetPoint("CENTER", 0, 0)
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

    aet.elitesContainer:SetMovable(true)
    aet.elitesContainer:EnableMouse(true)
    aet.elitesContainer:RegisterForDrag("LeftButton")
    aet.elitesContainer:SetResizable(true)
    aet.elitesContainer:SetPoint("TOPLEFT", 0, -18)

    -- Create a header for our addon frame
    aet.TitleBar = CreateFrame("frame", "argusheader", aet)
    aet.TitleBar:SetPoint("topleft", aet, "topleft", 1, -1)
    aet.TitleBar:SetPoint("topright", aet, "topright", -1, -1)
    aet.TitleBar:SetHeight(20)
    aet.TitleBar:EnableMouse(false)
    aet.TitleBar:SetBackdrop(plainBackdrop)
    aet.TitleBar:SetBackdropColor(1, .84, 0, 1)
    aet.TitleBar:SetBackdropBorderColor(0, 0, 0, 0)
    aet.TitleBar.Label = aet.TitleBar:CreateFontString()
    aet.TitleBar.Label:SetFont(defaultFontName, 12)
    aet.TitleBar.Label:SetPoint("CENTER", aet.TitleBar, "CENTER", 0, 0)
    aet.TitleBar.Label:SetText("Argus Elite Tracker")
    aet.elitesContainer:SetFrameLevel(aet.TitleBar:GetFrameLevel() - 1)

    aet.SearchAll = CreateFrame("button", nil, aet)
    aet.SearchAll:SetPoint("left", aet.TitleBar, "left", 2, 0)
    aet.SearchAll:SetSize(55, 16)
    aet.SearchAll:EnableMouse(true)
    aet.SearchAll:SetBackdrop(plainBackdrop)
    aet.SearchAll:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.SearchAll:SetBackdropColor(0, 0, 0, 1)
    aet.SearchAll:SetBackdropBorderColor(1, 1, 1, 0)
    aet.SearchAll.Label = addonData:createLabel("Search all", 10, "CENTER", aet.SearchAll)
    aet.SearchAll.Label:SetTextColor(0.95, 0.95, 0.95, 0.95, 1)

    aet.Reset = CreateFrame("button", "argusreset", aet)
    aet.Reset:SetPoint("right", aet.TitleBar, "right", -56, 0)
    aet.Reset:SetSize(16, 16)
    aet.Reset:SetBackdrop(plainBackdrop)
    aet.Reset:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Reset:SetBackdropColor(0, 0, 0, 1)
    aet.Reset:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Reset.Label = addonData:createLabel("R", 10, "CENTER", aet.Reset)
    aet.Reset.Label:SetTextColor(0.75, 0.75, 0.75, 0.75, 1)

    aet.Options = CreateFrame("button", nil, aet)
    aet.Options:SetPoint("right", aet.TitleBar, "right", -38, 0)
    aet.Options:SetSize(16, 16)
    aet.Options:EnableMouse(true)
    aet.Options:SetBackdrop(plainBackdrop)
    aet.Options:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Options:SetBackdropColor(0, 0, 0, 1)
    aet.Options:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Options.Label = addonData:createLabel("?", 10, "CENTER", aet.Options)
    aet.Options.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    aet.Minimize = CreateFrame("button", "argusminimize", aet)
    aet.Minimize:SetPoint("right", aet.TitleBar, "right", -20, 0)
    aet.Minimize:SetSize(16, 16)
    aet.Minimize:SetBackdrop(plainBackdrop)
    aet.Minimize:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Minimize:SetBackdropColor(0, 0, 0, 1)
    aet.Minimize:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Minimize.Label = addonData:createLabel("-", 10, "CENTER", aet.Minimize)
    aet.Minimize.Label:SetTextColor(0.75, 0.75, 0.75, 1)

    aet.Close = CreateFrame("button", "argusclose", aet)
    aet.Close:SetPoint("right", aet.TitleBar, "right", -2, 0)
    aet.Close:SetSize(16, 16)
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
    aet.elitesContainer.krokuun:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -12)
    aet.elitesContainer.krokuun:SetSize(75, 20)
    aet.elitesContainer.krokuun.Label = addonData:createLabel("Krokuun", 12, "CENTER", aet.elitesContainer.krokuun)

    -- antoranWastes
    aet.elitesContainer.antoranWastes = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.antoranWastes:SetBackdrop(plainBackdrop)
    aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.2)
    aet.elitesContainer.antoranWastes:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.antoranWastes:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.antoranWastes:SetPoint("topleft", aet.elitesContainer, "topleft", (aet:GetWidth() / 3), -12)
    aet.elitesContainer.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, 20)
    aet.elitesContainer.antoranWastes.Label = addonData:createLabel("Antoran Wastes", 12, "CENTER", aet.elitesContainer.antoranWastes)

    -- macAree
    aet.elitesContainer.macAree = CreateFrame("button", nil, aet.elitesContainer)
    aet.elitesContainer.macAree:SetBackdrop(plainBackdrop)
    aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.2)
    aet.elitesContainer.macAree:SetBackdropBorderColor(1, 1, 1, 0)
    aet.elitesContainer.macAree:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
    aet.elitesContainer.macAree:SetPoint("topleft", aet.elitesContainer, "topleft", 10 + (aet:GetWidth() / 3) * 2 + 5, -12)
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

    initiateZones()
    updateArgusEliteTrackerFrame()
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
        -- debug("removing group " .. tostring(id) .. " from " .. elite.name)
        elite.searchResults = elite.searchResults - 1
        elite.groups[id] = nil
        aet.groups[id] = nil
        elite.groupCount = elite.groupCount - 1

        debug("group count: " .. elite.name .. ": " .. elite.groupCount)

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
            -- debug(tostring(id) .. " is DELISTED")
        end
    end
end

function events:LFG_LIST_APPLICATION_STATUS_UPDATED(...)

    local id, newStatus, oldStatus = ...
    -- debug("newStatus: " .. newStatus, "oldStatus: " .. oldStatus)

    if newStatus == "declined" then
        removeGroup(id)
    elseif newStatus == "declined_full" then
        removeGroup(id)
    elseif newStatus == "declined_delisted" then
        removeGroup(id)
    elseif newStatus == "timedout" then
        removeGroup(id)
    elseif newStatus == "invitedeclined" then
        removeGroup(id)
    elseif newStatus == "failed" then
        removeGroup(id)
    elseif newStatus == "cancelled" then
        removeGroup(id)
    elseif newStatus == "applied" then
        debug("we applied")
    elseif newStatus == "invited" then
        debug("we were invited ^_^")
    end
end


function updateGroupFunctionality()

    local groupLeader = UnitIsGroupLeader("player")
    groupCreationActive = select(1, C_LFGList.GetActiveEntryInfo())

    debug("groupCreationActive: " .. tostring(groupCreationActive))

    if groupCreationActive then
        disableGroupFunctionality()
    else
        if (not IsInGroup()) or (UnitIsGroupLeader("player")) then
            enableGroupFunctionality()
        else
            disableGroupFunctionality()
        end
    end

    updateArgusEliteTrackerFrame()
end

function events:GROUP_LEFT(...)
    updateGroupFunctionality()
end

function events:GROUP_JOINED(...)
    updateGroupFunctionality()
end

function events:PARTY_LEADER_CHANGED(...)
    updateGroupFunctionality()
end

---------------------------------------------
--  Register events
---------------------------------------------

aet:SetScript("OnEvent", function(self, event, ...)
    -- debug("event: " .. event)
    events[event](self, ...)
end)

for key, value in pairs(events) do
    aet:RegisterEvent(key)
end