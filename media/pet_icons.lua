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

-- Shorten my handle
local x = addon.engine

addon.DEFAULT_PET_ICON = 'ability_hunter_pet_goto'

addon.PET_ICONS = {

	-- Hunter Pets (from WoWHead)
	[877476]  = 'inv_pet_-basilisk',                    -- Basilisk
	[132182]  = 'ability_hunter_pet_bat',               -- Bat
	[132183]  = 'ability_hunter_pet_bear',              -- Bear
	[133570]  = 'inv_misc_ahnqirajtrinket_01',          -- Beetle
	[132192]  = 'ability_hunter_pet_owl',               -- Bird of Prey
	[132184]  = 'ability_hunter_pet_boar',              -- Boar
	[132200]  = 'ability_hunter_pet_vulture',           -- Carrion Bird
	[132185]  = 'ability_hunter_pet_cat',               -- Cat
	[236190]  = 'ability_hunter_pet_chimera',           -- Chimaera
	[1044794] = 'inv_clefthoofdraenormount_blue',       -- Clefthoof
	[236191]  = 'ability_hunter_pet_corehound',         -- Core Hound
	[132186]  = 'ability_hunter_pet_crab',              -- Crab
	[877479]  = 'inv_pet_crane',                        -- Crane
	[132187]  = 'ability_hunter_pet_crocolisk',         -- Crocolisk
	[236192]  = 'ability_hunter_pet_devilsaur',         -- Devilsaur
	[877480]  = 'inv_pet_direhorn',                     -- Direhorn
	[877481]  = 'inv_pet_mastiff',                      -- Dog
	[132188]  = 'ability_hunter_pet_dragonhawk',        -- Dragonhawk
	[929300]  = 'inv_misc_elitehippogryph',             -- Feathermane
	[458223]  = 'ability_hunter_aspectofthefox',        -- Fox
	[877477]  = 'inv_pet_-goat',                        -- Goat
	[132189]  = 'ability_hunter_pet_gorilla',           -- Gorilla
	[463493]  = 'trade_archaeology_whitehydrafigurine', -- Hydra
	[132190]  = 'ability_hunter_pet_hyena',             -- Hyena
	[2011146] = 'achievement_dungeon_thesandqueen',     -- Krolusk
	[2027936] = 'inv_komododragon_green',               -- Lizard
	[132247]  = 'ability_mount_mechastrider',           -- Mechanical
	[877482]  = 'inv_pet_monkey',                       -- Monkey
	[236193]  = 'ability_hunter_pet_moth',              -- Moth
	[132191]  = 'ability_hunter_pet_netherray',         -- Nether Ray
	[616693]  = 'ability_mount_yakmount',               -- Oxen
	[1624590] = 'inv_pterrordax2mount_yellow',          -- Pterrordax
	[625905]  = 'achievement_moguraid_01',              -- Quilen
	[132193]  = 'ability_hunter_pet_raptor',            -- Raptor
	[132194]  = 'ability_hunter_pet_ravager',           -- Ravager
	[1044490] = 'inv_hippo_green',                      -- Riverbeast
	[644001]  = 'inv_pet_porcupine',                    -- Rodent
	[646378]  = 'inv_mushanbeastmount',                 -- Scalehide
	[132195]  = 'ability_hunter_pet_scorpid',           -- Scorpid
	[136040]  = 'spell_nature_guardianward',            -- Serpent
	[877478]  = 'inv_pet_-shalespider',                 -- Shale Spider
	[236195]  = 'ability_hunter_pet_silithid',          -- Silithid
	[132196]  = 'ability_hunter_pet_spider',            -- Spider
	[236165]  = 'ability_druid_primalprecision',        -- Spirit Beast
	[132197]  = 'ability_hunter_pet_sporebat',          -- Sporebat
	[1044501] = 'inv_talbukdraenor_white',              -- Stag
	[132198]  = 'ability_hunter_pet_tallstrider',       -- Tallstrider
	[804969]  = 'inv_pet_toad_green',                   -- Toad
	[132199]  = 'ability_hunter_pet_turtle',            -- Turtle
	[132201]  = 'ability_hunter_pet_warpstalker',       -- Warp Stalker
	[236196]  = 'ability_hunter_pet_wasp',              -- Wasp
	[643423]  = 'inv_pet_waterstrider',                 -- Water Strider
	[132202]  = 'ability_hunter_pet_windserpent',       -- Wind Serpent
	[132203]  = 'ability_hunter_pet_wolf',              -- Wolf
	[236197]  = 'ability_hunter_pet_worm',              -- Worm

	-- TODO: Add other class pets here :(
}

-- GetPetIcon returns a textureID (a number), when it used to return a texture path
function x.GetPetTexture()
	return "Interface\\Icons\\" .. (addon.PET_ICONS[GetPetIcon()] or addon.DEFAULT_PET_ICON)
end
