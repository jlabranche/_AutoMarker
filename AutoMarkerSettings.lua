-- Assumes positive numbers
function tableKeys(table)
    local keys = {}
    local i = 1
    for key, _ in pairs(table) do
        keys[i] = key
        i = i + 1
    end
    return keys
end

AUTOMARKER = {
	Size = {
		Border = 12,
		Button = 22,
		Gap = 8,
		Icon = 18,
	},
	Icon = {
		-- Custom
		ArrowsSwap = "Interface\\AddOns\\Quiver\\Textures\\arrow-right-arrow-left",
		CaretDown = "Interface\\AddOns\\Quiver\\Textures\\caret-down-fill",
		GripHandle = "Interface\\AddOns\\Quiver\\Textures\\grip-lines",
		LockClosed = "Interface\\AddOns\\Quiver\\Textures\\lock",
		LockOpen = "Interface\\AddOns\\Quiver\\Textures\\lock-open",
		Reset = "Interface\\AddOns\\Quiver\\Textures\\arrow-rotate-right",
		XMark = "Interface\\AddOns\\Quiver\\Textures\\xmark",
		-- Client
		Aspect_Beast = "Interface\\Icons\\Ability_Mount_WhiteTiger",
		Aspect_Cheetah = "Interface\\Icons\\Ability_Mount_JungleTiger",
		Aspect_Hawk = "Interface\\Icons\\Spell_Nature_RavenForm",
		Aspect_Monkey = "Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey",
		Aspect_Pack = "Interface\\Icons\\Ability_Mount_WhiteTiger",
		Aspect_Wild = "Interface\\Icons\\Spell_Nature_ProtectionformNature",-- 'form' is not a typo.
		Aspect_Wolf = "Interface\\Icons\\Ability_Mount_WhiteDireWolf",
		CurseOfTongues = "Interface\\Icons\\Spell_Shadow_CurseOfTounges",
		-- Confirmed correct casting on Turtle
		NaxxTrinket = "Interface\\Icons\\INV_Trinket_Naxxramas04",
		-- I think this is wrong, but other addons use this casing.
		-- Maybe Turtle changes the name? Can servers do that?
		NaxxTrinketWrong = "Interface\\Icons\\Inv_Trinket_Naxxramas04",
		Quickshots = "Interface\\Icons\\Ability_Warrior_InnerRage",
		RapidFire = "Interface\\Icons\\Ability_Hunter_RunningShot",
		TrollBerserk = "Interface\\Icons\\Racial_Troll_Berserk",
		Trueshot = "Interface\\Icons\\Ability_TrueShot",
	},
}


local autoMarkerSettingsFrame = CreateFrame("Frame")

-- Register the events.
autoMarkerSettingsFrame:RegisterEvent("VARIABLES_LOADED");

-- Other globals.
autoMarker_Settings = {};

Quiver_Config_MainMenu_Create = function()
	-- WoW uses border-box content sizing
	local PADDING_CLOSE = AUTOMARKER.Size.Border + 4
	local PADDING_FAR = AUTOMARKER.Size.Border + AUTOMARKER.Size.Gap
	local f = AutoMarker_Component_Dialog(PADDING_CLOSE)
	f:SetFrameStrata("Dialog")

	local titleBox = AutoMarker_Component_TitleBox(f)
	titleBox:SetPoint("Center", f, "Top", 0, -10)

	local btnCloseTop = AutoMarker_Component_Button({ Parent=f, Size=AUTOMARKER.Size.Icon, "TEST" })
		--TooltipText=QUIVER_T.UI.CloseWindowTooltip })
	btnCloseTop.Texture:QuiverSetTexture(0.7, AUTOMARKER.Icon.XMark)
	btnCloseTop:SetPoint("TopRight", f, "TopRight", -PADDING_CLOSE, -PADDING_CLOSE)
	btnCloseTop:SetScript("OnClick", function() f:Hide() end)

	local yOffset = 1;
    f:SetWidth(500)
    f:SetHeight(500)

	local selectChannelHit = AutoMarker_Component_DropdownSelect(f, "Zone", npcsToMarkZone )
    local tranqX = 0.5 * (PADDING_FAR + 1 + PADDING_FAR - selectChannelHit:GetWidth()) + 100
    local tranqY = yOffset - 1 + selectChannelHit:GetHeight() + AUTOMARKER.Size.Gap - 75
	selectChannelHit:SetPoint("Left", f, "Left", tranqX, 0)
	selectChannelHit:SetPoint("Top", f, "Top", 0, tranqY)

    local selectedOption = selectChannelHit.Selected:GetText()
    local selectedOption2 = selectChannelHit.Selected:GetText()

    local selectChannelHit2 = AutoMarker_Component_DropdownSelect(f, "NPC Name", {"Test", "Test2", "Test3"} )
    local tranqX2 = 0.5 * (PADDING_FAR + 1 + PADDING_FAR - selectChannelHit:GetWidth()) + 375
    local tranqY2 = yOffset - 1 + selectChannelHit:GetHeight() + AUTOMARKER.Size.Gap - 75
	selectChannelHit2:SetPoint("Left", f, "Left", tranqX2, 0)
	selectChannelHit2:SetPoint("Top", f, "Top", 0, tranqY2)

	for _k,oLoop in selectChannelHit.Menu.Options do
		local option = oLoop
		option:SetScript("OnClick", function()
			local text = option.Text:GetText()
			selectChannelHit.Selected:SetText(text)
            selectedOption = selectChannelHit.Selected:GetText()
			selectChannelHit.Menu:Hide()
            --selectChannelHit2.ExistingMenus = {};
            selectChannelHit2.Menu.Options = selectChannelHit2.fillMenu(npcsToMark[selectedOption])

		end)
	end

	for _k,oLoop in selectChannelHit2.Menu.Options do
		local option = oLoop
		option:SetScript("OnClick", function()
			local text = option.Text:GetText()
			selectChannelHit2.Selected:SetText(text)
            selectedOption2 = selectChannelHit2.Selected:GetText()
			selectChannelHit2.Menu:Hide()
		end)
	end




	local hLeft = 1;--controls:GetHeight()
	local hRight = 1;--colorPickers:GetHeight()
	local hMax = hRight > hLeft and hRight or hLeft
	yOffset = yOffset - hMax - AUTOMARKER.Size.Gap

	--local tranqOptions = Quiver_Config_InputText_TranqAnnouncer(f, QUIVER.Size.Gap)
	--tranqOptions:SetPoint("TopLeft", f, "TopLeft", 0, yOffset)
	--yOffset = yOffset - tranqOptions:GetHeight()
	--yOffset = yOffset - QUIVER.Size.Gap
	--f:SetHeight(-1 * yOffset + PADDING_CLOSE + QUIVER.Size.Button)
	return f
end

Quiver_Config_MainMenu_Create():Show();