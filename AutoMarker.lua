AutoMarker = {};
DEFAULT_CHAT_FRAME:AddMessage("AutoMarker Module Loaded..");
local autoMarkerFrame = CreateFrame("Frame")

local npcsToMark = {};
npcsToMark["Eastern Plaguelands"] = {}
npcsToMark["Eastern Plaguelands"]["Carrion Grub"] = {8,7,6}
--MC
npcsToMark["Molten Core"] = {}
npcsToMark["Molten Core"]["Molten Giant"]         = {8, 7};
npcsToMark["Molten Core"]["Molten Destroyer"]     = {8, 7};
npcsToMark["Molten Core"]["Fire Lord"]            = {8, 7};
npcsToMark["Molten Core"]["Lava Annihilator"]     = {8, 7};
npcsToMark["Molten Core"]["Lava Surger"]          = {8, 7};
npcsToMark["Molten Core"]["Ancient Core Hound"]   = {8, 7};
npcsToMark["Molten Core"]["Firesworn"]            = {8,7,6,5,4,3,2,1};
npcsToMark["Molten Core"]["Lucifron"]             = {1};
npcsToMark["Molten Core"]["Flamewaker Protector"] = {8,7};
npcsToMark["Molten Core"]["Flamewaker Elite"]     = {8,7,2,1};
npcsToMark["Molten Core"]["Flamewaker Healer"]    = {5,4,6,3};
npcsToMark["Molten Core"]["Flamewaker Priest"]    = {8,7,2,1};
npcsToMark["Molten Core"]["Core Hound"]           = {6,5,4,3,2,1};
npcsToMark["Molten Core"]["Firewalker"]           = {8};
npcsToMark["Molten Core"]["Flameguard"]           = {7};
npcsToMark["Molten Core"]["Lava Elemental"]       = {1, 2};
npcsToMark["Molten Core"]["Lava Reaver"]          = {1, 2};

--BWL
--after vael
npcsToMark["Blackwing Lair"] = {}
npcsToMark["Blackwing Lair"]["Death Talon Flamescale"] = {2,3};
npcsToMark["Blackwing Lair"]["Death Talon Seether"]    = {8,7};
npcsToMark["Blackwing Lair"]["Death Talon Captain"]    = {1};
npcsToMark["Blackwing Lair"]["Death Talon Wyrmkin"]    = {5,6};
--suppression room
npcsToMark["Blackwing Lair"]["Death Talon Hatcher"]    = {8,7};
npcsToMark["Blackwing Lair"]["Blackwing Taskmaster"]   = {6,5,4};
--after broodlord
npcsToMark["Blackwing Lair"]["Death Talon Overseer"]   = {5,8,7};
npcsToMark["Blackwing Lair"]["Blackwing Spellbinder"]  = {1,2};
npcsToMark["Blackwing Lair"]["Blackwing Warlock"]      = {8,7};
--after firemaw, before flamegor and after ebonroc
npcsToMark["Blackwing Lair"]["Death Talon Wyrmguard"]  = {2,3,4};

--AQ40
npcsToMark["Ahn'Qiraj"] = {};
npcsToMark["Ahn'Qiraj"]["Obsidian Eradicator"] = {8};
npcsToMark["Ahn'Qiraj"]["Anubisath Sentinel"]  = {7,1,2,3};
npcsToMark["Ahn'Qiraj"]["The Prophet Skeram"]  = {1}
--mindcontroller = {8,7};
--bug launcher   = {1,2,3,4}

--Naxx
--SpiderWing
npcsToMark["Naxxramas"] = {}
npcsToMark["Naxxramas"]["Dread Creeper"]          = {8,7,1,2,3,4};
npcsToMark["Naxxramas"]["Carrion Spinner"]        = {1,2,3,4,6,7,8};
npcsToMark["Naxxramas"]["Necro Stalker"]          = {8,7};
npcsToMark["Naxxramas"]["Naxxramas Acolyte"]      = {8,7,1,2};
npcsToMark["Naxxramas"]["Necropolis Acolyte"]     = {8,7};
npcsToMark["Naxxramas"]["Crypt Guard"]            = {8,7};
npcsToMark["Naxxramas"]["Plagued Ghoul"]          = {8,7,1};
npcsToMark["Naxxramas"]["Naxxramas Worshipper"]   = {1,2,3,4};
npcsToMark["Naxxramas"]["Naxxramas Follower"]     = {8,7};
npcsToMark["Naxxramas"]["Grand Widow Faerlina"]   = {6};
--abom wing
npcsToMark["Naxxramas"]["Bile Retcher"]           = {8,7};
npcsToMark["Naxxramas"]["Patchwork Golem"]        = {8,7,1,2};
npcsToMark["Naxxramas"]["Sludge Belcher"]         = {8,7,1,2};
npcsToMark["Naxxramas"]["Living Monstrosity"]     = {8};
npcsToMark["Naxxramas"]["Mad Scientist"]          = {7,6,4,3,5};
--military wing
npcsToMark["Naxxramas"]["Deathknight"]            = {8,7};
npcsToMark["Naxxramas"]["Risen Deathknight"]      = {7,1};
npcsToMark["Naxxramas"]["Deathknight Captain"]    = {2, 3};
npcsToMark["Naxxramas"]["Shade of Naxxramas"]     = {8,7};
npcsToMark["Naxxramas"]["Necro Knight"]           = {7,1,2};
npcsToMark["Naxxramas"]["Dark Touched Warrior"]   = {7,1,2};
npcsToMark["Naxxramas"]["Death Touched Warrior"]  = {7,1,2};
npcsToMark["Naxxramas"]["Bony Construct"]         = {8,7,1,2,3,4,6};
npcsToMark["Naxxramas"]["Skeletal Smith"]         = {8,7,1,2};
npcsToMark["Naxxramas"]["Deathknight Vindicator"] = {7};
npcsToMark["Naxxramas"]["Deathknight Cavalier"]   = {8,7,1};
npcsToMark["Naxxramas"]["Deathknight Understudy"] = {8,7,1,2};
npcsToMark["Naxxramas"]["Unholy Swords"]          = {8,7};
npcsToMark["Naxxramas"]["Unholy Axe"]             = {8,7};
npcsToMark["Naxxramas"]["Unholy Staff"]           = {8,7};
--Plague Wing
npcsToMark["Naxxramas"]["Infectious Ghoul"]       = {8,7,1};
npcsToMark["Naxxramas"]["Plague Slime (Red)"]     = {3,4};
npcsToMark["Naxxramas"]["Plague Slime (Blue)"]    = {3,4};
npcsToMark["Naxxramas"]["Plague Slime (Green)"]   = {3,4};
npcsToMark["Naxxramas"]["Plague Slime"]           = {3,4};
npcsToMark["Naxxramas"]["Stoneskin Gargoyle"]     = {8,7};

-- skull    = 8
-- x        = 7
-- square   = 6
-- moon     = 5
-- triangle = 4
-- diamond  = 3
-- circle   = 2
-- star     = 1

local marksUsed = {0, 0, 0, 0, 0, 0, 0, 0};
-- Register the events
autoMarkerFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

-- Function to handle mouseover event
local function OnMouseover()
    if (GetNumRaidMembers() > 0) then
        if UnitIsEnemy("player","mouseover") or UnitReaction("player","mouseover") == 4 then
            if IsShiftKeyDown() then
                local targetName = UnitName("mouseover");
                markerArray = npcsToMark[GetRealZoneText()][targetName];
                if markerArray then
                    for index, value in ipairs(markerArray) do
                        if (marksUsed[value] == 0 or GetTime()-marksUsed[value] > 4) then
                            marksUsed[value] = GetTime();
                            SetRaidTarget("mouseover", value)
                            break;
                        end
                    end

                end
            end
        end
    end
end

-- Set up event handler
autoMarkerFrame:SetScript("OnEvent", function()
    if event == "UPDATE_MOUSEOVER_UNIT" then
        OnMouseover()
    end
end)