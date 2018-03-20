local addonName, addonData = ...

local L = ArgusEliteTracker.L

addonData.configPanel = CreateFrame("Frame", "ArgusEliteTrackerConfigPanel", UIParent)
addonData.configPanel.search = CreateFrame("Frame", "ArgusEliteTrackerConfigSearchPanel", addonData.configPanel)

local configPanel = addonData.configPanel
addonData.configPanel.name = addonName

local searchPanel = addonData.configPanel.search
searchPanel.name = "Search config"
searchPanel.parent = addonData.configPanel.name

InterfaceOptions_AddCategory(configPanel)
InterfaceOptions_AddCategory(searchPanel)

addonData:createOptionsLabel(configPanel, 16,  -16, "GameFontNormalLarge", 24, addonName)
addonData:createOptionsLabel(configPanel, 16,  -50, "GameFontHighlight", 24, L["Welcome to ArgusEliteTracker!"])
addonData:createOptionsLabel(configPanel, 16,  -65, "GameFontHighlight", 24, L["Your local guide for guesstimating which elites are up."])
addonData:createOptionsLabel(configPanel, 16,  -95, "GameFontHighlight", 24, L["Pressing search all is fine and dandy, but not the most accurate way!"])
addonData:createOptionsLabel(configPanel, 16, -110, "GameFontHighlight", 24, L["It looks like the WoW API limits the number of results to 100."])
addonData:createOptionsLabel(configPanel, 16, -130, "GameFontHighlight", 24, L["Clicking the name of an elite will search for that elite with specified search terms."])
addonData:createOptionsLabel(configPanel, 16, -145, "GameFontHighlight", 24, L["This should on average yield more correct group count numbers. If you should be bored :)"])

local buttonAutoOpenOnArgus     = addonData:createCheckButton(configPanel, 16, -175, L["Open automatically when entering an Argus zone"])
local buttonGrowUpwards         = addonData:createCheckButton(configPanel, 16, -200, L["Grow frame upwards"])
local buttonOnlyWithGroup       = addonData:createCheckButton(configPanel, 16, -225, L["Only show elites that have an active group"])
local buttonForceWorldQuests    = addonData:createCheckButton(configPanel, 40, -250, L["... but still show all world quests if the elite has not been killed"])
local buttonHideKilled          = addonData:createCheckButton(configPanel, 16, -285, L["Hide elites that have already been killed"])
local buttonWorldQuestForced    = addonData:createCheckButton(configPanel, 16, -310, L["If elites are force hidden, show them anyway if they are World Quests"])
local buttonCommanderOfArgus    = addonData:createCheckButton(configPanel, 16, -335, L["Commander of Argus mode"])
local buttonDisableMapIcons     = addonData:createCheckButton(configPanel, 16, -360, L["Disable all map icons (If you are using another addon for the map)"])

addonData:createOptionsLabel(searchPanel, 16, -25, "GameFontHighlight", 24, L["'Search all' will use these language filters when searching:"])

local searchAllFilterButtons = {}
local searchAllFilterOffset = -45

local searchTermFilterButtons = {}

-- Setup search all checkboxes
local trips = 0
local lastTop = 0


for locale, _ in pairs(ArgusEliteTracker.AvailableLocales) do

    lastTop = searchAllFilterOffset - (20 * math.floor(trips / 3))
    searchAllFilterButtons[locale] = addonData:createCheckButton(
        searchPanel,
        16 + (200 * (trips % 3)),
        lastTop,
        L[locale])

    searchAllFilterButtons[locale].locale = locale
    trips = trips + 1
end


-- Setup override search checkboxes
trips = 0
local overrideLabelPosition = lastTop - 45
local overrideLabel = addonData:createOptionsLabel(searchPanel, 16, overrideLabelPosition, "GameFontHighlight", 24, L["Search with search terms from this language (override client language):"])

for k, v in pairs(ArgusEliteTracker.AvailableLocales) do

    if ArgusEliteTracker.RegisteredSearchTerms[k] ~= nil then
        searchTermFilterButtons[k] = addonData:createCheckButton(
            searchPanel,
            16 + (200 * (trips % 3)),
            overrideLabelPosition - 20 - (20 * math.floor(trips / 3)),
            L[ArgusEliteTracker.RegisteredSearchTerms[k]])
        
        trips = trips + 1

        searchTermFilterButtons[k].locale = k
        searchTermFilterButtons[k]:SetScript("OnClick", function(self)
            local atLeastOneIsChecked = false

            for _, checkBox in pairs(searchTermFilterButtons) do
                if checkBox ~= self then
                    checkBox:SetChecked(false)
                end

                if checkBox:GetChecked() then
                    atLeastOneIsChecked = true
                end
            end
        
            if not atLeastOneIsChecked then
                searchTermFilterButtons[GetLocale()]:SetChecked(true)
            end
        end)
    end
end


local function localeIsClientLocale(locale)
    return locale == GetLocale()
end


-- local buttonOnlySpecialElites   = addonData:createCheckButton(configPanel, 16, -100, "Only display elites that drop mount, pets, etc")


configPanel:SetScript("OnShow", function()
    buttonAutoOpenOnArgus:SetChecked(ArgusEliteTrackerConfig.autoOpenOnArgus)
    buttonGrowUpwards:SetChecked(ArgusEliteTrackerConfig.growUpwards)
    buttonOnlyWithGroup:SetChecked(ArgusEliteTrackerConfig.onlyShowElitesWithGroups)
    buttonHideKilled:SetChecked(ArgusEliteTrackerConfig.hideKilledElites)
    buttonForceWorldQuests:SetChecked(ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled)
    buttonWorldQuestForced:SetChecked(ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden)
    buttonCommanderOfArgus:SetChecked(ArgusEliteTrackerConfig.commanderOfArgusMode)
    buttonDisableMapIcons:SetChecked(ArgusEliteTrackerConfig.disableMapIcons)
    -- buttonOnlySpecialElites:SetChecked(ArgusEliteTrackerConfig.onlyShowSpecialElites)
end)

configPanel:RegisterEvent("ADDON_LOADED")

configPanel:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        ArgusEliteTrackerConfig = ArgusEliteTrackerConfig or {}

        if ArgusEliteTrackerConfig.minimized == nil then
            ArgusEliteTrackerConfig.minimized = false
        end
        
        if ArgusEliteTrackerConfig.closed == nil then
            ArgusEliteTrackerConfig.close = false
        end

        if ArgusEliteTrackerConfig.autoOpenOnArgus == nil then
            ArgusEliteTrackerConfig.autoOpenOnArgus = true
        end

        if ArgusEliteTrackerConfig.growUpwards == nil then
            ArgusEliteTrackerConfig.growUpwards = false
        end

        if ArgusEliteTrackerConfig.hideKilledElites == nil then
            ArgusEliteTrackerConfig.hideKilledElites = false
        end

        if ArgusEliteTrackerConfig.onlyShowElitesWithGroups == nil then
            ArgusEliteTrackerConfig.onlyShowElitesWithGroups = false
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled == nil then
            ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled = true
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden == nil then
            ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden = true
        end

        if ArgusEliteTrackerConfig.forceHidden == nil then
            ArgusEliteTrackerConfig.forceHidden = {}
        end

        if ArgusEliteTrackerConfig.commanderOfArgusMode == nil then
            ArgusEliteTrackerConfig.commanderOfArgusMode = false
        end

        if ArgusEliteTrackerConfig.disableMapIcons == nil then
            ArgusEliteTrackerConfig.disableMapIcons = false
        end

        if ArgusEliteTrackerConfig.searchAllConfig == nil then
            ArgusEliteTrackerConfig.searchAllConfig = {}
        end

        -- if ArgusEliteTrackerConfig.onlyShowSpecialElites == nil then
        --     ArgusEliteTrackerConfig.onlyShowSpecialElites = false
        -- end

        for k, v in pairs(ArgusEliteTracker.AvailableLocales) do

            if ArgusEliteTrackerConfig.searchAllConfig[k] == nil then
                ArgusEliteTrackerConfig[k] = localeIsClientLocale(k)
            end

            -- if localeIsClientLocale(k) then
            --     ArgusEliteTrackerConfig.searchAllConfig[k] = true
            -- end

            if searchAllFilterButtons[k] ~= nil then
                -- ArgusEliteTrackerConfig.searchAllConfig[k] = searchTermFilterButtons[k]:GetChecked()
                searchAllFilterButtons[k]:SetChecked(ArgusEliteTrackerConfig.searchAllConfig[k])
            end
        end

        if ArgusEliteTrackerConfig.SearchWithLanguage == nil then
            ArgusEliteTrackerConfig.SearchWithLanguage = GetLocale()
        end


        buttonAutoOpenOnArgus:SetChecked(ArgusEliteTrackerConfig.autoOpenOnArgus)
        buttonGrowUpwards:SetChecked(ArgusEliteTrackerConfig.growUpwards)
        buttonOnlyWithGroup:SetChecked(ArgusEliteTrackerConfig.onlyShowElitesWithGroups)
        buttonHideKilled:SetChecked(ArgusEliteTrackerConfig.hideKilledElites)
        buttonForceWorldQuests:SetChecked(ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled)
        buttonWorldQuestForced:SetChecked(ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden)
        buttonCommanderOfArgus:SetChecked(ArgusEliteTrackerConfig.commanderOfArgusMode)
        buttonDisableMapIcons:SetChecked(ArgusEliteTrackerConfig.disableMapIcons)

        -- Setup checked state of search language override
        for locale, checkBox in pairs(searchTermFilterButtons) do
            if locale == ArgusEliteTrackerConfig.SearchWithLanguage then
                checkBox:SetChecked(true)
            else
                checkBox:SetChecked(false)
            end
        end
    
        -- buttonOnlySpecialElites:SetChecked(ArgusEliteTrackerConfig.onlyShowSpecialElites)
        createArgusEliteTrackerFrames()
        -- ArgusEliteTracker.frame:SetSize(W.AetWindowWidth, W.AetWindowHeight)
    end
end)


function configPanel:okay()

    ArgusEliteTrackerConfig.autoOpenOnArgus = buttonAutoOpenOnArgus:GetChecked()
    ArgusEliteTrackerConfig.growUpwards = buttonGrowUpwards:GetChecked()
    ArgusEliteTrackerConfig.onlyShowElitesWithGroups = buttonOnlyWithGroup:GetChecked()
    ArgusEliteTrackerConfig.hideKilledElites = buttonHideKilled:GetChecked()
    ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled = buttonForceWorldQuests:GetChecked()
    ArgusEliteTrackerConfig.forceShowWorldQuestsIfForceHidden = buttonWorldQuestForced:GetChecked()
    ArgusEliteTrackerConfig.commanderOfArgusMode = buttonCommanderOfArgus:GetChecked()
    ArgusEliteTrackerConfig.disableMapIcons = buttonDisableMapIcons:GetChecked()


    -- Save search all
    local atLeastOneIsChecked = false

    for locale, checkButton in pairs(searchAllFilterButtons) do
        ArgusEliteTrackerConfig.searchAllConfig[locale] = checkButton:GetChecked()
        
        if checkButton:GetChecked() then
            atLeastOneIsChecked = true
        end
    end

    if not(atLeastOneIsChecked) then
        local clientLocale = GetLocale()
        ArgusEliteTrackerConfig.searchAllConfig[clientLocale] = true
        searchAllFilterButtons[clientLocale]:SetChecked(true)
    end

    -- Save search language override
    for locale, checkBox in pairs(searchTermFilterButtons) do
        if checkBox:GetChecked() then
            ArgusEliteTrackerConfig.SearchWithLanguage = locale
        end
    end

    if ArgusEliteTrackerConfig.disableMapIcons then
        ArgusEliteTrackerMapUtils:removeAllAetIcons()
    else
        ArgusEliteTrackerMapUtils:enableMapIcons()
        ArgusEliteTrackerMapUtils:updateMapIcons()
    end
    
    updateArgusEliteTrackerFrame()
    -- ArgusEliteTrackerConfig.onlyShowSpecialElites = buttonOnlySpecialElites:GetChecked()
    
end

function configPanel:default()
    buttonAutoOpenOnArgus:SetChecked(true)
    buttonGrowUpwards:SetChecked(false)
    buttonOnlyWithGroup:SetChecked(false)
    buttonHideKilled:SetChecked(false)
    buttonForceWorldQuests:SetChecked(true)
    buttonWorldQuestForced:SetChecked(true)
    buttonCommanderOfArgus:SetChecked(false)
    buttonDisableMapIcons:SetChecked(false)

    -- Search all defaults
    for _, checkButton in pairs(searchAllFilterButtons) do
        local locale = checkButton.locale
        checkButton:SetChecked(localeIsClientLocale(locale))
    end

    -- What if the search term language isn't registered for client language?
    -- English should always be registered
    -- Search language override defaults
    if ArgusEliteTracker.RegisteredSearchTerms[GetLocale()] ~= nil then
        for locale, checkBox in pairs(searchTermFilterButtons) do
            if locale == GetLocale() then
                checkBox:SetChecked(true)
            else
                checkBox:SetChekced(false)
            end
        end
    else
        for locale, checkBox in pairs(searchTermFilterButtons) do
            checkBox:SetChecked(false)
        end
        searchTermFilterButtons["enUS"]:SetChecked(true)
    end
    -- buttonOnlySpecialElites:SetChecked(false)
end