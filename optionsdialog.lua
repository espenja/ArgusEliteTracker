local addonName, addonData = ...

addonData.configPanel = CreateFrame("Frame", "ArgusEliteTrackerConfigPanel", UIParent)
local configPanel = addonData.configPanel
configPanel.name = addonName

InterfaceOptions_AddCategory(configPanel)

addonData:createOptionsLabel(configPanel, 16, -16, "GameFontNormalLarge", 24, addonName)

local buttonAutoOpenOnArgus     = addonData:createCheckButton(configPanel, 16, -50, "Open automatically when entering an Argus zone")
-- local buttonOnlyWithGroup       = addonData:createCheckButton(configPanel, 16, -75, "Only show elites that have an active group")
-- local buttonHideKilled          = addonData:createCheckButton(configPanel, 16, -100, "Hide elites that have already been killed")
-- local buttonOnlySpecialElites   = addonData:createCheckButton(configPanel, 16, -100, "Only display elites that drop mount, pets, etc")


configPanel:SetScript("OnShow", function()
    buttonAutoOpenOnArgus:SetChecked(ArgusEliteTrackerConfig.autoOpenOnArgus)
    -- buttonOnlyWithGroup:SetChecked(ArgusEliteTrackerConfig.onlyShowElitesWithGroups)
    -- buttonHideKilled:SetChecked(ArgusEliteTrackerConfig.hideKilledElites)
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

        -- if ArgusEliteTrackerConfig.hideKilledElites == nil then
        --     ArgusEliteTrackerConfig.hideKilledElites = false
        -- end

        -- if ArgusEliteTrackerConfig.onlyShowElitesWithGroups == nil then
        --     ArgusEliteTrackerConfig.onlyShowElitesWithGroups = false
        -- end

        -- if ArgusEliteTrackerConfig.onlyShowSpecialElites == nil then
        --     ArgusEliteTrackerConfig.onlyShowSpecialElites = false
        -- end

        buttonAutoOpenOnArgus:SetChecked(ArgusEliteTrackerConfig.autoOpenOnArgus)
        -- buttonOnlyWithGroup:SetChecked(ArgusEliteTrackerConfig.onlyShowElitesWithGroups)
        -- buttonHideKilled:SetChecked(ArgusEliteTrackerConfig.hideKilledElites)
        -- buttonOnlySpecialElites:SetChecked(ArgusEliteTrackerConfig.onlyShowSpecialElites)

        createArgusEliteTrackerFrames()
    end
end)


function configPanel:okay()
    ArgusEliteTrackerConfig.autoOpenOnArgus = buttonAutoOpenOnArgus:GetChecked()
    -- ArgusEliteTrackerConfig.onlyShowElitesWithGroups = buttonOnlyWithGroup:GetChecked()
    -- ArgusEliteTrackerConfig.hideKilledElites = buttonHideKilled:GetChecked()
    -- ArgusEliteTrackerConfig.onlyShowSpecialElites = buttonOnlySpecialElites:GetChecked()
    
end

function configPanel:default()
    buttonAutoOpenOnArgus:SetChecked(true)
    -- buttonOnlyWithGroup:SetChecked(false)
    -- buttonHideKilled:SetChecked(false)
    -- buttonOnlySpecialElites:SetChecked(false)
end