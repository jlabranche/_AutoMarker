-- Create the main frame
local Every = function(xs, f)
	for _k, v in xs do
		if not f(v) then return false end
	end
	return true
end

local Find = function(xs, f)
	for _k, v in xs do
		if f(v) then return v end
	end
	return nil
end

local Length = function(xs)
	local l = 0
	for _k, _v in xs do l = l + 1 end
	return l
end

local Map = function(xs, f)
	local ys = {}
	local i = 0
	for _k, v in xs do
		table.insert(ys, f(v, i))
		i = i + 1
	end
	return ys
end

-- Assumes positive numbers
local Max = function(xs)
	local max = 0
	for _k, w in xs do
		if w > max then max = w end
	end
	return max
end

local Some = function(xs, f)
	for _k, v in xs do
		if f(v) then return true end
	end
	return false
end

local Sum = function(xs)
	local total = 0
	for _k, v in xs do
		total = total + v
	end
	return total
end

Quiver_Lib_F = {
	Every=Every,
	Find=Find,
	Length=Length,
	Map=Map,
	Max=Max,
	Some=Some,
	Sum=Sum,
}
QUIVER = {
	-- I don't know if hidden auras show via GameTooltip.
	Buff_Cap = 32,-- I think UI shows up to 24.
	Debuff_Cap = 24,-- UI shows 16. Turtle allows 8 more hidden.
	Aura_Cap = 32 + 24,
	ColorDefault = {
		AutoShotReload = { 1, 0, 0 },
		AutoShotShoot = { 1, 1, 0 },
		Castbar = { 0.42, 0.41, 0.53 },
		Range = {
			Melee = { 0, 1, 0, 0.7 },
			DeadZone = { 1, 0.5, 0, 0.7 },
			ScareBeast = { 0, 1, 0.2, 0.7 },
			ScatterShot = { 0, 1, 0.8, 0.7 },
			Short = { 0, 0.8, 0.8, 0.7 },
			Long = { 0, 0.8, 0.8, 0.7 },
			Mark = { 1, 0.2, 0, 0.7 },
			TooFar = { 1, 0, 0, 0.7 },
		},
	},
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
	local PADDING_CLOSE = QUIVER.Size.Border + 4
	local PADDING_FAR = QUIVER.Size.Border + QUIVER.Size.Gap
	local f = AutoMarker_Component_Dialog(PADDING_CLOSE)
	f:SetFrameStrata("Dialog")

	local titleBox = AutoMarker_Component_TitleBox(f)
	titleBox:SetPoint("Center", f, "Top", 0, -10)

	local btnCloseTop = AutoMarker_Component_Button({
		Parent=f, Size=QUIVER.Size.Icon })
		--TooltipText=QUIVER_T.UI.CloseWindowTooltip })
	--btnCloseTop.Texture:QuiverSetTexture(0.7, QUIVER.Icon.XMark)
	btnCloseTop:SetPoint("TopRight", f, "TopRight", -PADDING_CLOSE, -PADDING_CLOSE)
	btnCloseTop:SetScript("OnClick", function() f:Hide() end)

	--local btnToggleLock = createIconBtnLock(f)
	--local lockOffsetX = PADDING_CLOSE + QUIVER.Size.Icon + QUIVER.Size.Gap/2
	--btnToggleLock:SetPoint("TopRight", f, "TopRight", -lockOffsetX, -PADDING_CLOSE)

	--local btnResetFrames = createIconResetAll(f)
	--local resetOffsetX = lockOffsetX + QUIVER.Size.Icon + QUIVER.Size.Gap/2
	--btnResetFrames:SetPoint("TopRight", f, "TopRight", -resetOffsetX, -PADDING_CLOSE)

	--local controls = createAllModuleControls(f, QUIVER.Size.Gap)
	--local colorPickers = Quiver_Config_Colors(f, QUIVER.Size.Gap)

	local yOffset = 1;-- -PADDING_CLOSE - QUIVER.Size.Icon - QUIVER.Size.Gap
	--controls:SetPoint("Top", f, "Top", 0, yOffset)
	--controls:SetPoint("Left", f, "Left", PADDING_FAR, 0)
	--colorPickers:SetPoint("Top", f, "Top", 0, yOffset)
	--colorPickers:SetPoint("Right", f, "Right", -PADDING_FAR, 0)
	--f:SetWidth(PADDING_FAR + controls:GetWidth() + PADDING_FAR + colorPickers:GetWidth() + PADDING_FAR)

	local selectChannelHit = AutoMarker_Component_DropdownSelect(f,
		"Tranq Speech", { "None", "/Say", "/Raid" })--,
		--Quiver_Store.ModuleStore[Quiver_Module_TranqAnnouncer.Id].TranqChannel)
	--local tranqX = 0.5 * (PADDING_FAR + controls:GetWidth() + PADDING_FAR - selectChannelHit:GetWidth())
    local tranqX = 0.5 * (PADDING_FAR + 1 + PADDING_FAR - selectChannelHit:GetWidth())
	--local tranqY = yOffset - colorPickers:GetHeight() + selectChannelHit:GetHeight() + QUIVER.Size.Gap
    local tranqY = yOffset - 1 + selectChannelHit:GetHeight() + QUIVER.Size.Gap
	selectChannelHit:SetPoint("Left", f, "Left", tranqX, 0)
	selectChannelHit:SetPoint("Top", f, "Top", 0, tranqY)

	for _k,oLoop in selectChannelHit.Menu.Options do
		local option = oLoop
		option:SetScript("OnClick", function()
			local text = option.Text:GetText()
			--Quiver_Store.ModuleStore[Quiver_Module_TranqAnnouncer.Id].TranqChannel = text
			selectChannelHit.Selected:SetText(text)
			--selectChannelHit.Menu:Hide()
		end)
	end

	local hLeft = 1;--controls:GetHeight()
	local hRight = 1;--colorPickers:GetHeight()
	local hMax = hRight > hLeft and hRight or hLeft
	yOffset = yOffset - hMax - QUIVER.Size.Gap

	--local tranqOptions = Quiver_Config_InputText_TranqAnnouncer(f, QUIVER.Size.Gap)
	--tranqOptions:SetPoint("TopLeft", f, "TopLeft", 0, yOffset)
	--yOffset = yOffset - tranqOptions:GetHeight()
	--yOffset = yOffset - QUIVER.Size.Gap

	f:SetHeight(-1 * yOffset + PADDING_CLOSE + QUIVER.Size.Button)
	return f
end

Quiver_Config_MainMenu_Create():Show();