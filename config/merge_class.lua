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

-- New way of doing merge spells
-- 'class' switches spells to that class
-- 'spec' switches spells to that specialization id
-- 'spell' takes a spell id and a merge interval in seconds
-- 'alias' takes the original spell id and a replacement spell id
local spell, class, spec, alias = unpack(addon.merge_helpers)

class 'DEATHKNIGHT'
do
	spec  '250' -- Blood
	spell '49939'   '0.1'	--  Blood Boil
	spell '55260'   '0.1'	--  Heart Strike
	spell '50454'   '6.0'	--  Health Leech
	spell '49928'   '0.1'	--  Blood Strike (MH/OH Merger)

	spec  '251' -- Frost
	spell '55095'   '3.0'	--  Frost Fever
	spell '51409'   '0.1'	--  Howling Blast
	spell '51423'   '0.1'	--  Obliterate (MH/OH Merger)
	spell '51418'   '0.1'	--  Frost Strike (MH/OH Merger)

	spec  '252' -- Unholy
	spell '55078'   '3.0'	--  Blood Plague
	spell '51460'   '3.0'	--  Necrosis
	spell '50526'   '3.0'	--  Wandering Plague
	spell '52212'   '3.0'	--  Death and Decay
	spell '47496'   '0.1'	--  Explode
	spell '49919'   '0.1'	--  Plague Strike (MH/OH Merger)
end

class 'DRUID'
do
	spec  '102' -- Balance
	spell '8921'   '3.0'	--  Moonfire
	spell '16914'  '3.0'	--  Hurricane

	spec  '103' -- Feral
	spell '779'    '0.1'	--  Swipe
	spell '1079'   '3.0'	--  Rip
	spell '1822'   '3.0'	--  Rake
	spell '22842'  '3.5'	--  Frenzied Regeneration

	spec  '105' -- Restoration
	spell '774'    '3.5'	--  Rejuvenation
	spell '8936'   '3.5'	--  Regrowth
	spell '740'    '3.0'	--  Tranquility
end


class 'HUNTER'
do
	spec  '253' -- Beast Mastery
	spell '136'    '3.0'	--  Mend Pet

	spec  '254' -- Marksmanship
	spell '1978'   '3.0'	--  Serpent Sting
	spell '2643'   '0.1'	--  Multi-Shot
	spell '1510'   '1.0'	--  Volley

	spec  '255' -- Survival
	spell '13812'  '3.0'	--  Explosive Trap
end


class 'MAGE'
do
	spec  '62' -- Arcane
	spell '1449'   '0.1'	-- Arcane Explosion
	spell '5143'   '1.6'	-- Arcane Missiles


	spec  '63' -- Fire
	spell '2120'   '0.1'	--  Flamestrike
	spell '11113'  '0.1'	--  Blast Wave
	spell '12654'  '3.0'	--  Ignite

	spec  '64' -- Frost
	spell '10'     '0.1'	--  Blizzard
	spell '120'    '0.1'	--  Cone of Cold
	spell '122'    '0.1'	--  Frost Nova
end


class "PALADIN"
do
	spec  '65' -- Holy
	spell '20267'  '6.0'	--  Light of Dawn
	spell '26573'  '3.0'	--  Consecration

	spec  '66' -- Protection
	spell '20911'  '3.0'	--  Blessing of Sanctuary
	spell '20925'  '3.0'	--  Holy Shield

	spec  '70' -- Retribution

end


class 'PRIEST'
do
	spec  '256' -- Discipline

	spec  '257' -- Holy
	spell '139'    '3.0'	--  Renew
	spell '596'    '0.1'	--  Prayer of Healing
	spell '14914'  '3.0'	--  Holy Fire
	spell '23455'  '0.1'	--  Holy Nova

	spec  '258' -- Shadow
	spell '589'    '4.0'	--  Shadow Word: Pain
	spell '15290'  '4.0'	--  Vampiric Embrace
end


class 'ROGUE'
do
	spec  '259' -- Assassination
	spell '703'    '3.0'	--  Garrote
	spell '1943'   '3.0'	--  Rupture
	spell '2818'   '3.0'	--  Deadly Poison
	spell '8680'   '3.0'	--  Wound Poison

	spec  '260' -- Outlaw
	spell '22482'  '3.0'	--  Blade Flurry

	spec  '261' -- Sublety

end


class 'SHAMAN'
do
	spec  '262' -- Elemental
	spell '421'    '0.1'	--  Chain Lightning
	spell '6363'   '3.0'	--  Searing Bolt
	spell '8050'   '3.0'	--  Flame Shock
	spell '8187'   '0.1'	--  Magma Totem
	spell '8349'   '0.1'	--  Fire Nova

	spec  '263' -- Enhancement
	spell '10444'  '3.0'	--  Flametongue Attack
	spell '26545'  '3.0'	--  Lightning Shield

	spec  '264' -- Restoration
	spell '1064'   '0.1'	--  Chain Heal
	spell '68883'  '0.1'	--  Healing Stream Totem
	spell '51945'  '3.0'    --  Earthliving
	spell '61295'  '3.0'    --  Riptide
end


class 'WARLOCK'
do
	spec  '265' -- Affliction
	spell '172'    '3.0'	--  Corruption
	spell '980'    '3.0'	--  Agony
	spell '18265'  '3.0'	--  Siphon Life

	spec  '266' -- Demonlogy
	spell '22703'  '0.1'	--  Infernal Awakening

	spec  '267' -- Destruction
	spell '348'    '3.0'	--  Immolate
	spell '5740'   '3.0'	--  Rain of Fire
	spell '1949'   '3.0'	--  Hellfire
end


class 'WARRIOR'
do
	spec  '71' -- Arms
	spell '772'    '3.0'	--  Rend
	spell '6343'   '0.1'	--  Thunder Clap
	spell '7384'   '0.1'	--  Overpower (Sweeping Strikes)
	spell '12294'  '0.1'	--  Mortal Strike (Sweeping Strikes)
	spell '12162'  '3.0'	--  Deep Wounds

	spec  '72' -- Fury
	spell '845'    '0.1'	--  Cleave
	spell '1464'   '0.1'	--  Slam (Sweeping Strikes)
	spell '5308'   '0.1'	--  Execute Arms (Sweeping Strikes)
	spell '1680'   '0.1'	--  Whirlwind
	spell '23881'  '0.1'	--  Bloodthirst

	spec  '73' -- Protection
	spell '6572'   '0.1'	--  Revenge
end
