local addonName, addonData = ...

local debug = false

local framePositionX = 100
local framePositionY = 400
local defaultFontName = "Fonts/FRIZQT__.TTF"
local plainBackdrop = {edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0.75, bgFile = [[Interface\Tooltips\UI-Tooltip-Background]], tileSize = 4, tile = false}


local eliteOptions = {
    aetHidden = false,
    aetHiddenWhileOnArgus = false,
    statusWidth = 50,
    firstLoad = true,
    minimized = false,
}

local zones = {
    krokuun = {
        { searchResults = 0, questId = 48564, complete = false, isWq = false, name = "Commander Endaxis", searchTerms = { "endaxis" }},
        { searchResults = 0, questId = 48562, complete = false, isWq = false, name = "Commander Sathrenael", searchTerms = { "sathrenael" }},
        { searchResults = 0, questId = 48563, complete = false, isWq = false, name = "Commander Vecaya", searchTerms = { "vecaya" }},
        { searchResults = 0, questId = 48666, complete = false, isWq = false, name = "Imp Mother Laglath", searchTerms = { "laglath", "imp mother" }},
        { searchResults = 0, questId = 48561, complete = false, isWq = false, name = "Khazaduum", searchTerms = { "khazaduum" }},
        { searchResults = 0, questId = 48667, complete = false, isWq = false, name = "Naroua", searchTerms = { "naroua" }},
        { searchResults = 0, questId = 48627, complete = false, isWq = false, name = "Siegemaster Voraan", searchTerms = { "voraan", "siegemaster" }},
        { searchResults = 0, questId = 48565, complete = false, isWq = false, name = "Sister Subversia", searchTerms = { "subversia" }},
        { searchResults = 0, questId = 48628, complete = false, isWq = false, name = "Talestra the Vile", searchTerms = { "talestra", "the vile" }},
        { searchResults = 0, questId = 48665, complete = false, isWq = false, name = "Tar Spitter", searchTerms = { "tar", "spitter" }},
        { searchResults = 0, questId = 48664, complete = false, isWq = false, name = "Tereck the Selector", searchTerms = { "tereck", "selector" }},
        { searchResults = 0, questId = 48629, complete = false, isWq = false, name = "Vagath the Betrayed", searchTerms = { "vagath", "the betrayed" }},
   },
    antoranWastes = {
        { searchResults = 0, questId = 48817, complete = false, isWq = false, name = "Admiral Rel'var", searchTerms = { "rel'var", "admiral" }},
        { searchResults = 0, questId = 48818, complete = false, isWq = false, name = "All-Seer Xanarian", searchTerms = { "xanarian", "all-seer" }},
        { searchResults = 0, questId = 49183, complete = false, isWq = false, name = "Blistermaw", searchTerms = { "blistermaw" }},
        { searchResults = 0, questId = 48865, complete = false, isWq = false, name = "Chief Alchemist Munculus", searchTerms = { "munculus" }},
        { searchResults = 0, questId = 48816, complete = false, isWq = false, name = "Commander Texlaz", searchTerms = { "texlaz" }},
        { searchResults = 0, questId = 48968, complete = false, isWq = false, name = "Doomcaster Suprax", searchTerms = { "suprax" }},
        { searchResults = 0, questId = 49241, complete = false, isWq = false, name = "Gar'zoth", searchTerms = { "gar'zoth", "gar zoth" }},
        { searchResults = 0, questId = 48821, complete = false, isWq = false, name = "Houndmaster Kerrax", searchTerms = { "kerrax", "houndmaster" }},
        { searchResults = 0, questId = 48815, complete = false, isWq = false, name = "Inquisitor Vethroz", searchTerms = { "vethroz", "inquisitor" }},
        { searchResults = 0, questId = 48813, complete = false, isWq = false, name = "Lieutenant Xakaar", searchTerms = { "lieutenant", "xakaar" }},
        { searchResults = 0, questId = 49240, complete = false, isWq = false, name = "Mistress Il'thendra", searchTerms = { "il'thendra" }},
        { searchResults = 0, questId = 48970, complete = false, isWq = false, name = "Mother Rosula", searchTerms = { "rosula" }},
        { searchResults = 0, questId = 48809, complete = false, isWq = false, name = "Puscilla", searchTerms = { "puscilla" }},
        { searchResults = 0, questId = 48971, complete = false, isWq = false, name = "Rezira the Seer", searchTerms = { "rezira" }},
        { searchResults = 0, questId = 48967, complete = false, isWq = false, name = "Squadron Commander Vishax", searchTerms = { "vishax", "squadron" }},
        { searchResults = 0, questId = 48966, complete = false, isWq = false, name = "The Many-Faced Devourer", searchTerms = { "many-faced", "face" }},
        { searchResults = 0, questId = 48812, complete = false, isWq = false, name = "Varga", searchTerms = { "varga" }},
        { searchResults = 0, questId = 48811, complete = false, isWq = false, name = "Ven'orn", searchTerms = { "ven'orn", "venorn" }},
        { searchResults = 0, questId = 48824, complete = false, isWq = false, name = "Void Warden Valsuran", searchTerms = { "valsuran" }},
        { searchResults = 0, questId = 48810, complete = false, isWq = false, name = "Vrax'thul", searchTerms = { "vrax'thul", "vrax" }},
        { searchResults = 0, questId = 48822, complete = false, isWq = false, name = "Watcher Aival", searchTerms = { "aival" }},
        { searchResults = 0, questId = 48820, complete = false, isWq = false, name = "Worldsplitter Skuul", searchTerms = { "skuul", "worldsplitter" }},
        { searchResults = 0, questId = 48814, complete = false, isWq = false, name = "Wrath-Lord Yarez", searchTerms = { "wrath-lord", "yarez", "wrath lord" }},
   },
    macAree = {
        { searchResults = 0, questId = 48709, complete = false, isWq = false, name = "Ataxon", searchTerms = { "ataxon" }},
        { searchResults = 0, questId = 48700, complete = false, isWq = false, name = "Baruut the Bloodthirsty", searchTerms = { "baruut", "bloodthirsty" }},
        { searchResults = 0, questId = 48707, complete = false, isWq = false, name = "Captain Faruq", searchTerms = { "faruq" }},
        { searchResults = 0, questId = 48720, complete = false, isWq = false, name = "Commander Xethgar", searchTerms = { "xethgar" }},
        { searchResults = 0, questId = 48702, complete = false, isWq = false, name = "Feasel the Muffin Thief", searchTerms = { "feasel", "muffin" }},
        { searchResults = 0, questId = 48711, complete = false, isWq = false, name = "Herald of Chaos", searchTerms = { "herald", "of chaos" }},
        { searchResults = 0, questId = 48718, complete = false, isWq = false, name = "Instructor Tarahna", searchTerms = { "tarahna", "instructor" }},
        { searchResults = 0, questId = 48713, complete = false, isWq = false, name = "Jed'hin Champion Vorusk", searchTerms = { "jed'hin", "vorusk" }},
        { searchResults = 0, questId = 48697, complete = false, isWq = false, name = "Kaara the Pale", searchTerms = { "kaara", "pale" }},
        { searchResults = 0, questId = 48714, complete = false, isWq = false, name = "Overseer Y'Beda", searchTerms = { "y'beda", "beda" }},
        { searchResults = 0, questId = 48717, complete = false, isWq = false, name = "Overseer Y'Morna", searchTerms = { "y'morna", "morna" }}, --jens :'D
        { searchResults = 0, questId = 48716, complete = false, isWq = false, name = "Overseer Y'Sorna", searchTerms = { "y'sorna", "sorna", "y sorna" }},
        { searchResults = 0, questId = 48712, complete = false, isWq = false, name = "Sabuul", searchTerms = { "sabuul" }},
        { searchResults = 0, questId = 48692, complete = false, isWq = false, name = "Shadowcaster Voruun", searchTerms = { "voruun", "shadowcaster" }},
        { searchResults = 0, questId = 48721, complete = false, isWq = false, name = "Skreeg the Devourer", searchTerms = { "skreeg" }},
        { searchResults = 0, questId = 48936, complete = false, isWq = false, name = "Slithon the Last", searchTerms = { "slithon", "the last" }},
        { searchResults = 0, questId = 48710, complete = false, isWq = false, name = "Sorolis the Ill-Fated", searchTerms = { "sorolis", "ill-fated" }},
        { searchResults = 0, questId = 48693, complete = false, isWq = false, name = "Soultwisted Monstrosity", searchTerms = { "monstrosity", "soultwisted" }},
        { searchResults = 0, questId = 48706, complete = false, isWq = false, name = "Turek the Lucid", searchTerms = { "turek", "the lucid" }},
        { searchResults = 0, questId = 48708, complete = false, isWq = false, name = "Umbraliss", searchTerms = { "umbraliss" }},
        { searchResults = 0, questId = 48705, complete = false, isWq = false, name = "Venomtail Skyfin", searchTerms = { "venomtail", "skyfin" }},
        { searchResults = 0, questId = 48704, complete = false, isWq = false, name = "Vigilant Kuro", searchTerms = { "kuro" }},
        { searchResults = 0, questId = 48703, complete = false, isWq = false, name = "Vigilant Thanos", searchTerms = { "thanos" }},
        { searchResults = 0, questId = 48695, complete = false, isWq = false, name = "Wrangler Kravos", searchTerms = { "kravos", "wrangler" }},
        { searchResults = 0, questId = 48719, complete = false, isWq = false, name = "Zul'tan the Numerous", searchTerms = { "zul'tan", "numerous" }},
    }
}

local function createLabel(text, fontSize, alignment, parentFrame)
    local label = parentFrame:CreateFontString()
    label:SetFont(defaultFontName, fontSize)
    label:SetPoint(alignment, parentFrame, alignment, 0, 0)
    label:SetText(text)
    label:SetTextColor(1, 1, 1, 1)
    return label
end

-- /run print(GetCurrentMapAreaID())
local zoneIds = {
    krokuun = 1135,
    antoranWastes = 1171,
    macAree = 1170
}
local selectedZone = zones.krokuun


---------------------------------------------
--  Create a frame for the addon
---------------------------------------------

local aet = CreateFrame("frame", "ArgusEliteTrackerFrames", UIParent)
aet:SetSize(300, 20)
aet:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    tile = true,
    tileSize = 16,
    edgeFile = [[Interface\Buttons\WHITE8X8]],
    edgeSize = 1
})
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
aet.elitesContainer:SetPoint("TOPLEFT", 0, -21)


-- Create a header for our addon frame
aet.TitleBar = CreateFrame ("frame", "argusheader", aet)
aet.TitleBar:SetPoint ("topleft", aet, "topleft", 1, -1)
aet.TitleBar:SetPoint ("topright", aet, "topright", -1, -1)
aet.TitleBar:SetHeight (20)
aet.TitleBar:EnableMouse (false)
aet.TitleBar:SetBackdrop (plainBackdrop)
aet.TitleBar:SetBackdropColor (1, .84, 0, 1)
aet.TitleBar:SetBackdropBorderColor (0, 0, 0, 0)
aet.TitleBar.Label = aet.TitleBar:CreateFontString()
aet.TitleBar.Label:SetFont(defaultFontName, 12)
aet.TitleBar.Label:SetPoint("CENTER", aet.TitleBar, "CENTER", 0, 0)
aet.TitleBar.Label:SetText("Argus Elite Tracker")

aet.Minimize = CreateFrame ("button", "argusminimize", aet)
aet.Minimize:SetPoint ("right", aet.TitleBar, "right", -20, 0)
aet.Minimize:SetSize (16, 16)
aet.Minimize:SetBackdrop (plainBackdrop)
aet.Minimize:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
aet.Minimize:SetBackdropColor(0, 0, 0, 1)
aet.Minimize:SetBackdropBorderColor (1, 1, 1, 0)
aet.Minimize.Label = createLabel("-", 10, "CENTER", aet.Minimize)
aet.Minimize.Label:SetTextColor(0.5, 0.5, 0.5, 1)

aet.Close = CreateFrame ("button", "argusclose", aet)
aet.Close:SetPoint ("right", aet.TitleBar, "right", -2, 0)
aet.Close:SetSize (16, 16)
aet.Close:SetBackdrop (plainBackdrop)
aet.Close:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
aet.Close:SetBackdropColor(0, 0, 0, 1)
aet.Close:SetBackdropBorderColor (1, 1, 1, 0)
aet.Close.Label = createLabel("X", 10, "CENTER", aet.Close)
aet.Close.Label:SetTextColor(0.5, 0.5, 0.5, 1)

aet.Reset = CreateFrame("button", "argusreset", aet)
aet.Reset:SetPoint("right", aet.TitleBar, "right", -38, 0)
aet.Reset:SetSize(16, 16)
aet.Reset:SetBackdrop(plainBackdrop)
aet.Reset:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
aet.Reset:SetBackdropColor(0, 0, 0, 1)
aet.Reset:SetBackdropBorderColor(1, 1, 1, 0)
aet.Reset.Label = createLabel("R", 10, "CENTER", aet.Reset)
aet.Reset.Label:SetTextColor(0.5, 0.5, 0.5, 0.5, 1)

aet.SearchAll = CreateFrame("button", nil, aet)
aet.SearchAll:SetPoint("left", aet.TitleBar, "left", 2, 0)
aet.SearchAll:SetSize(55, 16)
aet.SearchAll:EnableMouse(true)
aet.SearchAll:SetBackdrop(plainBackdrop)
aet.SearchAll:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
aet.SearchAll:SetBackdropColor(0, 0, 0, 1)
aet.SearchAll:SetBackdropBorderColor(1, 1, 1, 0)
aet.SearchAll.Label = createLabel("Search all", 10, "CENTER", aet.SearchAll)
aet.SearchAll.Label:SetTextColor(0.95, 0.95, 0.95, 0.95, 1)

-- krokuun
aet.elitesContainer.krokuun = CreateFrame("button", nil, aet.elitesContainer)
aet.elitesContainer.krokuun:SetBackdrop(plainBackdrop)
aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.50)
aet.elitesContainer.krokuun:SetBackdropBorderColor(1, 1, 1, 0)
aet.elitesContainer.krokuun:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
aet.elitesContainer.krokuun:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -10)
aet.elitesContainer.krokuun:SetSize(75, 20)
aet.elitesContainer.krokuun.Label = createLabel("Krokuun", 12, "CENTER", aet.elitesContainer.krokuun)

-- antoranWastes
aet.elitesContainer.antoranWastes = CreateFrame("button", nil, aet.elitesContainer)
aet.elitesContainer.antoranWastes:SetBackdrop(plainBackdrop)
aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.2)
aet.elitesContainer.antoranWastes:SetBackdropBorderColor(1, 1, 1, 0)
aet.elitesContainer.antoranWastes:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
aet.elitesContainer.antoranWastes:SetPoint("topleft", aet.elitesContainer, "topleft", (aet:GetWidth() / 3), -10)
aet.elitesContainer.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, 20)
aet.elitesContainer.antoranWastes.Label = createLabel("Antoran Wastes", 12, "CENTER", aet.elitesContainer.antoranWastes)

-- macAree
aet.elitesContainer.macAree = CreateFrame("button", nil, aet.elitesContainer)
aet.elitesContainer.macAree:SetBackdrop(plainBackdrop)
aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.2)
aet.elitesContainer.macAree:SetBackdropBorderColor(1, 1, 1, 0)
aet.elitesContainer.macAree:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
aet.elitesContainer.macAree:SetPoint("topleft", aet.elitesContainer, "topleft", 10 + (aet:GetWidth() / 3) * 2 + 5, -10)
aet.elitesContainer.macAree:SetSize(75, 20)
aet.elitesContainer.macAree.Label = createLabel("Mac'Aree", 12, "CENTER", aet.elitesContainer.macAree)



local function updateWorldQuests(elites, zoneId)
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
    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        updateWorldQuests(elites, zoneId)
    end
end


local function disableAllButtons()
    aet.SearchAll:EnableMouse(false)
    aet.SearchAll.Label:SetTextColor(1, 1, 1, 0.2)
    for i, elite in ipairs(selectedZone) do
        elite.button:EnableMouse(false)
        elite.button.Label:SetTextColor(1, 1, 1, 0.2)
    end
end

local function enableAllButtons()
    aet.SearchAll:EnableMouse(true)
    aet.SearchAll.Label:SetTextColor(1, 1, 1, 0.90)
    for i, elite in ipairs(selectedZone) do
        if not elite.complete or elite.isWq then
            elite.button:EnableMouse(true)
            elite.button.Label:SetTextColor(1, 1, 1, 1)
        end
    end
end

local function hideZone(zone)
    for i, elite in ipairs(zones[zone]) do
        elite.button:Hide()
        elite.status:Hide()
    end
end


local function updateEliteStatus(elite)
    if elite.complete then
        elite.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
        elite.status.Label:SetText("Killed")
    elseif elite.isWq then
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


local function setEliteNa(elite)
    if (not elite.complete) and (not elite.isWq) then
        elite.status.Label:SetTextColor(1, 0.45, 0.08, 1)
        elite.status.Label:SetText("(" .. elite.searchResults .. ") N/A")
    end
end

local function updateSearchedElite(elite)
    if elite.complete or elite.isWq then
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

local function resetAll()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            elite.searchIndex = 0
            elite.searchResults = 0
            setEliteNa(elite)
        end
    end
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


local function searchForGroup(elite)

    updateWorldQuestsForAllArgusZones()
    elite.complete = IsQuestFlaggedCompleted(elite.questId)

    if elite.complete then
        updateEliteStatus(elite)
        return
    end

    C_LFGList.Search (6, LFGListSearchPanel_ParseSearchTerms (""))
    disableAllButtons()
    elite.button:SetScript("OnUpdate", onUpdate)
end


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
                elite.complete = IsQuestFlaggedCompleted(elite.questId)

                if not elite.complete then
                    setEliteNa(elite)
                    for searchTermIndex = 1, #elite.searchTerms do
                        if groupName:find(elite.searchTerms[searchTermIndex]) then
                            elite.searchResults = elite.searchResults + 1
                        end
                    end
                end
                updateEliteStatus(elite)
            end
        end
    end
end


local secondCounterAll = 0
local searchForSecondsAll = 3

local function onUpdateAll(self, elapsed)
    secondCounterAll = secondCounterAll + elapsed

    if secondCounterAll >= searchForSecondsAll then
        self:SetScript("OnUpdate", nil)
        secondCounterAll = 0
        enableAllButtons()
        searchForAllGroupsCallback()
    end
end

local function initiateSearch(self)
    self.elite.searchResults = 0
    setEliteNa(self.elite)
    searchForGroup(self.elite)
end

local function playerIsOnArgus()
    local currentMapId, _ = GetCurrentMapAreaID()
    local onArgus = false

    for i, v in pairs(zoneIds) do
        if zoneIds[i] == currentMapId then
            onArgus = true
        end
    end

    if debug then
        print("On Argus: ", onArgus)
    end

    return onArgus
end

---------------------------------------------
--  Register scripts
---------------------------------------------

aet:SetScript("OnDragStart", aet.StartMoving)
aet:SetScript("OnDragStop", aet.StopMovingOrSizing)
-- aet.elitesContainer:SetScript("OnDragStart", aet.StartMoving)
-- aet.elitesContainer:SetScript("OnDragStop", aet.StopMovingOrSizing)

aet.Close:SetScript ("OnClick", function()
    aet:Hide()
    eliteOptions.aetHidden = true

    if playerIsOnArgus() then
        eliteOptions.aetHiddenWhileOnArgus = true
    else
        eliteOptions.aetHiddenWhileOnArgus = false
    end

    if debug then
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
    end
end)

aet.Minimize:SetScript("OnClick", function()
    if aet.elitesContainer:IsVisible() then
        aet.elitesContainer:Hide()
        aet.Minimize.Label:SetText("+")
    else
        aet.elitesContainer:Show()
        aet.Minimize.Label:SetText("-")
    end
end)

aet.Reset:SetScript("OnClick", function()
    resetAll();
end)


local function updateFrame()
    local height = (#selectedZone * 15) + 50

    aet.elitesContainer:SetHeight(height)
    for i, elite in ipairs(selectedZone) do
        elite.button:Show()
        elite.status:Show()
    end
end


local function initiateZones()
    local yOffset = 15
    local statusWidth = 50

    for name, elites in pairs(zones) do
        local zoneId = zoneIds[name]
        updateWorldQuests(elites, zoneId)

        for i, elite in pairs(zones[name]) do
            local name = elite.name
            local buttonText = elite.name

            elite.complete = IsQuestFlaggedCompleted(elite.questId)

            elite.button = CreateFrame("button", nil, aet.elitesContainer)
            elite.button:SetBackdrop(plainBackdrop)
            elite.button:SetBackdropColor(0, 0, 0, 0)
            elite.button:SetBackdropBorderColor(1, 1, 1, 0)
            elite.button:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.button:SetPoint("topleft", aet.elitesContainer, "topleft", 10, -25 + (-(i * yOffset)))
            elite.button:SetSize(aet:GetWidth() - 20 - statusWidth - 10, 16)
            elite.button.Label = createLabel(buttonText, 12, "CENTER", elite.button)
            elite.button.elite = elite
            elite.button:Hide()

            if not elite.complete then
                elite.button:SetScript("OnClick", initiateSearch)
            end

            elite.status = CreateFrame("Frame", nil, aet.elitesContainer)
            elite.status:SetBackdrop(plainBackdrop)
            elite.status:SetBackdropColor(0, 0, 0, 0)
            elite.status:SetBackdropBorderColor(1, 1, 1, 0)
            elite.status:SetFrameLevel(aet.elitesContainer:GetFrameLevel() + 1)
            elite.status:SetPoint("topright", aet.elitesContainer, "topright", -10, -25 + (-(i * yOffset)))
            elite.status:SetSize(statusWidth, 15)
            elite.status.Label = createLabel("N/A", 12, "CENTER", elite.status)
            elite.status:Hide()

            setEliteNa(elite)
            if elite.complete or elite.isWq then
                updateEliteStatus(elite)
            end
        end
    end
end

aet.elitesContainer.krokuun:SetScript ("OnClick", function()
    selectedZone = zones.krokuun
    aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.50)
    aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
    aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.20)
    hideZone("antoranWastes")
    hideZone("macAree")
    updateFrame()
end)

aet.elitesContainer.antoranWastes:SetScript ("OnClick", function()
    selectedZone = zones.antoranWastes
    aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.20)
    aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.50)
    aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.20)
    hideZone("krokuun")
    hideZone("macAree")
    updateFrame()
end)

aet.elitesContainer.macAree:SetScript ("OnClick", function()
    selectedZone = zones.macAree
    aet.elitesContainer.krokuun:SetBackdropColor(1, 1, 1, 0.20)
    aet.elitesContainer.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
    aet.elitesContainer.macAree:SetBackdropColor(1, 1, 1, 0.50)
    hideZone("krokuun")
    hideZone("antoranWastes")
    updateFrame()
end)


local function searchForAll()
    disableAllButtons()
    C_LFGList.Search (6, LFGListSearchPanel_ParseSearchTerms (""))
    aet.SearchAll:SetScript("OnUpdate", onUpdateAll)
end

local function initiateSearchAll(self)
    resetAll()
    updateFrame()
    searchForAll()
end

aet.SearchAll:SetScript("OnClick", function()
    initiateSearchAll()
end)

initiateZones()
updateFrame()


---------------------------------------------
--  Create slash commands
---------------------------------------------

SLASH_ARGUSELITETRACKER1 = "/aet"
SLASH_ARGUSELITETRACKER2 = "/arguselitetracker"

SlashCmdList.ARGUSELITETRACKER = function(argument)
    if string.upper(argument) == "HELP" then
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker: Commands are |cFF00FF00help|r|cFFFFFF00, |cFF00FF00show|r|cFFFFFF00, |cFF00FF00hide|cFFFFFF00, |cFF00FF00toggle|r|cFFFFFF00")
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker: Slash commands are |cFF00FF00/aet|r|cFFFFFF00, |cFF00FF00/arguselitetracker|r|cFFFFFF00.")
    end
    if string.upper(argument) == "HIDE" then
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
        end

        eliteOptions.aetHidden = true
        if playerIsOnArgus() then
            eliteOptions.aetHiddenWhileOnArgus = eliteOptions.aetHidden
        end

        aet:Hide()
    end
    if string.upper(argument) == "SHOW" then
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker is |cFF00FF00visible|r|cFFFFFF00.")
        end

        eliteOptions.aetHidden = false
        if playerIsOnArgus() then
            eliteOptions.aetHiddenWhileOnArgus = eliteOptions.aetHidden
        end

        aet:Show()
    end
    if string.upper(argument) == "TOGGLE" then
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker |cFF00FF00toggled|r|cFFFFFF00.")
        end

        if aet:IsVisible() then
            aet:Hide()
            eliteOptions.aetHidden = true
        else
            aet:Show()
            eliteOptions.aetHidden = false
        end

        if playerIsOnArgus() then
            eliteOptions.aetHiddenWhileOnArgus = eliteOptions.aetHidden
        end
    end
end

---------------------------------------------
--  Register events
---------------------------------------------
local events = {}

function afterPlayerEnteredWorld()
    if debug then
        print("called")
    end

    -- if eliteOptions.aetHidden then return end
    if eliteOptions.aetHiddenWhileOnArgus then return end
    local onArgus = playerIsOnArgus()

    if debug or onArgus then
        aet:Show()
    else
        aet:Hide()
    end
end

function events:PLAYER_ENTERING_WORLD(...)
    if debug then
        print("|cFF00FF00" .. addonName .. "|r|cFFFFFFFF is loaded.")
    end
    aet:Hide()
    C_Timer.After(1, afterPlayerEnteredWorld)
end

aet:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...);
end);

for key, value in pairs(events) do
    aet:RegisterEvent(key);
end