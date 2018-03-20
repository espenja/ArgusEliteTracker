local addonName, addonData = ...
ArgusEliteTrackerMapUtils = {}

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
    ArgusEliteTracker:searchForGroup(self.elite)
end

function ArgusEliteTrackerMapUtils:createIconForElite(elite)

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

function ArgusEliteTrackerMapUtils:removeAllAetIcons()
    aet.hbm:RemoveAllWorldMapIcons(addonName)
end


