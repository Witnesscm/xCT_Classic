--[[   ____    ______
      /\  _`\ /\__  _\   __
 __  _\ \ \/\_\/_/\ \/ /_\ \___
/\ \/'\\ \ \/_/_ \ \ \/\___  __\
\/>  </ \ \ \L\ \ \ \ \/__/\_\_/
 /\_/\_\ \ \____/  \ \_\  \/_/
 \//\/_/  \/___/    \/_/

 [=====================================]
 [  Author: Dandraffbal-Stormreaver US ]
 [  xCT+ Version 4.x.x                 ]
 [  ©2020. All Rights Reserved.        ]
 [====================================]]

local ADDON_NAME, addon = ...

-- New way of doing merge items
-- 'alias' takes the original spell id and a replacement spell id
-- item takes a item id, the merge interval in seconds, and a helpful description of the item
-- header switches the header for the next set of items
local _, _, _, alias, item, header = unpack(addon.merge_helpers)

header "|cff325A93Battle for Azeroth|r™ |cff798BDDItems|r"
do
	-- Trinkets
	item '276199' '1.0' "Trinket: Darkmoon Deck: Fathoms"
	item '276132' '2.0' "Trinket: Darkmoon Deck: Squalls"
	item '278057' '0.5' "Trinket: Vigilant's Bloodshaper"
	item '270827' '0.5' "Trinket: Vessel of Skittering Shadows"
	item '302311' '0.5' "Trinket: Remote Guidance Device"
end

header "|cff325A93Battle for Azeroth|r™ |cff798BDDHeart Of Azeroth|r"
do
	item '295367' '1.0' "Heart of Azeroth (Crucible of flames)"  
	item '295261' '1.5' "Heart of Azeroth (Focusing iris)"  
end

header "|cff325A93Battle for Azeroth|r™ |cff798BDDAzerite Traits|r"
do
	item '280705' '0.5' "Laser Matrix"
	item '280286' '0.5' "Dagger in the Back"
	item '269031' '0.5' "Gutripper"
	item '279958' '0.5' "Azerite Globules"
	item '271685' '0.5' "Heed My Call"

	alias '271685' '271686' -- Azerite Trait: "Heed My Call"

	-- Warlock

	item '280206' '2.5' "Ruinous Bolt (Azerite Traits)"   	--  Warlock: Ruinous bolt
	
	-- Death Knight
	
	alias '275931' '47541'  								-- Harrowing Decay links to Death Coil
end

header "|cff325A93Battle for Azeroth|r™ |cff798BDDWorldQuest|r"
do
	-- worldquest
	item '269238' '1.5' "World Quest: Drustvar "			-- Vehicules world quest Drustvar
end

header "|cff325A93Battle for Azeroth|r™ |cff6D1192Corruption|r"
do
	item '316661' '0.5' "Obsidian Destruction"
	item '318187' '1.0' "Gushing Wound"
end