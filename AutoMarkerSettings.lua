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
	Title = "AutoMarker: ".. GetAddOnMetadata("_AutoMarker", "Version").." By "..GetAddOnMetadata("_AutoMarker", "Author"),
	Size = {
		Border = 12,
		Button = 22,
		Gap = 8,
		Icon = 18,
	},
	--Interface\ChatFrame\UI-ChatIcon-ScrollDown-Up
	--Interface\ChatFrame\UI-ChatIcon-ScrollDown-Down
	--Interface\ChatFrame\UI-ChatIcon-ScrollDown-Disabled
	--Interface\Buttons\UI-Panel-MinimizeButton-Up
	--Interface\Buttons\UI-Panel-MinimizeButton-Down
	--Interface\Buttons\UI-Panel-Button-Disabled
	--Interface\Buttons\UI-Panel-MinimizeButton-Highlight
	--Interface\Buttons\UI-CheckBox-Up
	--Interface\Buttons\UI-CheckBox-Down
	--Interface\Buttons\UI-CheckBox-Highlight
	--Interface\Buttons\UI-CheckBox-Check
	--Interface\Buttons\UI-CheckBox-Check-Disabled
	Icon = {
		-- Client
		Texture  = "Interface\\TargetingFrame\\UI-RaidTargetingIcons",
		Coords = {
			{0, 0.25, 0, 0.25, 0},  -- star
			{0.5, 0.25, 0, 0.25},   -- circle
			{0.75, 0.5, 0, 0.25},   -- diamond
			{1, 0.75, 0, 0.25},     -- triangle
			{0, .25, 0.25, 0.5},    -- moon
			{0.25, 0.5, 0.25, 0.5}, -- square
			{0.5, .75, 0.25, 0.5},  -- cross or X
			{0.75, 1, 0.25, 0.5},   -- skull
		},
	},
}


local autoMarkerSettingsFrame = CreateFrame("Frame")

-- Register the events.
autoMarkerSettingsFrame:RegisterEvent("VARIABLES_LOADED");

AutoMarker_Config_MainMenu_Create = function()
	-- WoW uses border-box content sizing
	local PADDING_CLOSE = AUTOMARKER.Size.Border + 4
	local PADDING_FAR = AUTOMARKER.Size.Border + AUTOMARKER.Size.Gap
	local f = AutoMarker_Component_Dialog(PADDING_CLOSE)
	f.Title = AUTOMARKER.Title;
	f:SetFrameStrata("Dialog")

	local titleBox = AutoMarker_Component_TitleBox(f)
	titleBox:SetPoint("Center", f, "Top", 0, -10)

	local btnCloseTop = AutoMarker_Component_Button({ Parent=f, Size=AUTOMARKER.Size.Icon, "AutoMarker by Hobbitt" })
		--TooltipText=QUIVER_T.UI.CloseWindowTooltip })
	btnCloseTop.Texture:QuiverSetTexture(0.7, AUTOMARKER.Icon.XMark)
	btnCloseTop:SetPoint("TopRight", f, "TopRight", -PADDING_CLOSE, -PADDING_CLOSE)
	btnCloseTop:SetScript("OnClick", function() f:Hide() end)

	local yOffset = 1;
    f:SetWidth(530)
    f:SetHeight(300)

	local selectChannelZoneList = AutoMarker_Component_DropdownSelect(f, "Zone", npcsToMarkZone )
    local zoneDropDownX = 0.5 * (PADDING_FAR + 1 + PADDING_FAR - selectChannelZoneList:GetWidth()) + 100
    local zoneDropDownY = yOffset - 1 + selectChannelZoneList:GetHeight() + AUTOMARKER.Size.Gap - 75
	selectChannelZoneList:SetPoint("Left", f, "Left", zoneDropDownX, 0)
	selectChannelZoneList:SetPoint("Top", f, "Top", 0, zoneDropDownY)

    local zoneSelected = selectChannelZoneList.Selected:GetText()

    local selectChannelNpcList = AutoMarker_Component_DropdownSelect(f, "NPC Name", {"Test", "Test2", "Test3"} )
    local npcDropDownX = 0.5 * (PADDING_FAR + 1 + PADDING_FAR - selectChannelNpcList:GetWidth()) + 375
    local npcDropDownY = yOffset - 1 + selectChannelNpcList:GetHeight() + AUTOMARKER.Size.Gap - 75
	selectChannelNpcList:SetPoint("Left", f, "Left", npcDropDownX, 0)
	selectChannelNpcList:SetPoint("Top", f, "Top", 0, npcDropDownY)
	local npcSelected = selectChannelNpcList.Selected:GetText()

    local texturesArray = {};

	local function CreateRemoveRaidIconButton(coords, x, y, raidIconI)
		local myButton = CreateFrame("Button", "MyButton", f, "UIPanelButtonTemplate")
		myButton:SetWidth(32)  -- Width
		myButton:SetHeight(32)  -- Height
		myButton:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", x, y)  -- Position in the center of the screen

		-- Set the button's normal texture (default state)
		local normalTexture = myButton:CreateTexture(nil, "BACKGROUND")
		normalTexture:SetTexture(AUTOMARKER.Icon.Texture)
		normalTexture:SetAllPoints(myButton)
		normalTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		myButton:SetNormalTexture(normalTexture)

		-- Optionally, set the button's highlight texture (when hovered over)
		local highlightTexture = myButton:CreateTexture(nil, "HIGHLIGHT")
		highlightTexture:SetTexture(AUTOMARKER.Icon.Texture)
		highlightTexture:SetAllPoints(myButton)
		highlightTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		myButton:SetHighlightTexture(highlightTexture)

		-- Optionally, set the button's pushed texture (when clicked)
		local pushedTexture = myButton:CreateTexture(nil, "ARTWORK")
		pushedTexture:SetTexture(AUTOMARKER.Icon.Texture)
		pushedTexture:SetAllPoints(myButton)
		pushedTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		myButton:SetPushedTexture(pushedTexture)

		-- Set a script to handle the button click
		myButton:SetScript("OnClick", function()
			table.remove(npcsToMarkSaved[zoneSelected][npcSelected], raidIconI)
			removeRaidIcons()
			CreateRemoveRaidIconButtons(zoneSelected, npcSelected)
		end)

		table.insert(texturesArray, myButton)
		return myButton
	end

	local function GetArrayLength(array)
		local count = 0
		for _ in pairs(array) do
			count = count + 1
		end
		return count
	end
    function removeRaidIcons()
		for i = GetArrayLength(texturesArray), 1, -1 do
			local texture = texturesArray[i]
			if texture then
				texture:Hide()
				texturesArray[i] = nil
				table.remove(texturesArray, i)
			end
		end
	end
	function hideNpcDropDownMenuSelection()
		removeRaidIcons()
		selectChannelNpcList.Selected:SetText("")
	end
	function CreateRemoveRaidIconButtons(zoneSelected, npcSelected)
		local xCoord = 230;
		for i, marker in ipairs(npcsToMarkSaved[zoneSelected][npcSelected]) do
			CreateRemoveRaidIconButton(AUTOMARKER.Icon.Coords[marker], xCoord, 150, i)
			xCoord = xCoord + 34;
		end
		local textTimeTillDeathText = f:CreateFontString(nil, "OVERLAY", "GameTooltipText")
		textTimeTillDeathText:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE, MONOCHROME")
		textTimeTillDeathText:SetPoint("BOTTOMLEFT", 40, 158)
		textTimeTillDeathText:SetText(npcSelected);
		table.insert(texturesArray, textTimeTillDeathText)
	end

	function CreateAddRaidIconButtons()
		local xCoordAddition = 15;
		for i, coords in ipairs(AUTOMARKER.Icon.Coords) do
			CreateAddRaidIconButton(coords, xCoordAddition, -75, i)
			xCoordAddition = xCoordAddition + 61;
		end
	end
	function CreateAddRaidIconButton(coords, xPos, yPos, raidIconI)
		local myButton = CreateFrame("Button", "MyButton", f, "UIPanelButtonTemplate")
		myButton:SetWidth(60)  -- Width
		myButton:SetHeight(60)  -- Height
		myButton:SetPoint("LEFT", f, "LEFT", xPos, yPos)  -- Position in the center of the screen

		-- Set the button's normal texture (default state)
		local normalTexture = myButton:CreateTexture(nil, "BACKGROUND")
		normalTexture:SetTexture(AUTOMARKER.Icon.Texture)
		normalTexture:SetAllPoints(myButton)
		normalTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		myButton:SetNormalTexture(normalTexture)

		-- Optionally, set the button's highlight texture (when hovered over)
		local highlightTexture = myButton:CreateTexture(nil, "HIGHLIGHT")
		highlightTexture:SetTexture(AUTOMARKER.Icon.Texture)
		highlightTexture:SetAllPoints(myButton)
		highlightTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		myButton:SetHighlightTexture(highlightTexture)

		-- Optionally, set the button's pushed texture (when clicked)
		local pushedTexture = myButton:CreateTexture(nil, "ARTWORK")
		pushedTexture:SetTexture(AUTOMARKER.Icon.Texture)
		pushedTexture:SetAllPoints(myButton)
		pushedTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		myButton:SetPushedTexture(pushedTexture)

		-- Set a script to handle the button click
		myButton:SetScript("OnClick", function()
    		print("Add Button clicked! "..raidIconI)
			--check for duplicates
			for _, v in ipairs(npcsToMarkSaved[zoneSelected][npcSelected]) do
				if v == raidIconI then
					return false
				end
			end
			table.insert(npcsToMarkSaved[zoneSelected][npcSelected], raidIconI)
			removeRaidIcons()
			CreateRemoveRaidIconButtons(zoneSelected, npcSelected)
		end)
	end
	function setupNpcDropDownMenu()
		--setup the onclick binds for the npc drop down menu
		for _k2,oLoop2 in selectChannelNpcList.Menu.Options do
			local option2 = oLoop2
			option2:SetScript("OnClick", function()
				local text2 = option2.Text:GetText()
				selectChannelNpcList.Selected:SetText(text2)
				npcSelected = selectChannelNpcList.Selected:GetText()
				removeRaidIcons()
				CreateRemoveRaidIconButtons(zoneSelected, npcSelected)
				CreateAddRaidIconButtons()
				selectChannelNpcList.Menu:Hide()
			end)
		end
	end

	--setup the onclick binds for the zone drop down menu
	for _k,oLoop in selectChannelZoneList.Menu.Options do
		local option = oLoop
		option:SetScript("OnClick", function()
			local text = option.Text:GetText()
			selectChannelZoneList.Selected:SetText(text)
            zoneSelected = selectChannelZoneList.Selected:GetText()
			selectChannelZoneList.Menu:Hide()
			hideNpcDropDownMenuSelection()

			--fill the npc drop down menu
            selectChannelNpcList.Menu.Options = selectChannelNpcList.fillMenu(npcsToMarkSaved[zoneSelected])
			setupNpcDropDownMenu()
		end)
	end
	return f
end

local autoMarkerSettingsFrame = AutoMarker_Config_MainMenu_Create()

-- Function to handle the slash command
local function ShowAutoMarkerSettingsFrame()
    autoMarkerSettingsFrame:Show()
end

-- Define the slash command
SLASH_AUTOMARKER1 = "/automarker"
SLASH_AUTOMARKER2 = "/am"  -- Optional additional slash command
SlashCmdList["AUTOMARKER"] = function(msg)
    ShowAutoMarkerSettingsFrame()
end