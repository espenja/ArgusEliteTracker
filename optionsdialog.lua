local addonName, addonData = ...

addonData.configPanel = CreateFrame("Frame", "ArgusEliteTrackerConfigPanel", UIParent)
local configPanel = addonData.configPanel
configPanel.name = addonName

InterfaceOptions_AddCategory(configPanel)

addonData:createOptionsLabel(configPanel, 16, -16, "GameFontNormalLarge", 24, addonName)
addonData:createOptionsLabel(configPanel, 16,  -50, "GameFontHighlight", 24, "Welcome to ArgusEliteTracker!")
addonData:createOptionsLabel(configPanel, 16,  -65, "GameFontHighlight", 24, "Your local guide for guesstimating which elites are up.")
addonData:createOptionsLabel(configPanel, 16,  -95, "GameFontHighlight", 24, "Pressing search all is fine and dandy, but not the most accurate way!")
addonData:createOptionsLabel(configPanel, 16, -110, "GameFontHighlight", 24, "It looks like the WoW API limits the number of results to 100.")
addonData:createOptionsLabel(configPanel, 16, -130, "GameFontHighlight", 24, "Clicking the name of an elite will search for that elite with specified search terms.")
addonData:createOptionsLabel(configPanel, 16, -145, "GameFontHighlight", 24, "This should on average yield more correct group count numbers. If you should be bored :)")

local buttonAutoOpenOnArgus     = addonData:createCheckButton(configPanel, 16, -175, "Open automatically when entering an Argus zone")
local buttonOnlyWithGroup       = addonData:createCheckButton(configPanel, 16, -200, "Only show elites that have an active group")
local buttonForceWorldQuests    = addonData:createCheckButton(configPanel, 40, -225, "... but still show all world quests if the elite has not been killed")
local buttonHideKilled          = addonData:createCheckButton(configPanel, 16, -255, "Hide elites that have already been killed")

-- local buttonOnlySpecialElites   = addonData:createCheckButton(configPanel, 16, -100, "Only display elites that drop mount, pets, etc")


configPanel:SetScript("OnShow", function()
    buttonAutoOpenOnArgus:SetChecked(ArgusEliteTrackerConfig.autoOpenOnArgus)
    buttonOnlyWithGroup:SetChecked(ArgusEliteTrackerConfig.onlyShowElitesWithGroups)
    buttonHideKilled:SetChecked(ArgusEliteTrackerConfig.hideKilledElites)
    buttonForceWorldQuests:SetChecked(ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled)
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

        if ArgusEliteTrackerConfig.hideKilledElites == nil then
            ArgusEliteTrackerConfig.hideKilledElites = false
        end

        if ArgusEliteTrackerConfig.onlyShowElitesWithGroups == nil then
            ArgusEliteTrackerConfig.onlyShowElitesWithGroups = false
        end

        if ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled == nil then
            ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled = true
        end

        -- if ArgusEliteTrackerConfig.onlyShowSpecialElites == nil then
        --     ArgusEliteTrackerConfig.onlyShowSpecialElites = false
        -- end

        buttonAutoOpenOnArgus:SetChecked(ArgusEliteTrackerConfig.autoOpenOnArgus)
        buttonOnlyWithGroup:SetChecked(ArgusEliteTrackerConfig.onlyShowElitesWithGroups)
        buttonHideKilled:SetChecked(ArgusEliteTrackerConfig.hideKilledElites)
        buttonForceWorldQuests:SetChecked(ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled)
        -- buttonOnlySpecialElites:SetChecked(ArgusEliteTrackerConfig.onlyShowSpecialElites)

        createArgusEliteTrackerFrames()
    end
end)


function configPanel:okay()
    ArgusEliteTrackerConfig.autoOpenOnArgus = buttonAutoOpenOnArgus:GetChecked()
    ArgusEliteTrackerConfig.onlyShowElitesWithGroups = buttonOnlyWithGroup:GetChecked()
    ArgusEliteTrackerConfig.hideKilledElites = buttonHideKilled:GetChecked()
    ArgusEliteTrackerConfig.forceShowWorldQuestsIfNotKilled = buttonForceWorldQuests:GetChecked()
    
    updateArgusEliteTrackerFrame()
    -- ArgusEliteTrackerConfig.onlyShowSpecialElites = buttonOnlySpecialElites:GetChecked()
    
end

function configPanel:default()
    buttonAutoOpenOnArgus:SetChecked(true)
    buttonOnlyWithGroup:SetChecked(false)
    buttonHideKilled:SetChecked(false)
    buttonForceWorldQuests:SetChecked(true)
    -- buttonOnlySpecialElites:SetChecked(false)
end