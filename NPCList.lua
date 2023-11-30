-- skull    = 8
-- x        = 7
-- square   = 6
-- moon     = 5
-- triangle = 4
-- diamond  = 3
-- circle   = 2
-- star     = 1
npcsToMark = {};
-- /script print(GetRealZoneText())

-- Emerald Sanctum
npcsToMark["Emerald Sanctum"] = {}
npcsToMark["Emerald Sanctum"]["Sanctum Supressor"] = {8}
npcsToMark["Emerald Sanctum"]["Sanctum Scalebane"] = {6, 5}
npcsToMark["Emerald Sanctum"]["Sanctum Wyrmkin"] = {7}

-- ZG
-- Panther Boss Area

npcsToMark["Zul'Gurub"] = {};
npcsToMark["Zul'Gurub"]["Hakkari Shadow Hunter"] = {8, 7, 6, 5};
npcsToMark["Zul'Gurub"]["Gurubashi Blood Drinker"] = {6, 5, 4, 3};


-- Raptor boss
npcsToMark["Zul'Gurub"]["Bloodlord Mandokir"] = {8};
npcsToMark["Zul'Gurub"]["Ohgan"] = {7};
npcsToMark["Zul'Gurub"]["Vilebranch Speaker"] = {8};

--
npcsToMark["Zul'Gurub"]["Gurubashi Bat Rider"] = {8, 7, 6, 5};

-- spider boss
npcsToMark["Zul'Gurub"]["Withbark Speaker"] = {8};
npcsToMark["Zul'Gurub"]["Razzashi Broodwidow"] = {6, 5};
npcsToMark["Zul'Gurub"]["Hakkari Shadowcaster"] = {3};
npcsToMark["Zul'Gurub"]["Razzashi Skitterer"] = {1, 2};
--Venoxis
npcsToMark["Zul'Gurub"]["Razzashi Cobra"] = {1, 2, 3, 4};
--
npcsToMark["Zul'Gurub"]["Gurubashi Champion"] = {4, 3, 2, 1};
npcsToMark["Zul'Gurub"]["Gurubashi Berserker"] = {8, 7};
npcsToMark["Zul'Gurub"]["Gurubashi Axe Thrower"] = {6, 5};
npcsToMark["Zul'Gurub"]["Gurubashi Axe Thrower"] = {6, 5};
npcsToMark["Zul'Gurub"]["Gurubashi Headhunter"] = {6, 5};
npcsToMark["Zul'Gurub"]["Gurubashi Priest"] = {8, 7};
npcsToMark["Zul'Gurub"]["Hakkari Priest"] = {8, 7};
npcsToMark["Zul'Gurub"]["Hakkari Witch Doctor"] = {8, 7};
npcsToMark["Zul'Gurub"]["Razzashi Adder"] = {8, 7};
npcsToMark["Zul'Gurub"]["Zealot Zath"] = {3};
npcsToMark["Zul'Gurub"]["Zealot Lor'Khan"] = {1};
npcsToMark["Zul'Gurub"]["High Priest Thekal"] = {5};
--hakkar trash
npcsToMark["Zul'Gurub"]["Hakkari Blood Priest"] = {6, 5};
npcsToMark["Zul'Gurub"]["Soulflayer"] = {4, 3};

npcsToMark["Eastern Plaguelands"] = {};
npcsToMark["Stormwind City"] = {};
npcsToMark["Eastern Plaguelands"]["Carrion Grub"] = {8,7,6};
npcsToMark["Stormwind City"]["Stormwind City Guard"] = {8,7,6};
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
npcsToMark["Molten Core"]["Gehennas"]             = {1};
npcsToMark["Molten Core"]["Flamewaker"]           = {8,7};
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
npcsToMark["Ahn'Qiraj"]["Obsidian Eradicator"]    = {8,7};
npcsToMark["Ahn'Qiraj"]["Anubisath Sentinel"]     = {1,2,3,4};
npcsToMark["Ahn'Qiraj"]["The Prophet Skeram"]     = {1}
npcsToMark["Ahn'Qiraj"]["Vekniss Guardian"]       = {1,2,3,4,5,6,7,8}
npcsToMark["Ahn'Qiraj"]["Qiraji Brainwasher"]     = {8,7}
npcsToMark["Ahn'Qiraj"]["Lord Kri"]               = {8}
npcsToMark["Ahn'Qiraj"]["Princess Yauj"]          = {7}
npcsToMark["Ahn'Qiraj"]["Vem"]                    = {1}
npcsToMark["Ahn'Qiraj"]["Vekniss Warrior"]        = {3,4,5}
npcsToMark["Ahn'Qiraj"]["Vekniss Hive Crawler"]   = {8,7}
npcsToMark["Ahn'Qiraj"]["Sartura's Royal Guard"]  = {8,7,1}
npcsToMark["Ahn'Qiraj"]["Battleguard Sartura"]    = {2}
npcsToMark["Ahn'Qiraj"]["Qiraji Mindslayer"]      = {8,7,2,1}
npcsToMark["Ahn'Qiraj"]["Qiraji Slayer"]          = {1,2,7,8}


--Naxx
--SpiderWing
npcsToMark["Naxxramas"] = {}
npcsToMark["Naxxramas"]["Venom Stalker"]          = {6};
npcsToMark["Naxxramas"]["Dread Creeper"]          = {8,7,6,5};
npcsToMark["Naxxramas"]["Crypte Reaver"]          = {8};
npcsToMark["Naxxramas"]["Carrion Spinner"]        = {5,4,3,1};
npcsToMark["Naxxramas"]["Necro Stalker"]          = {8,7};
npcsToMark["Naxxramas"]["Naxxramas Acolyte"]      = {8,7,6,5};
npcsToMark["Naxxramas"]["Necropolis Acolyte"]     = {8,7};
npcsToMark["Naxxramas"]["Crypt Guard"]            = {8,7};
npcsToMark["Naxxramas"]["Plagued Ghoul"]          = {8,7,6,5};
npcsToMark["Naxxramas"]["Naxxramas Worshipper"]   = {1,2,6,4};
npcsToMark["Naxxramas"]["Naxxramas Follower"]     = {8,7};
--npcsToMark["Naxxramas"]["Grand Widow Faerlina"]   = {3};
--abom wing
npcsToMark["Naxxramas"]["Bile Retcher"]           = {8,7};
npcsToMark["Naxxramas"]["Patchwork Golem"]        = {8,7,6,5};
npcsToMark["Naxxramas"]["Sludge Belcher"]         = {8,7,6,5};
npcsToMark["Naxxramas"]["Living Monstrosity"]     = {8};
npcsToMark["Naxxramas"]["Mad Scientist"]          = {7,6,5,4,3};
--military wing
npcsToMark["Naxxramas"]["Deathknight"]            = {8,7};
npcsToMark["Naxxramas"]["Risen Deathknight"]      = {7,6};
npcsToMark["Naxxramas"]["Deathknight Captain"]    = {5,4};
npcsToMark["Naxxramas"]["Shade of Naxxramas"]     = {8,7};
npcsToMark["Naxxramas"]["Necro Knight"]           = {7,6,5};
npcsToMark["Naxxramas"]["Dark Touched Warrior"]   = {7,6,5};
npcsToMark["Naxxramas"]["Death Touched Warrior"]  = {7,6,5};
npcsToMark["Naxxramas"]["Doom Touched Warrior"]   = {7,6,5};
npcsToMark["Naxxramas"]["Bony Construct"]         = {8,7,6,5,4,3,2};
npcsToMark["Naxxramas"]["Skeletal Smith"]         = {8,7,6,5};
npcsToMark["Naxxramas"]["Deathknight Vindicator"] = {7};
npcsToMark["Naxxramas"]["Deathknight Cavalier"]   = {8,7,6};
npcsToMark["Naxxramas"]["Deathknight Understudy"] = {8,7,6,5};
npcsToMark["Naxxramas"]["Unholy Swords"]          = {8,7};
npcsToMark["Naxxramas"]["Unholy Axe"]             = {8,7};
npcsToMark["Naxxramas"]["Unholy Staff"]           = {8,7};
--Plague Wing
npcsToMark["Naxxramas"]["Infectious Ghoul"]       = {8,7,6};
npcsToMark["Naxxramas"]["Plague Slime (Red)"]     = {3,4};
npcsToMark["Naxxramas"]["Plague Slime (Blue)"]    = {3,4};
npcsToMark["Naxxramas"]["Plague Slime (Green)"]   = {3,4};
npcsToMark["Naxxramas"]["Plague Slime"]           = {3,4};
npcsToMark["Naxxramas"]["Stoneskin Gargoyle"]     = {8,7};
npcsToMark["Naxxramas"]["Stitched Spewer"]        = {8,7,6};

