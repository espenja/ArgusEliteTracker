local addonName, addonData = ...

local defaultFontName = "Fonts/FRIZQT__.TTF"

function addonData:createLabel(text, fontSize, alignment, parentFrame)
    if parentFrame == nil then return end

    local label = parentFrame:CreateFontString()
    label:SetFont(defaultFontName, fontSize)
    label:SetPoint(alignment, parentFrame, alignment, 0, 0)
    label:SetJustifyH("LEFT")
    label:SetJustifyV("TOP")
    label:SetText(text)
    label:SetTextColor(1, 1, 1, 1)
    return label
end


function addonData:createOptionsLabel(parent, x, y, font, fontSize, text)
    if parent == nil then return end

    local label = parent:CreateFontString(nil, "OVERLAY", font)
    label:SetFont(font, fontSize)
    label:SetPoint("TOPLEFT", x, y)
    label:SetJustifyH("LEFT")
    label:SetJustifyV("TOP")
    label:SetText(text)
end


-- Thanks Shadokugel, check out his addon WoWProgressLink!
local counter = 0
function addonData:createCheckButton(parent, x, y, text)
    counter = counter + 1
    local button = CreateFrame("CheckButton", "ArgusEliteTrackerCheckBox" .. counter, parent, "InterfaceOptionsCheckButtonTemplate")
    button:SetPoint("TOPLEFT", x, y)
    local buttonText = getglobal(button:GetName() .. 'Text')
    buttonText:SetText(text)
    buttonText:SetPoint("TOPLEFT", 27, -7)
    return button;
end

