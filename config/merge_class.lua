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
	spell '48721'   '0.1'	--  Blood Boil
	spell '55050'   '0.1'	--  Heart Strike
	spell '50454'   '6.0'	--  Health Leech

	spec  '251' -- Frost
	spell '55095'   '3.0'	--  Frost Fever
	spell '49184'   '0.1'	--  Howling Blast
	spell '50401'   '3.0'	--  Razor Frost
	spell '49020'   '0.1'	--  Obliterate (For Merge)
	spell '49143'   '0.1'	--  Frost Strike (For Merge)
	alias '66198'   '49020'	--  Obliterate (MH/OH Merger)
	alias '66196'   '49143'	--  Frost Strike (MH/OH Merger)

	spec  '252' -- Unholy
	spell '55078'   '3.0'	--  Blood Plague
	spell '52212'   '3.0'	--  Death and Decay
	spell '50536'   '3.0'	--  Unholy Blight
end


class 'DRUID'
do
	spec  '102' -- Balance
	spell '8921'   '3.0'	--  Moonfire
	spell '5570'   '3.0'	--  Insect Swarm
	spell '16914'  '3.0'	--  Hurricane
	spell '42231'  '3.0'	--  Hurricane (Cata)
	spell '50288'  '3.0'	--  Starfall (Cata)
	spell '61391'  '0.1'	--  Typhoon (Cata)

	spec  '103' -- Feral
	spell '779'    '0.1'	--  Swipe
	spell '1079'   '3.0'	--  Rip
	spell '1822'   '3.0'	--  Rake
	spell '22842'  '3.5'	--  Frenzied Regeneration
	spell '62078'  '0.1'	--  Swipe (Cata Cat)
	spell '9007'   '3.0'	--  Pounce Bleed (Cata)
	spell '77758'  '3.0'	--  Thrash (Cata)

	spec  '105' -- Restoration
	spell '774'    '3.5'	--  Rejuvenation
	spell '8936'   '3.5'	--  Regrowth
	spell '740'    '3.0'	--  Tranquility
	spell '33763'  '3.0'	--  Lifebloom (Cata)
	spell '48438'  '3.0'	--  Wild Growth (Cata)
end


class 'HUNTER'
do
	spec  '253' -- Beast Mastery
	spell '136'    '3.0'	--  Mend Pet

	spec  '254' -- Marksmanship
	spell '2643'   '0.1'	--  Multi-Shot
	spell '1510'   '1.0'	--  Volley
	spell '76663'  '0.1'	--  Wild Quiver (Cata)

	spec  '255' -- Survival
	spell '1978'   '3.0'	--  Serpent Sting
	spell '13812'  '3.0'	--  Explosive Trap
	spell '13797'  '3.0'	--  Immolation Trap
	spell '24131'  '3.0'	--  Wyvern Sting
	spell '3674'   '3.0'	--  Black Arrow
	spell '53301'  '2.5'	--  Explosive Shot (Cata)
end


class 'MAGE'
do
	spec  '62' -- Arcane
	spell '1449'   '0.1'	-- Arcane Explosion
	spell '7268'   '1.6'	-- Arcane Missiles

	spec  '63' -- Fire
	spell '2120'   '3.0'	--  Flamestrike
	spell '11113'  '0.1'	--  Blast Wave
	spell '12654'  '3.0'	--  Ignite
	spell '11366'  '3.0'	--  Pyroblast
	spell '31661'  '0.1'	--  Dragon's Breath
	spell '44457'  '3.0'	--  Living Bomb
	spell '44461'  '0.1'	--  Living Bomb
	spell '88148'  '3.0'	--  Flamestrike
	spell '92315'  '3.0'	--  Pyroblast! (Cata)
	spell '413843' '3.0'	--  Ignite (Cata)
	-- TODO: Flame Orb

	spec  '64' -- Frost
	spell '10'     '0.1'	--  Blizzard
	spell '120'    '0.1'	--  Cone of Cold
	spell '122'    '0.1'	--  Frost Nova
	spell '42208'  '0.1'	--  Blizzard
end


class "PALADIN"
do
	spec  '65' -- Holy
	spell '2812'   '0.5'	--  Holy Wrath
	spell '20267'  '6.0'	--  Light of Dawn
	spell '26573'  '3.0'	--  Consecration
	spell '81297'  '3.0'	--  Consecration (Cata)
	spell '85222'  '0.1'	--  Light of Dawn (Cata)
	spell '82327'  '3.0'	--  Holy Radiance (Cata)

	spec  '66' -- Protection
	spell '20911'  '3.0'	--  Blessing of Sanctuary
	spell '20925'  '3.0'	--  Holy Shield
	spell '31935'  '0.5'	--  Avenger's Shield
	spell '88263'  '0.1'	--  Hammer of the Righteous (Cata)

	spec  '70' -- Retribution
	spell '20424'  '3.0'	--  Seals of Command
	spell '42463'  '3.0'	--  Seal of Truth
	spell '53385'  '0.1'	--  Divine Storm
	spell '96172'  '3.0'	--  Hand of Light (Cata)
	spell '101423' '3.0'	--  Seal of Righteousness (Cata)
end


class 'PRIEST'
do
	spec  '256' -- Discipline
	spell '47666'  '2.0'	--  Penance
	spell '47750'  '2.0'	--  Penance

	spec  '257' -- Holy
	spell '139'    '3.0'	--  Renew
	spell '596'    '0.1'	--  Prayer of Healing
	spell '14914'  '3.0'	--  Holy Fire
	spell '23455'  '0.1'	--  Holy Nova
	spell '15237'  '0.1'	--  Holy Nova
	spell '23455'  '0.1'	--  Holy Nova
	spell '34861'  '0.1'	--  Circle of Healing
	spell '64844'  '3.0'	--  Divine Hymn
	spell '77489'  '3.0'	--  Echo of Light (Cata)
	spell '88686'  '3.0'	--  Holy Word: Sanctuary (Cata)

	spec  '258' -- Shadow
	spell '589'    '3.0'	--  Shadow Word: Pain
	spell '2944'   '3.0'	--  Devouring Plague
	spell '15290'  '3.0'	--  Vampiric Embrace
	spell '15407'  '3.0'	--  Mind Flay
	spell '34914'  '3.0'	--  Vampiric Touch
	spell '49821'  '3.0'	--  Mind Sear
end


class 'ROGUE'
do
	spec  '259' -- Assassination
	spell '703'    '3.0'	--  Garrote
	spell '1943'   '3.0'	--  Rupture
	spell '2818'   '3.0'	--  Deadly Poison
	spell '8680'   '3.0'	--  Wound Poison
	spell '5374'   '0.1'	--  Mutilate (For Merge)
	spell '79136'  '3.0'	--  Venomous Wound (Cata)
	alias '27576'  '5374'	--  Mutilate (MH/OH Merger)

	spec  '260' -- Outlaw
	spell '22482'  '3.0'	--  Blade Flurry
	spell '51723'  '0.5'	--  Fan of Knives
	spell '57841'  '3.0'	--  Killing Spree (For Merge)
	alias '57842'  '57841'	--  Killing Spree (MH/OH Merger)

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
	spell '13376'  '3.0'	--  Fire Shield
	spell '45297'  '0.1'	--  Chain Lightning
	spell '51490'  '0.1'	--  Thunderstorm
	spell '77478'  '0.1'	--  Earthquake (Cata)

	spec  '263' -- Enhancement
	spell '10444'  '3.0'	--  Flametongue Attack
	spell '26545'  '3.0'	--  Lightning Shield
	spell '58879'  '3.0'	--  Spirit Hunt

	spec  '264' -- Restoration
	spell '1064'   '0.1'	--  Chain Heal
	spell '52042'  '3.0'    --  Healing Stream Totem
	spell '51945'  '3.0'    --  Earthliving
	spell '61295'  '3.0'    --  Riptide
	spell '73920'  '3.0'    --  Healing Rain (Cata)
end


class 'WARLOCK'
do
	spec  '265' -- Affliction
	spell '172'    '3.0'	--  Corruption
	spell '980'    '3.0'	--  Agony
	spell '18265'  '3.0'	--  Siphon Life
	spell '689'    '3.0'	--  Drain Life
	spell '89653'  '3.0'	--  Drain Life
	spell '30108'  '3.0'	--  Unstable Affliction
	spell '27243'  '3.0'	--  Seed of Corruption
	spell '27285'  '0.1'	--  Seed of Corruption

	spec  '266' -- Demonlogy
	spell '20153'  '3.0'	--  Immolation (Infrenal)
	spell '22703'  '0.1'	--  Infernal Awakening
	spell '50590'  '3.0'	--  Immolation
	spell '54786'  '0.1'	--  Demon Leap
	spell '89753'  '3.0'	--  Felstorm (Cata)

	spec  '267' -- Destruction
	spell '348'    '3.0'	--  Immolate
	spell '5740'   '3.0'	--  Rain of Fire
	spell '1949'   '3.0'	--  Hellfire
	spell '5857'   '3.0'	--  Hellfire
	spell '30283'  '0.1'	--  Shadowfury
	spell '42223'  '3.0'	--  Rain of Fire (Cata)
	spell '47897'  '0.1'	--  Shadowflame
	spell '47960'  '3.0'	--  Shadowflame
	spell '85421'  '3.0'	--  Burning Embers (Cata)
	spell '85455'  '3.0'	--  Bane of Havoc (Cata)
end


class 'WARRIOR'
do
	spec  '71' -- Arms
	spell '772'    '3.0'	--  Rend
	spell '6343'   '0.1'	--  Thunder Clap
	spell '7384'   '0.1'	--  Overpower (Sweeping Strikes)
	spell '12294'  '0.1'	--  Mortal Strike (Sweeping Strikes)
	spell '12162'  '3.0'	--  Deep Wounds
	spell '50622'  '3.0'	--  Whirlwind
	spell '76858'  '3.0'	--  Opportunity Strike (Cata)
	spell '94009'  '3.0'	--  Rend (Cata)
	spell '413764' '3.0'	--  Deep Wound (Cata)

	spec  '72' -- Fury
	spell '845'    '0.1'	--  Cleave
	spell '1464'   '0.1'	--  Slam (Sweeping Strikes)
	spell '5308'   '0.1'	--  Execute Arms (Sweeping Strikes)
	spell '1680'   '0.1'	--  Whirlwind
	spell '23881'  '0.1'	--  Bloodthirst
	spell '6544'   '0.1'	--  Heroic Leap
	spell '96103'  '0.1'	--  Raging Blow (For Merge)
	alias '85384'  '96103'	--  Killing Spree (MH/OH Merger)
	alias '44949'  '1680'	--  Whirlwind (MH/OH Merger)

	spec  '73' -- Protection
	spell '6572'   '0.1'	--  Revenge
	spell '46968'  '0.1'	--  Shockwave
end
