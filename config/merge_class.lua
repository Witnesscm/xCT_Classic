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


class 'DRUID'
do
	spec  '102' -- Balance
	spell '8921'   '3.0'	--  Moonfire
	spell '16914'  '3.0'	--  Hurricane

	spec  '103' -- Feral
	spell '779'    '0.0'	--  Swipe
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
	spell '2643'   '0.0'	--  Multi-Shot
	spell '1510'   '1.0'	--  Volley

	spec  '255' -- Survival
	spell '13812'  '3.0'	--  Explosive Trap
end


class 'MAGE'
do
	spec  '62' -- Arcane
	spell '1449'   '0.0'	-- Arcane Explosion
	spell '5143'   '1.6'	-- Arcane Missiles


	spec  '63' -- Fire
	spell '2120'   '0.0'	--  Flamestrike
	spell '11113'  '0.0'	--  Blast Wave
	spell '12654'  '3.0'	--  Ignite

	spec  '64' -- Frost
	spell '10'	   '0.0'	--  Blizzard
	spell '120'    '0.0'	--  Cone of Cold
	spell '122'    '0.0'	--  Frost Nova
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
	spell '596'    '0.0'	--  Prayer of Healing
	spell '14914'  '3.0'	--  Holy Fire
	spell '23455'  '0.0'	--  Holy Nova

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
	spell '421'    '1.0'	--  Chain Lightning
	spell '6363'   '3.0'	--  Searing Bolt
	spell '8050'   '3.0'	--  Flame Shock
	spell '8187'   '3.0'	--  Magma Totem
	spell '8349'   '0.0'	--  Fire Nova

	spec  '263' -- Enhancement
	spell '10444'  '3.0'	--  Flametongue Attack
	spell '26545'  '3.0'	--  Lightning Shield

	spec  '264' -- Restoration
	spell '1064'   '2.0'	--  Chain Heal
	spell '5672'   '3.0'	--  Healing Stream Totem
end


class 'WARLOCK'
do
	spec  '265' -- Affliction
	spell '172'    '3.0'	--  Corruption
	spell '980'    '3.0'	--  Agony
	spell '18265'  '3.0'	--  Siphon Life

	spec  '266' -- Demonlogy
	spell '20153'  '3.0'	--  Immolation (Infrenal)
	spell '22703'  '0.0'	--  Infernal Awakening

	spec  '267' -- Destruction
	spell '348'    '3.0'	--  Immolate
	spell '5740'   '3.0'	--  Rain of Fire
	spell '1949'   '3.0'	--  Hellfire
end


class 'WARRIOR'
do
	spec  '71' -- Arms
	spell '772'    '3.0'	--  Rend
	spell '6343'   '0.0'	--  Thunder Clap
	spell '7384'   '0.5'	--  Overpower (Sweeping Strikes)
	spell '12294'  '0.5'	--  Mortal Strike (Sweeping Strikes)
	spell '12162'  '3.0'	--  Deep Wounds

	spec  '72' -- Fury
	spell '845'    '0.5'	--  Cleave
	spell '1464'   '0.5'	--  Slam (Sweeping Strikes)
	spell '5308'   '0.5'	--  Execute Arms (Sweeping Strikes)
	spell '1680'   '0.5'	--  Whirlwind
	spell '23881'  '0.0'	--  Bloodthirst

	spec  '73' -- Protection
	spell '6572'   '0.0'	--  Revenge
	
end
