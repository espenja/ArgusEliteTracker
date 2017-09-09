local addonName, addonData = ...

local debug = false

local framePositionX = 100
local framePositionY = 400

local defaultFontName = "Fonts/FRIZQT__.TTF"
local plainBackdrop = {edgeFile = [[Interface\Buttons\WHITE8X8]], edgeSize = 0.75, bgFile = [[Interface\Tooltips\UI-Tooltip-Background]], tileSize = 4, tile = false}

local eliteOptions = {
    headerHeight = 20,
    zoneSelectorHeight = 30,
    buttonHeight = 20,
    xOffset = 10,
    yOffset = 15,
    statusWidth = 50,
}

local zones = {
    krokuun = {
        { name = "Khazaduum", button = nil, status = nil, searchTerms = { "khazaduum" }, searchResults = 0 },
        { name = "Vagath the Betrayed", button = nil, status = nil, searchTerms = { "vagath", "the betrayed" }, searchResults = 0 },
        { name = "Naroua", button = nil, status = nil, searchTerms = { "naroua" }, searchResults = 0 },
        { name = "Tereck the Selector", button = nil, status = nil, searchTerms = { "tereck", "selector" }, searchResults = 0 },
        { name = "Tar Spitter", button = nil, status = nil, searchTerms = { "tar", "spitter" }, searchResults = 0 },
        { name = "Siegemaster Voraan", button = nil, status = nil, searchTerms = { "voraan", "siegemaster" }, searchResults = 0 },
        { name = "Talestra the Vile", button = nil, status = nil, searchTerms = { "talestra", "the vile" }, searchResults = 0 },
        { name = "Commander Endaxis", button = nil, status = nil, searchTerms = { "endaxis" }, searchResults = 0 },
        { name = "Commander Vecaya", button = nil, status = nil, searchTerms = { "vecaya" }, searchResults = 0 },
        { name = "Imp Mother Laglath", button = nil, status = nil, searchTerms = { "laglath", "imp mother" }, searchResults = 0 },
        { name = "Commander Sathrenael", button = nil, status = nil, searchTerms = { "sathrenael" }, searchResults = 0 },
    },
    antoranWastes = {
        { name = "Doomcaster Suprax", button = nil, status = nil, searchTerms = { "suprax" }, searchResults = 0 },
        { name = "Mother Rosula", button = nil, status = nil, searchTerms = { "rosula" }, searchResults = 0 },
        { name = "Puscilla", button = nil, status = nil, searchTerms = { "puscilla" }, searchResults = 0 },
        { name = "Houndmaster Kerrax", button = nil, status = nil, searchTerms = { "kerrax", "houndmaster" }, searchResults = 0 },
        { name = "Chief Alchemist Munculus", button = nil, status = nil, searchTerms = { "munculus" }, searchResults = 0 },
        { name = "Void Warden Valsuran", button = nil, status = nil, searchTerms = { "valsuran" }, searchResults = 0 },
        { name = "Watcher Aival", button = nil, status = nil, searchTerms = { "aival" }, searchResults = 0 },
        { name = "Mistress Il'thendra", button = nil, status = nil, searchTerms = { "il'thendra" }, searchResults = 0 },
        { name = "Vrax'thul", button = nil, status = nil, searchTerms = { "vrax'thul", "vrax" }, searchResults = 0 },
        { name = "The Many-Faced Devourer", button = nil, status = nil, searchTerms = { "many-faced" }, searchResults = 0 },
        { name = "Blistermaw", button = nil, status = nil, searchTerms = { "blistermaw" }, searchResults = 0 },
        { name = "Gar'zoth", button = nil, status = nil, searchTerms = { "gar'zoth", "gar zoth" }, searchResults = 0 },
        { name = "Worldsplitter Skuul", button = nil, status = nil, searchTerms = { "skuul", "worldsplitter" }, searchResults = 0 },
        { name = "Ven'orn", button = nil, status = nil, searchTerms = { "ven'orn", "venorn" }, searchResults = 0 },
        { name = "Inquisitor Vethroz", button = nil, status = nil, searchTerms = { "vethroz", "inquisitor" }, searchResults = 0 },
        { name = "Varga", button = nil, status = nil, searchTerms = { "varga" }, searchResults = 0 },
        { name = "Commander Texlaz", button = nil, status = nil, searchTerms = { "texlaz" }, searchResults = 0 },
        { name = "Lieutenant Xakaar", button = nil, status = nil, searchTerms = { "lieutenant", "xakaar" }, searchResults = 0 },
        { name = "Wrath-Lord Yarez", button = nil, status = nil, searchTerms = { "wrath-lord", "yarez", "wrath lord" }, searchResults = 0 },
        { name = "All-Seer Xanarian", button = nil, status = nil, searchTerms = { "xanarian", "all-seer" }, searchResults = 0 },
        { name = "Admiral Rel'var", button = nil, status = nil, searchTerms = { "rel'var", "admiral" }, searchResults = 0 },
    },
    macAree = {
        { name = "Skreeg the Devourer", button = nil, status = nil, searchTerms = { "skreeg" }, searchResults = 0 },
        { name = "Feasel the Muaetin Thief", button = nil, status = nil, searchTerms = { "feasel", "muaetin" }, searchResults = 0 },
        { name = "Commander Xethgar", button = nil, status = nil, searchTerms = { "xethgar" }, searchResults = 0 },
        { name = "Vigilant Thanos", button = nil, status = nil, searchTerms = { "thanos" }, searchResults = 0 },
        { name = "Captain Faruq", button = nil, status = nil, searchTerms = { "faruq" }, searchResults = 0 },
        { name = "Overseer Y'Sorna", button = nil, status = nil, searchTerms = { "y'sorna", "sorna", "y sorna"}, searchResults = 0 },
        { name = "Overseer Y'Morna", button = nil, status = nil, searchTerms = { "y'morna", "morna" }, searchResults = 0 },
        { name = "Zul'tan the Numerous", button = nil, status = nil, searchTerms = { "zul'tan", "numerous"}, searchResults = 0 },
        { name = "Umbraliss", button = nil, status = nil, searchTerms = { "umbraliss" }, searchResults = 0 },
        { name = "Ataxon", button = nil, status = nil, searchTerms = { "ataxon" }, searchResults = 0 },
        { name = "Jed'hin Champion Vorusk", button = nil, status = nil, searchTerms = { "jed'hin", "vorusk" }, searchResults = 0 },
        { name = "Overseer Y'Beda", button = nil, status = nil, searchTerms = { "y'beda", "beda" }, searchResults = 0 },
        { name = "Venomtail Skyfin", button = nil, status = nil, searchTerms = { "venomtail", "skyfin" }, searchResults = 0 },
        { name = "Sabuul", button = nil, status = nil, searchTerms = { "sabuul" }, searchResults = 0 },
        { name = "Slithon the Last", button = nil, status = nil, searchTerms = { "slithon", "the last" }, searchResults = 0 },
        { name = "Instructor Tarahna", button = nil, status = nil, searchTerms = { "tarahna", "instructor" }, searchResults = 0 },
        { name = "Sorolis the Ill-Fated", button = nil, status = nil, searchTerms = { "sorolis", "ill-fated" }, searchResults = 0 },
        { name = "Herald of Chaos", button = nil, status = nil, searchTerms = { "herald", "of chaos" }, searchResults = 0 },
        { name = "Kaara the Pale", button = nil, status = nil, searchTerms = { "kaara", "pale" }, searchResults = 0 },
        { name = "Baruut the Bloodthirsty", button = nil, status = nil, searchTerms = { "baruut", "bloodthirsty" }, searchResults = 0 },
        { name = "Wrangler Kravos", button = nil, status = nil, searchTerms = { "kravos", "wrangler" }, searchResults = 0 },
        { name = "Turek the Lucid", button = nil, status = nil, searchTerms = { "turek", "the lucid" }, searchResults = 0 },
        { name = "Vigilant Kuro", button = nil, status = nil, searchTerms = { "kuro" }, searchResults = 0 },
        { name = "Soultwisted Monstrosity", button = nil, status = nil, searchTerms = { "monstrosity", "soultwisted" }, searchResults = 0 },
        { name = "Shadowcaster Voruun", button = nil, status = nil, searchTerms = { "voruun", "shadowcaster" }, searchResults = 0 },
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

local selectedZone = zones.krokuun


---------------------------------------------
--  Create a frame for the addon
---------------------------------------------

local aet = CreateFrame("frame", "ArgusEliteTrackerFrame", UIParent)
aet:SetSize(300, 440)
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
aet.Reset:SetPoint("right", aet.TitleBar, "right", -20, 0)
aet.Reset:SetSize(45, 16)
aet.Reset:SetBackdrop(plainBackdrop)
aet.Reset:SetFrameLevel(aet.TitleBar:GetFrameLevel() + 1)
aet.Reset:SetBackdropColor(0, 0, 0, 1)
aet.Reset:SetBackdropBorderColor(1, 1, 1, 0)
aet.Reset.Label = createLabel("Reset", 10, "CENTER", aet.Reset)
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
aet.krokuun = CreateFrame("button", nil, aet)
aet.krokuun:SetBackdrop(plainBackdrop)
aet.krokuun:SetBackdropColor(1, 1, 1, 0.50)
aet.krokuun:SetBackdropBorderColor(1, 1, 1, 0)
aet.krokuun:SetFrameLevel(aet:GetFrameLevel() + 1)
aet.krokuun:SetPoint("topleft", aet, "topleft", 10, -30)
aet.krokuun:SetSize(75, 20)
aet.krokuun.Label = createLabel("Krokuun", 12, "CENTER", aet.krokuun)

-- antoranWastes
aet.antoranWastes = CreateFrame("button", nil, aet)
aet.antoranWastes:SetBackdrop(plainBackdrop)
aet.antoranWastes:SetBackdropColor(1, 1, 1, 0.2)
aet.antoranWastes:SetBackdropBorderColor(1, 1, 1, 0)
aet.antoranWastes:SetFrameLevel(aet:GetFrameLevel() + 1)
aet.antoranWastes:SetPoint("topleft", aet, "topleft", (aet:GetWidth() / 3), -30)
aet.antoranWastes:SetSize((aet:GetWidth() / 3) - (2 * 5) + 10, 20)
aet.antoranWastes.Label = createLabel("Antoran Wastes", 12, "CENTER", aet.antoranWastes)

-- macAree
aet.macAree = CreateFrame("button", nil, aet)
aet.macAree:SetBackdrop(plainBackdrop)
aet.macAree:SetBackdropColor(1, 1, 1, 0.2)
aet.macAree:SetBackdropBorderColor(1, 1, 1, 0)
aet.macAree:SetFrameLevel(aet:GetFrameLevel() + 1)
aet.macAree:SetPoint("topleft", aet, "topleft", 10 + (aet:GetWidth() / 3) * 2 + 5, -30)
aet.macAree:SetSize(75, 20)
aet.macAree.Label = createLabel("Mac'Aree", 12, "CENTER", aet.macAree)



local function disableAllButtons()
    aet.SearchAll:EnableMouse(false)
    aet.SearchAll.Label:SetTextColor(1, 1, 1, 0.2)

    for i, elite in ipairs(selectedZone) do
        elite.button:EnableMouse(false)
        -- elite.button:SetBackdropColor(0.05, 0.05, 0.05, 1)
        elite.button.Label:SetTextColor(1, 1, 1, 0.2)
    end
end

local function enableAllButtons()
    aet.SearchAll:EnableMouse(true)
    aet.SearchAll.Label:SetTextColor(0.95, 0.95, 0.95, 1)
    for i, elite in ipairs(selectedZone) do
        elite.button:EnableMouse(true)
        -- elite.button:SetBackdropColor(0.2, 0.2, 0.2, 1)
        elite.button.Label:SetTextColor(1, 1, 1, 1)
    end
end

local function hideZone(zone)
    for i, elite in ipairs(zones[zone]) do
        elite.button:Hide()
        elite.status:Hide()
    end
end


local function setEliteUp(elite)
    elite.status.Label:SetTextColor(0.30, 0.91, 0.46, 1)
    elite.status.Label:SetText("(" .. elite.searchResults .. ") YES")
end


local function setEliteDown(elite)
    elite.status.Label:SetTextColor(0.96, 0.30, 0.29, 1)
    elite.status.Label:SetText("(" .. elite.searchResults .. ") NO")
end


local function setEliteNa(elite)
    elite.status.Label:SetTextColor(1, 0.45, 0.08, 1)
    elite.status.Label:SetText("(" .. elite.searchResults .. ") N/A")
end


local function updateEliteAll(elite)
    if elite.searchResults > 0 then
        setEliteUp(elite)
    else
        setEliteDown(elite)
    end
end


local function updateSearchedElite(elite)
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

    if(elite.searchResults > 0) then
        setEliteUp(elite)
    else
        setEliteDown(elite)
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
    C_LFGList.Search (6, LFGListSearchPanel_ParseSearchTerms (""))
    disableAllButtons()
    elite.button:SetScript("OnUpdate", onUpdate)
end


local function searchForAllGroupsCallback()
    local numResults, resultTable = C_LFGList.GetSearchResults()

    for id = 1, #resultTable do
        local resultId = resultTable[id]

        local _, _, groupName, _, _, _, _, _, _, _, _, _, _, _ = C_LFGList.GetSearchResultInfo(resultId)
        groupName = groupName:lower()
        
        for name, _ in pairs(zones) do
            for _, elite in pairs(zones[name]) do
                elite.searchIndex = 0
                setEliteNa(elite)
                
                for searchTermIndex = 1, #elite.searchTerms do
                    if groupName:find(elite.searchTerms[searchTermIndex]) then
                        elite.searchResults = elite.searchResults + 1
                    end
                end

                updateEliteAll(elite)
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


---------------------------------------------
--  Register scripts
---------------------------------------------

aet:SetScript("OnDragStart", aet.StartMoving)
aet:SetScript("OnDragStop", aet.StopMovingOrSizing)

aet.Close:SetScript ("OnClick", function()
    aet:Hide()
    DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
end)

aet.Reset:SetScript("OnClick", function()
    resetAll();
end)



local function updateFrame()
    for i, elite in ipairs(selectedZone) do
        elite.button:Show()
        elite.status:Show()
    end
end

local function initiateZones()
    for name, elites in pairs(zones) do
        for i, elite in pairs(zones[name]) do
            local name = elite.name
            local buttonText = elite.name

            elite.button = CreateFrame("button", nil, aet)
            elite.button:SetBackdrop(plainBackdrop)
            elite.button:SetBackdropColor(0, 0, 0, 0)
            elite.button:SetBackdropBorderColor(1, 1, 1, 0)
            elite.button:SetFrameLevel(aet:GetFrameLevel() + 1)
            elite.button:SetPoint("topleft", aet, "topleft", 10, -43 + (-(i * eliteOptions.yOffset)))
            elite.button:SetSize(aet:GetWidth() - 20 - eliteOptions.statusWidth - 10, 16)
            elite.button.Label = createLabel(buttonText, 12, "CENTER", elite.button)
            elite.button.elite = elite
            elite.button:Hide()

            elite.button:SetScript("OnClick", initiateSearch)

            elite.status = CreateFrame("Frame", nil, aet)
            elite.status:SetBackdrop(plainBackdrop)
            elite.status:SetBackdropColor(0, 0, 0, 0)
            elite.status:SetBackdropBorderColor(1, 1, 1, 0)
            elite.status:SetFrameLevel(aet:GetFrameLevel() + 1)
            elite.status:SetPoint("topright", aet, "topright", -10, -43 + (-(i * eliteOptions.yOffset)))
            elite.status:SetSize(eliteOptions.statusWidth, 15)
            elite.status.Label = createLabel("N/A", 12, "CENTER", elite.status)
            elite.status:Hide()

            setEliteNa(elite)
        end
    end
end



aet.krokuun:SetScript ("OnClick", function()
    selectedZone = zones.krokuun
    aet.krokuun:SetBackdropColor(1, 1, 1, 0.50)
    aet.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
    aet.macAree:SetBackdropColor(1, 1, 1, 0.20)
    hideZone("antoranWastes")
    hideZone("macAree")
    updateFrame()
end)



aet.antoranWastes:SetScript ("OnClick", function()
    selectedZone = zones.antoranWastes
    aet.krokuun:SetBackdropColor(1, 1, 1, 0.20)
    aet.antoranWastes:SetBackdropColor(1, 1, 1, 0.50)
    aet.macAree:SetBackdropColor(1, 1, 1, 0.20)
    hideZone("krokuun")
    hideZone("macAree")
    updateFrame()
end)

aet.macAree:SetScript ("OnClick", function()
    selectedZone = zones.macAree
    aet.krokuun:SetBackdropColor(1, 1, 1, 0.20)
    aet.antoranWastes:SetBackdropColor(1, 1, 1, 0.20)
    aet.macAree:SetBackdropColor(1, 1, 1, 0.50)
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
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker: Commands are |cFF00FF00help|r|cFFFFFF00, |cFF00FF00show|r|cFFFFFF00, |cFF00FF00hide|cFFFFFF00.")
        DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker: Slash commands are |cFF00FF00/FF|r|cFFFFFF00, |cFF00FF00/arguselitetracker|r|cFFFFFF00.")
    end
    if string.upper(argument) == "HIDE" then
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker is |cFF00FF00hidden|r|cFFFFFF00.")
        end
        aet:Hide()
    end
    if string.upper(argument) == "SHOW" then
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Argus Elite Tracker is |cFF00FF00visible|r|cFFFFFF00.")
        end
        aet:Show()
    end
end

---------------------------------------------
--  Register events
---------------------------------------------
local events = {}

function events:PLAYER_ENTERING_WORLD(...)
    -- print("|cFF00FF00" .. addonName .. "|r|cFFFFFFFF is loaded.")
end

aet:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...);
end);

for key, value in pairs(events) do
    aet:RegisterEvent(key);
end