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

-- The order here is relevant!
local _, _, _, _, _, header, racial_spell = unpack(addon.merge_helpers)

--[[
header(C_CreatureInfo.GetRaceInfo(30).raceName) -- Lightforged Draenei
do
    racial_spell(256893, 1.0) -- Light's Judgment
end

header(C_CreatureInfo.GetRaceInfo(29).raceName) -- Void Elf
do
    racial_spell(259756, 2.5) --  Entropic embrace
end
]]
