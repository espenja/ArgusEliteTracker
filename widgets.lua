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


function addonData:createOptionsLabel(parent, x, y, font, fontSize, text, width, justifyH)
    if parent == nil then return end

    local label = parent:CreateFontString(nil, "OVERLAY", font)
    label:SetFont(font, fontSize)
    label:SetPoint("TOPLEFT", x, y)
    label:SetJustifyH("LEFT")
    label:SetJustifyV("TOP")
    label:SetText(text)

    if width ~= nil then
        label:SetWidth(width)
    end

    if justifyH ~= nil then
        label:SetJustifyH(justifyH)
    end

    return label
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


local sliderCounter = 0
function addonData:createSlider(parent, x, y, min, max, step, initialValue)
    if parent == nil then return end
    sliderCounter = sliderCounter + 1

    local slider = CreateFrame("Slider", "ArgusEliteTrackerSlider" .. sliderCounter, parent, "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", x, y)
    slider:SetWidth(300)
    slider:SetHeight(15)
    slider:SetValueStep(1)
    slider:SetMinMaxValues(min, max)
    slider:SetValue(initialValue)
    slider:SetObeyStepOnDrag(true)
    slider:SetHitRectInsets(0, 0, -14, -15)
    slider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
    return slider
end
