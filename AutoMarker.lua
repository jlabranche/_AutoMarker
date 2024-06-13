AutoMarker = {};
DEFAULT_CHAT_FRAME:AddMessage("AutoMarker Module Loaded..");
local autoMarkerFrame = CreateFrame("Frame")


local marksUsed = {0, 0, 0, 0, 0, 0, 0, 0};
-- Register the events
autoMarkerFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
autoMarkerFrame:RegisterEvent("ADDON_LOADED")

-- Function to handle mouseover event
local function OnMouseover()
    if (GetNumRaidMembers() > 0 or (GetNumPartyMembers() > 0 and UnitIsPartyLeader("player"))) then
        if UnitIsEnemy("player","mouseover") or UnitReaction("player","mouseover") == 4 then
            if IsShiftKeyDown() and (IsControlKeyDown() or IsAltKeyDown()) then
                local targetName = UnitName("mouseover");
                local npcIsCurrentlyMarkedWith = GetRaidTargetIndex("mouseover");
                if (targetName) then
                    local currentHealth = UnitHealth("mouseover")
                    local maxHealth = UnitHealthMax("mouseover")
                    local healthPercentage = (currentHealth / maxHealth) * 100
                    if (healthPercentage > 0) then
                        if (npcsToMarkSaved == nil) then
                            npcsToMarkSaved = npcsToMark
                        end
                        if (npcsToMarkSaved[GetRealZoneText()]) then
                            markerArray = npcsToMarkSaved[GetRealZoneText()][targetName];
                            if markerArray then
                                for index, value in ipairs(markerArray) do
                                    if (marksUsed[value] and (marksUsed[value] == 0 or GetTime()-marksUsed[value] > 4)) then
                                        if (npcIsCurrentlyMarkedWith == nil or marksUsed[npcIsCurrentlyMarkedWith] == 0 or GetTime()-marksUsed[npcIsCurrentlyMarkedWith] > 4) then
                                            marksUsed[value] = GetTime();
                                            SetRaidTarget("mouseover", value);
                                            print("AutoMarker: "..value);
                                            break;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Set up event handler
autoMarkerFrame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "_AutoMarker" then
        print("Loaded "..arg1)
        npcsToMark = npcsToMarkSaved or npcsToMark
    end
    if event == "UPDATE_MOUSEOVER_UNIT" then
        OnMouseover()
    end
end)