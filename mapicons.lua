local addonName, addonData = ...
ArgusEliteTrackerMapUtils = {}
ArgusEliteTrackerMapUtils.scaleMultiplier = 0.74074074
ArgusEliteTrackerMapUtils.crossScaleMultiplier = 0.55

local aet = ArgusEliteTracker
local aetMapUtils = ArgusEliteTrackerMapUtils
local aetConfig = ArgusEliteTrackerConfig
local tooltip = CreateFrame("GameTooltip", addonName.."Tooltip", UIParent, "GameTooltipTemplate")

-- Events
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

    if elite.searchResults > 0 or elite.confirmed then
        tooltip:AddLine("Is available", 0, 1, 0)
    else
        tooltip:AddLine("Is not available", 1, 0, 0)
    end

    if elite.confirmed and elite.confirmed.bucket == ArgusEliteTracker:GetCurrentBucketNumber() then
        tooltip:AddLine("Is confirmed UP by: " .. elite.confirmed.who, 0, 1, 0)
    end

    tooltip:AddLine("Coordinates: (" .. (elite.x * 100) .. ", " .. (elite.y*100) .. ")", 1, 1, 1)
    tooltip:Show()
end

local function eliteWorldmap_OnLeave()
    tooltip:Hide()
end

local function eliteWorldmap_OnClick(self)
    ArgusEliteTracker:searchForGroup(self.elite)
end

function ArgusEliteTrackerMapUtils:createIconForElite(elite)

    local bgFrame = CreateFrame("Button", nil, WorldMapButton)
    bgFrame:SetPoint("CENTER", WorldMapButton, "CENTER", WorldMapButton)
    bgFrame:SetSize(ArgusEliteTrackerConfig.worldMapIconScale, ArgusEliteTrackerConfig.worldMapIconScale)
    bgFrame:SetFrameLevel(WorldMapButton:GetFrameLevel() + 99999)
    bgFrame:SetFrameStrata(WorldMapButton:GetFrameStrata())

    local iconTable = UnitPopupButtons.RAID_TARGET_8
    local bgTexture = bgFrame:CreateTexture(nil, "OVERLAY")
    bgTexture:SetTexCoord(iconTable.tCoordLeft, iconTable.tCoordRight, iconTable.tCoordTop, iconTable.tCoordBottom)
    bgTexture:SetTexture(iconTable.icon)
    bgTexture:ClearAllPoints()
    bgTexture:SetAllPoints(bgFrame)
    bgFrame.texture = bgTexture

    -- 0.74074074
    local frame = CreateFrame("Button", nil, bgFrame)
    frame:SetPoint("CENTER", bgFrame, "CENTER", bgFrame)
    frame:SetSize(ArgusEliteTrackerConfig.worldMapIconScale * self.scaleMultiplier, ArgusEliteTrackerConfig.worldMapIconScale * self.scaleMultiplier)
    frame:SetFrameLevel(bgFrame:GetFrameLevel() + 100000)
    frame:SetFrameStrata(bgFrame:GetFrameStrata())

    local texture = frame:CreateTexture(nil, "OVERLAY")
    
    texture:SetTexCoord(iconTable.tCoordLeft, iconTable.tCoordRight, iconTable.tCoordTop, iconTable.tCoordBottom)
    texture:SetTexture(iconTable.icon)
    texture:ClearAllPoints()
    texture:SetAllPoints(frame)
    frame.texture = texture

    local crossFrame = CreateFrame("Button", nil, bgFrame)
    crossFrame:SetPoint("CENTER", bgFrame, "CENTER", bgFrame)
    crossFrame:SetPoint("TOP", bgFrame, "TOP", 0, -4)
    crossFrame:SetSize(ArgusEliteTrackerConfig.worldMapIconScale * self.crossScaleMultiplier, ArgusEliteTrackerConfig.worldMapIconScale * self.crossScaleMultiplier)
    crossFrame:SetFrameLevel(bgFrame:GetFrameLevel() + 101000)
    crossFrame:SetFrameStrata(bgFrame:GetFrameStrata())

    iconTable = UnitPopupButtons.RAID_TARGET_7
    local crossTexture = crossFrame:CreateTexture(nil, "OVERLAY")
    crossTexture:SetTexCoord(iconTable.tCoordLeft, iconTable.tCoordRight, iconTable.tCoordTop, iconTable.tCoordBottom)
    crossTexture:SetTexture(iconTable.icon)
    crossTexture:ClearAllPoints()
    crossTexture:SetAllPoints(crossFrame)
    crossFrame.texture = crossTexture

    bgFrame:EnableMouse()
    bgFrame:SetScript("OnEnter", eliteWorldmap_OnEnter)
    bgFrame:SetScript("OnLeave", eliteWorldmap_OnLeave)
    bgFrame:SetScript("OnClick", eliteWorldmap_OnClick)
    frame:EnableMouse()
    frame:SetScript("OnEnter", eliteWorldmap_OnEnter)
    frame:SetScript("OnLeave", eliteWorldmap_OnLeave)
    frame:SetScript("OnClick", eliteWorldmap_OnClick)
    crossFrame:EnableMouse()
    
    frame:Show()
    crossFrame:Hide()
    bgFrame:Hide()
    bgFrame.crossFrame = crossFrame
    bgFrame.centerFrame = frame
    elite.hbmIcon = bgFrame
    bgFrame.elite = elite
    frame.elite = elite
    elite.hbmIcon.name = addonName..elite.name
end

function ArgusEliteTrackerMapUtils:disableIconForElite(elite)
    aet.hbm:RemoveAllWorldMapIcons(addonName)
end

function ArgusEliteTrackerMapUtils:enableIconForElite(elite)
    if not ArgusEliteTrackerConfig.disableMapIcons then
        aet.hbm:AddWorldMapIconMF(addonName, elite.hbmIcon, elite.mapId, nil, elite.x, elite.y)
    end
end

function ArgusEliteTrackerMapUtils:enableMapIcons()
    aet:PerformOnAllElites(function(elite)
        aetMapUtils:createIconForElite(elite)
        aet.hbm:AddWorldMapIconMF(addonName, elite.hbmIcon, elite.mapId, nil, elite.x, elite.y)
    end)
end

function ArgusEliteTrackerMapUtils:updateWorldMapIcons()
    if(not WorldMapButton:IsVisible()) then return end

    aetMapUtils:removeAllAetIcons()
    mapId, isContinent = GetCurrentMapAreaID()

    if(aet.elitesByZone[mapId] == nil) then return end

    for _, elite in pairs(aet.elitesByZone[mapId]) do
        elite:UpdateMapIcon()
        aetMapUtils:enableIconForElite(elite)
    end
end

function ArgusEliteTrackerMapUtils:removeAllAetIcons()
    aet.hbm:RemoveAllWorldMapIcons(addonName)
end

function ArgusEliteTrackerMapUtils:resizeIcons(size)
    aet:PerformOnAllElites(function(elite)
        elite:UpdateMapIcon()
    end)
end

