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

-- No locals for NOOP
local noop = function() end

local AddonName, addon = ...
addon.engine = LibStub("AceAddon-3.0"):NewAddon(AddonName, "AceConsole-3.0")

xCT_Plus = addon

-- No Operation
addon.noop = noop

addon.IsClassic = _G.WOW_PROJECT_ID == _G.WOW_PROJECT_CLASSIC
addon.IsCata = _G.WOW_PROJECT_ID == _G.WOW_PROJECT_CATACLYSM_CLASSIC

local L = {}
setmetatable(L, {
    __index = function(self, key) return key end
})

addon.L = L
