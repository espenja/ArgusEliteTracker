local addonName, addonData = ...
local debugging = false

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
        { searchResults = 0, questId = 48564, killed = false, isWq = false, name = "Commander Endaxis", searchTerms = { "endaxis" }},
        { searchResults = 0, questId = 48562, killed = false, isWq = false, name = "Commander Sathrenael", searchTerms = { "sathrenael" }},
        { searchResults = 0, questId = 48563, killed = false, isWq = false, name = "Commander Vecaya", searchTerms = { "vecaya" }},
        { searchResults = 0, questId = 48666, killed = false, isWq = false, name = "Imp Mother Laglath", searchTerms = { "laglath", "imp mother" }},
        { searchResults = 0, questId = 48561, killed = false, isWq = false, name = "Khazaduum", searchTerms = { "khazaduum" }},
        { searchResults = 0, questId = 48667, killed = false, isWq = false, name = "Naroua", searchTerms = { "naroua" }},
        { searchResults = 0, questId = 48627, killed = false, isWq = false, name = "Siegemaster Voraan", searchTerms = { "voraan", "siegemaster" }},
        { searchResults = 0, questId = 48565, killed = false, isWq = false, name = "Sister Subversia", searchTerms = { "subversia" }},
        { searchResults = 0, questId = 48628, killed = false, isWq = false, name = "Talestra the Vile", searchTerms = { "talestra", "the vile" }},
        { searchResults = 0, questId = 48665, killed = false, isWq = false, name = "Tar Spitter", searchTerms = { "tar spitter" }},
        { searchResults = 0, questId = 48664, killed = false, isWq = false, name = "Tereck the Selector", searchTerms = { "tereck", "selector" }},
        { searchResults = 0, questId = 48629, killed = false, isWq = false, name = "Vagath the Betrayed", searchTerms = { "vagath", "the betrayed" }},
   },
    antoranWastes = {
        { searchResults = 0, questId = 48817, killed = false, isWq = false, name = "Admiral Rel'var", searchTerms = { "rel'var", "admiral" }},
        { searchResults = 0, questId = 48818, killed = false, isWq = false, name = "All-Seer Xanarian", searchTerms = { "xanarian", "all-seer" }},
        { searchResults = 0, questId = 49183, killed = false, isWq = false, name = "Blistermaw", searchTerms = { "blistermaw" }},
        { searchResults = 0, questId = 48865, killed = false, isWq = false, name = "Chief Alchemist Munculus", searchTerms = { "munculus" }},
        { searchResults = 0, questId = 48816, killed = false, isWq = false, name = "Commander Texlaz", searchTerms = { "texlaz" }},
        { searchResults = 0, questId = 48968, killed = false, isWq = false, name = "Doomcaster Suprax", searchTerms = { "suprax" }},
        { searchResults = 0, questId = 49241, killed = false, isWq = false, name = "Gar'zoth", searchTerms = { "gar'zoth", "gar zoth" }},
        { searchResults = 0, questId = 48821, killed = false, isWq = false, name = "Houndmaster Kerrax", searchTerms = { "kerrax", "houndmaster" }},
        { searchResults = 0, questId = 48815, killed = false, isWq = false, name = "Inquisitor Vethroz", searchTerms = { "vethroz", "inquisitor" }},
        { searchResults = 0, questId = 48813, killed = false, isWq = false, name = "Lieutenant Xakaar", searchTerms = { "lieutenant", "xakaar" }},
        { searchResults = 0, questId = 49240, killed = false, isWq = false, name = "Mistress Il'thendra", searchTerms = { "il'thendra" }},
        { searchResults = 0, questId = 48970, killed = false, isWq = false, name = "Mother Rosula", searchTerms = { "rosula" }},
        { searchResults = 0, questId = 48809, killed = false, isWq = false, name = "Puscilla", searchTerms = { "puscilla" }},
        { searchResults = 0, questId = 48971, killed = false, isWq = false, name = "Rezira the Seer", searchTerms = { "rezira" }},
        { searchResults = 0, questId = 48967, killed = false, isWq = false, name = "Squadron Commander Vishax", searchTerms = { "vishax", "squadron" }},
        { searchResults = 0, questId = 48966, killed = false, isWq = false, name = "The Many-Faced Devourer", searchTerms = { "many-faced", "face" }},
        { searchResults = 0, questId = 48812, killed = false, isWq = false, name = "Varga", searchTerms = { "varga" }},
        { searchResults = 0, questId = 48811, killed = false, isWq = false, name = "Ven'orn", searchTerms = { "ven'orn", "venorn" }},
        { searchResults = 0, questId = 48824, killed = false, isWq = false, name = "Void Warden Valsuran", searchTerms = { "valsuran" }},
        { searchResults = 0, questId = 48810, killed = false, isWq = false, name = "Vrax'thul", searchTerms = { "vrax'thul", "vrax" }},
        { searchResults = 0, questId = 48822, killed = false, isWq = false, name = "Watcher Aival", searchTerms = { "aival" }},
        { searchResults = 0, questId = 48820, killed = false, isWq = false, name = "Worldsplitter Skuul", searchTerms = { "skuul", "worldsplitter" }},
        { searchResults = 0, questId = 48814, killed = false, isWq = false, name = "Wrath-Lord Yarez", searchTerms = { "wrath-lord", "yarez", "wrath lord" }},
   },
    macAree = {
        { searchResults = 0, questId = 48709, killed = false, isWq = false, name = "Ataxon", searchTerms = { "ataxon" }},
        { searchResults = 0, questId = 48700, killed = false, isWq = false, name = "Baruut the Bloodthirsty", searchTerms = { "baruut", "bloodthirsty" }},
        { searchResults = 0, questId = 48707, killed = false, isWq = false, name = "Captain Faruq", searchTerms = { "faruq" }},
        { searchResults = 0, questId = 48720, killed = false, isWq = false, name = "Commander Xethgar", searchTerms = { "xethgar" }},
        { searchResults = 0, questId = 48702, killed = false, isWq = false, name = "Feasel the Muffin Thief", searchTerms = { "feasel", "muffin" }},
        { searchResults = 0, questId = 48711, killed = false, isWq = false, name = "Herald of Chaos", searchTerms = { "herald", "of chaos" }},
        { searchResults = 0, questId = 48718, killed = false, isWq = false, name = "Instructor Tarahna", searchTerms = { "tarahna", "instructor" }},
        { searchResults = 0, questId = 48713, killed = false, isWq = false, name = "Jed'hin Champion Vorusk", searchTerms = { "jed'hin", "vorusk" }},
        { searchResults = 0, questId = 48697, killed = false, isWq = false, name = "Kaara the Pale", searchTerms = { "kaara", "pale" }},
        { searchResults = 0, questId = 48714, killed = false, isWq = false, name = "Overseer Y'Beda", searchTerms = { "y'beda", "beda" }},
        { searchResults = 0, questId = 48717, killed = false, isWq = false, name = "Overseer Y'Morna", searchTerms = { "y'morna", "morna" }}, --jens :'D
        { searchResults = 0, questId = 48716, killed = false, isWq = false, name = "Overseer Y'Sorna", searchTerms = { "y'sorna", "sorna", "y sorna" }},
        { searchResults = 0, questId = 48712, killed = false, isWq = false, name = "Sabuul", searchTerms = { "sabuul" }},
        { searchResults = 0, questId = 48692, killed = false, isWq = false, name = "Shadowcaster Voruun", searchTerms = { "voruun", "shadowcaster" }},
        { searchResults = 0, questId = 48721, killed = false, isWq = false, name = "Skreeg the Devourer", searchTerms = { "skreeg" }},
        { searchResults = 0, questId = 48935, killed = false, isWq = false, name = "Slithon the Last", searchTerms = { "slithon", "the last" }},
        { searchResults = 0, questId = 48710, killed = false, isWq = false, name = "Sorolis the Ill-Fated", searchTerms = { "sorolis", "ill-fated" }},
        { searchResults = 0, questId = 48693, killed = false, isWq = false, name = "Soultwisted Monstrosity", searchTerms = { "monstrosity", "soultwisted" }},
        { searchResults = 0, questId = 48706, killed = false, isWq = false, name = "Turek the Lucid", searchTerms = { "turek", "the lucid" }},
        { searchResults = 0, questId = 48708, killed = false, isWq = false, name = "Umbraliss", searchTerms = { "umbraliss" }},
        { searchResults = 0, questId = 48705, killed = false, isWq = false, name = "Venomtail Skyfin", searchTerms = { "venomtail", "skyfin", "Ядовитый" }},
        { searchResults = 0, questId = 48704, killed = false, isWq = false, name = "Vigilant Kuro", searchTerms = { "kuro" }},
        { searchResults = 0, questId = 48703, killed = false, isWq = false, name = "Vigilant Thanos", searchTerms = { "thanos" }},
        { searchResults = 0, questId = 48695, killed = false, isWq = false, name = "Wrangler Kravos", searchTerms = { "kravos", "wrangler" }},
        { searchResults = 0, questId = 48719, killed = false, isWq = false, name = "Zul'tan the Numerous", searchTerms = { "zul'tan", "numerous" }},
    }
}

-- /run print(GetCurrentMapAreaID())
local aet = CreateFrame("frame", "ArgusEliteTrackerFrames", UIParent)
local events = {}
local zoneIds = { krokuun = 1135, antoranWastes = 1171, macAree = 1170 }
local selectedZone = zones.krokuun



local function setEliteNa(elite)
    if(not elite.killed) and (not elite.isWq) then
        elite.status.Label:SetTextColor(1, 0.45, 0.08, 1)
        elite.status.Label:SetText("(" .. elite.searchResults .. ") N/A")
    end
end


local function resetAll()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.searchIndex = 0
            elite.searchResults = 0
            setEliteNa(elite)
        end
    end
end


local function updateFrame()
    local height = (#selectedZone * 15) + 50

    aet.elitesContainer:SetHeight(height)
    for i, elite in ipairs(selectedZone) do
        elite.button:Show()
        elite.status:Show()
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

    debug("On Argus: ", onArgus)
    return onArgus
end


local function hideZone(zone)
    for i, elite in ipairs(zones[zone]) do
        elite.button:Hide()
        elite.status:Hide()
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


local function updateSearchedElite(elite)
    if elite.killed or elite.isWq then
        return
    end

    elite.searchResults = 0
    local _, resultTable = C_LFGList.GetSearchResults()

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local _, _, groupName, _, _, _, _, _, _, _, _, _, _, _ = C_LFGList.GetSearchResultInfo(resultId)
        groupName = groupName:lower()
        
        for i = 1, #elite.searchTerms do
            if groupName:find(elite.searchTerms[i]) then
                elite.searchResults = elite.searchResults + 1
            end
        end
    end

    updateEliteStatus(elite)
end





local function disableAllButtons()
    aet.SearchAll:EnableMouse(false)
    aet.SearchAll.Label:SetTextColor(1, 1, 1, 0.2)

    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.button:EnableMouse(false)
            elite.button.Label:SetTextColor(1, 1, 1, 0.2)
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
                    -- C_Timer.After(5, function () debug("ELITE " .. elite.name .. " SET AS WORLD QUEST") end)
                end
            end
        end
    end
end


local function updateWorldQuestsForAllArgusZones()
    -- C_Timer.After(5, function() debug("called updateWorldQuestForAllArgusZones") end)
    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        updateWorldQuests(elites, zoneId)
    end
end


------------------------------------
--  Search all groups
------------------------------------

local secondCounterAll = 0
local searchForSecondsAll = 3

local function searchForAllGroupsCallback()

    updateWorldQuestsForAllArgusZones()
    local numResults, resultTable = C_LFGList.GetSearchResults()

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local _, _, groupName, _, _, _, _, _, _, _, _, _, _, _ = C_LFGList.GetSearchResultInfo(resultId)
        groupName = groupName:lower()

        for name, _ in pairs(zones) do
            for _, elite in pairs(zones[name]) do
                elite.searchIndex = 0
                elite.killed = IsQuestFlaggedCompleted(elite.questId)

                if not elite.killed then
                    setEliteNa(elite)
                    for searchTermIndex = 1, #elite.searchTerms do
                        if groupName:find(elite.searchTerms[searchTermIndex]) then
                            elite.searchResults = elite.searchResults + 1
                            break
                        end
                    end
                end
                updateEliteStatus(elite)
            end
        end
    end
end


local function onUpdateAll(self, elapsed)
    secondCounterAll = secondCounterAll + elapsed

    if secondCounterAll >= searchForSecondsAll then
        self:SetScript("OnUpdate", nil)
        secondCounterAll = 0
        enableAllButtons()
        searchForAllGroupsCallback()
    end
end


local function searchForAll()
    updateFrame()
    disableAllButtons()
    local languages = C_LFGList.GetLanguageSearchFilter()
    C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(""), 0, 0, languages)
    aet.SearchAll:SetScript("OnUpdate", onUpdateAll)
end


local secondCounter = 0
local searchForSeconds = 3

local function onUpdate(self, elapsed)

    secondCounter = secondCounter + elapsed

    if secondCounter >= searchForSeconds then
        self:SetScript("OnUpdate", nil)
        secondCounter = 0
        enableAllButtons()
        updateSearchedElite(self.elite)
    end
end

------------------------------------
--  Search for one group
------------------------------------

local function searchForGroup(elite)

    updateWorldQuestsForAllArgusZones()
    elite.killed = IsQuestFlaggedCompleted(elite.questId)

    if elite.killed then
        updateEliteStatus(elite)
        return
    end

    local languages = C_LFGList.GetLanguageSearchFilter()
    C_LFGList.Search(6, LFGListSearchPanel_ParseSearchTerms(""), 0, 0, languages)
    disableAllButtons()
    elite.button:SetScript("OnUpdate", onUpdate)
end


local function initiateSearch(self)
    self.elite.searchResults = 0
    setEliteNa(self.elite)
    searchForGroup(self.elite)
end


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

            elite.killed = IsQuestFlaggedCompleted(elite.questId)
            -- debug(elite.name .. "is killed: " .. tostring(elite.killed))

            elite.button = CreateFrame("button", nil, aet.elitesContainer)
            elite.button:SetBackdrop(plainBackdrop)
            elite.button:SetBackdropColor(0, 0, 0, 0)
            elite.button:SetBackdropBorderColor(1, 1, 1, 0)
            elite.button:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.button:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -25 + (-(i * yOffset)))
            elite.button:SetSize(aet:GetWidth() - 20 - statusWidth - 10, 16)
            elite.button.Label = addonData:createLabel(buttonText, 12, "CENTER", elite.button)
            elite.button.elite = elite
            elite.button:Hide()

            if not elite.killed then
                elite.button:SetScript("OnClick", initiateSearch)
            end

            elite.status = CreateFrame("Frame", nil, aet.elitesContainer)
            elite.status:SetBackdrop(plainBackdrop)
            elite.status:SetBackdropColor(0, 0, 0, 0)
            elite.status:SetBackdropBorderColor(1, 1, 1, 0)
            elite.status:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.status:SetPoint("topright", aet.elitesContainer, "topright", -10, -25 + (-(i * yOffset)))
            elite.status:SetSize(statusWidth, 15)
            elite.status.Label = addonData:createLabel("N/A", 12, "CENTER", elite.status)
            elite.status:Hide()

            if elite.killed or elite.isWq then
                debug("YES")
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

    aet.Minimize = CreateFrame("button", "argusminimize", aet)
    aet.Minimize:SetPoint("right", aet.TitleBar, "right", -20, 0)
    aet.Minimize:SetSize(16, 16)
    aet.Minimize:SetBackdrop(plainBackdrop)
    aet.Minimize:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Minimize:SetBackdropColor(0, 0, 0, 1)
    aet.Minimize:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Minimize.Label = addonData:createLabel("-", 10, "CENTER", aet.Minimize)
    aet.Minimize.Label:SetTextColor(0.5, 0.5, 0.5, 1)

    aet.Close = CreateFrame("button", "argusclose", aet)
    aet.Close:SetPoint("right", aet.TitleBar, "right", -2, 0)
    aet.Close:SetSize(16, 16)
    aet.Close:SetBackdrop(plainBackdrop)
    aet.Close:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Close:SetBackdropColor(0, 0, 0, 1)
    aet.Close:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Close.Label = addonData:createLabel("X", 10, "CENTER", aet.Close)
    aet.Close.Label:SetTextColor(0.5, 0.5, 0.5, 1)

    aet.Reset = CreateFrame("button", "argusreset", aet)
    aet.Reset:SetPoint("right", aet.TitleBar, "right", -38, 0)
    aet.Reset:SetSize(16, 16)
    aet.Reset:SetBackdrop(plainBackdrop)
    aet.Reset:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
    aet.Reset:SetBackdropColor(0, 0, 0, 1)
    aet.Reset:SetBackdropBorderColor(1, 1, 1, 0)
    aet.Reset.Label = addonData:createLabel("R", 10, "CENTER", aet.Reset)
    aet.Reset.Label:SetTextColor(0.5, 0.5, 0.5, 0.5, 1)

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
        updateFrame()
    end)

    aet.elitesContainer.antoranWastes:SetScript("OnClick", function()
        selectedZone = zones.antoranWastes
        aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.50)
        aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.20)
        hideZone("krokuun")
        hideZone("macAree")
        updateFrame()
    end)

    aet.elitesContainer.macAree:SetScript("OnClick", function()
        selectedZone = zones.macAree
        aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
        aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.50)
        hideZone("krokuun")
        hideZone("antoranWastes")
        updateFrame()
    end)

    aet.SearchAll:SetScript("OnClick", function()
        searchForAll()
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

        -- if playerIsOnArgus() then
        --     ArgusEliteTrackerConfig.aetHiddenWhileOnArgus = true
        -- else
        --     ArgusEliteTrackerConfig.aetHiddenWhileOnArgus = false
        -- end 

        debug("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
    end)

    initiateZones()
    updateFrame()
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
        -- if playerIsOnArgus() then
        --     ArgusEliteTrackerConfig.aetHiddenWhileOnArgus = ArgusEliteTrackerConfig.aetHidden
        -- end

        aet:Hide()
    end
    if string.upper(argument) == "SHOW" then
        debug("Argus Elite Tracker is |cFF00FF00visible|r|cFFFFFF00.")
        ArgusEliteTrackerConfig.closed = false
        -- if playerIsOnArgus() then
        --     ArgusEliteTrackerConfig.aetHiddenWhileOnArgus = ArgusEliteTrackerConfig.aetHidden
        -- end

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

        -- if playerIsOnArgus() then
        --     ArgusEliteTrackerConfig.aetHiddenWhileOnArgus = ArgusEliteTrackerConfig.aetHidden
        -- end
    end
end


function afterPlayerEnteredWorld()
    -- if ArgusEliteTrackerConfig.aetHiddenWhileOnArgus then return end
    local onArgus = playerIsOnArgus()

    if ArgusEliteTrackerConfig.minimized == true then
        aet.elitesContainer:Hide()
    else
        aet.elitesContainer:Show()
    end

    if (onArgus and ArgusEliteTrackerConfig.autoOpenOnArgus) or (ArgusEliteTrackerConfig.closed == false) then
        if ArgusEliteTrackerConfig.autoOpenOnArgus and ArgusEliteTrackerConfig.minimized then
            ArgusEliteTrackerConfig.minimized = false
            aet.elitesContainer:Show()
        end

        ArgusEliteTrackerConfig.closed = false
        aet:Show()
    else
        ArgusEliteTrackerConfig.closed = true
        aet:Hide()
    end
end


function events:PLAYER_ENTERING_WORLD(...)
    debug("|cFF00FF00" .. addonName .. "|r|cFFFFFFFF is loaded.")
    aet:Hide()
    C_Timer.After(1, afterPlayerEnteredWorld)
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