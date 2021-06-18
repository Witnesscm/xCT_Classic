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

-- This file is a static default profile.  After your first profile is created, editing this file will do nothing.
local ADDON_NAME, addon = ...
local L = addon.L

-- taken from: https://github.com/Gethe/wow-ui-source/blob/e337b8949ffad2876ea0489d8331db2414342d32/FrameXML/CombatFeedback.lua
do -- blizzard hiding globals?
  SCHOOL_MASK_NONE      = 0x00;
  SCHOOL_MASK_PHYSICAL  = 0x01;
  SCHOOL_MASK_HOLY      = 0x02;
  SCHOOL_MASK_FIRE      = 0x04;
  SCHOOL_MASK_NATURE    = 0x08;
  SCHOOL_MASK_FROST     = 0x10;
  SCHOOL_MASK_SHADOW    = 0x20;
  SCHOOL_MASK_ARCANE    = 0x40;
end

-- =====================================================
-- CreateMergeSpellEntry(
--    default,       [bool] - This specs current activated spell (only one per spec)
--    spellID,        [int] - the spell id to watch for
--    watchUnit,   [string] - look for the spell id on this unit
--  )
--    Creates a merge settings entry for a spell.
-- =====================================================
local function CreateComboSpellEntry(default, spellID, watchUnit)
  return {
       enabled = default,
            id = spellID,
          unit = watchUnit  or "player",
    }
end

-- Upvalue
local tostring = tostring


-- Add Merge Spell to the DB before it gets used by the profile
addon.mergesNameToID = {}

function addon.GenerateDefaultSpamSpells()
  local default = addon.defaults.profile.spells.merge
  for id, item in pairs(addon.merges) do
    default[id] = item
    default[id].enabled = true

    local name = GetSpellInfo(id)
    if name then
      addon.mergesNameToID[name] = id
    end
  end
end

addon.defaults = {
  profile = {
    showStartupText = true,
    hideConfig = true,
    bypassCVars = false,

    blizzardFCT = {
      blizzardHeadNumbers = false, -- enable the head numbers
      enabled = false,             -- enable custom font for head numbers
      font = "Condensed Bold (xCT+)",
      fontName = [[Interface\AddOns\]] .. ADDON_NAME .. [[\media\OpenSans-CondBold.ttf]],
      fontSize = 32, -- unused
      fontOutline = "2OUTLINE", -- unused

      -- CVars
      enableFloatingCombatText = false,
      floatingCombatTextAllSpellMechanics = false,
      floatingCombatTextAuras = false,
      floatingCombatTextAuraFade = false,
      floatingCombatTextCombatDamage = false,
      floatingCombatTextCombatDamageAllAutos = false,
      floatingCombatTextCombatHealing = false,
      -- floatingCombatTextCombatHealingAbsorbSelf = false,
      -- floatingCombatTextCombatHealingAbsorbTarget = false,
      floatingCombatTextCombatLogPeriodicSpells = false,
      floatingCombatTextCombatState = false,
      floatingCombatTextComboPoints = false,
      floatingCombatTextDamageReduction = false,
      floatingCombatTextDodgeParryMiss = false,
      floatingCombatTextEnergyGains = false,
      floatingCombatTextFloatMode = false,
      floatingCombatTextFriendlyHealers = false,
      floatingCombatTextHonorGains = false,
      floatingCombatTextLowManaHealth = false,
      floatingCombatTextPeriodicEnergyGains = false,
      floatingCombatTextPetMeleeDamage = false,
      floatingCombatTextPetSpellDamage = false,
      floatingCombatTextReactives = false,
      floatingCombatTextRepChanges = false,
      floatingCombatTextSpellMechanics = false,
      floatingCombatTextSpellMechanicsOther = false,

      floatingCombatTextCombatDamageDirectionalOffset = 1,
      floatingCombatTextCombatDamageDirectionalScale = 1,
    },

    SpellColors = {
      -- Vanilla Schools
      [tostring(SCHOOL_MASK_PHYSICAL)] = { enabled = false, desc = STRING_SCHOOL_PHYSICAL, default = { 1.00, 1.00, 1.00 } },
      [tostring(SCHOOL_MASK_HOLY)]     = { enabled = false, desc = STRING_SCHOOL_HOLY,     default = { 1.00, 1.00, 0.30 } },
      [tostring(SCHOOL_MASK_FIRE)]     = { enabled = false, desc = STRING_SCHOOL_FIRE,     default = { 1.00, 0.15, 0.18 } },
      [tostring(SCHOOL_MASK_NATURE)]   = { enabled = false, desc = STRING_SCHOOL_NATURE,   default = { 0.40, 1.00, 0.40 } },
      [tostring(SCHOOL_MASK_FROST)]    = { enabled = false, desc = STRING_SCHOOL_FROST,    default = { 0.30, 0.30, 0.90 } },
      [tostring(SCHOOL_MASK_SHADOW)]   = { enabled = false, desc = STRING_SCHOOL_SHADOW,   default = { 1.00, 0.70, 1.00 } },
      [tostring(SCHOOL_MASK_ARCANE)]   = { enabled = false, desc = STRING_SCHOOL_ARCANE,   default = { 0.75, 0.75, 0.75 } },

      -- Physical and a Magical
      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FIRE)]   = { enabled = false, desc = STRING_SCHOOL_FLAMESTRIKE,  default = { 1.00, 0.58, 0.59 } },
      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FROST)]  = { enabled = false, desc = STRING_SCHOOL_FROSTSTRIKE,  default = { 0.65, 0.65, 0.95 } },
      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_ARCANE)] = { enabled = false, desc = STRING_SCHOOL_SPELLSTRIKE,  default = { 0.87, 0.87, 0.87 } },
      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_NATURE)] = { enabled = false, desc = STRING_SCHOOL_STORMSTRIKE,  default = { 0.70, 1.00, 0.70 } },
      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_SHADOW)] = { enabled = false, desc = STRING_SCHOOL_SHADOWSTRIKE, default = { 1.00, 0.85, 1.00 } },
      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_HOLY)]   = { enabled = false, desc = STRING_SCHOOL_HOLYSTRIKE,   default = { 1.00, 1.00, 0.83 } },

      -- Two Magical Schools
      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST)]    = { enabled = false, desc = STRING_SCHOOL_FROSTFIRE,              default = { 0.65, 0.23, 0.54 } },
      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_ARCANE)]   = { enabled = false, desc = STRING_SCHOOL_SPELLFIRE,              default = { 0.87, 0.45, 0.47 } },
      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_NATURE)]   = { enabled = false, desc = STRING_SCHOOL_FIRESTORM,              default = { 0.70, 0.58, 0.29 } },
      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_SHADOW)]   = { enabled = false, desc = STRING_SCHOOL_SHADOWFLAME,            default = { 1.00, 0.43, 0.59 } },
      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_HOLY)]     = { enabled = false, desc = STRING_SCHOOL_HOLYFIRE,     default = { 1.00, 0.58, 0.24 } },
      [tostring(SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE)]  = { enabled = false, desc = STRING_SCHOOL_SPELLFROST,             default = { 0.53, 0.53, 0.83 } },
      [tostring(SCHOOL_MASK_FROST + SCHOOL_MASK_NATURE)]  = { enabled = false, desc = STRING_SCHOOL_FROSTSTORM,             default = { 0.35, 0.65, 0.65 } },
      [tostring(SCHOOL_MASK_FROST + SCHOOL_MASK_SHADOW)]  = { enabled = false, desc = STRING_SCHOOL_SHADOWFROST,            default = { 0.65, 0.50, 0.95 } },
      [tostring(SCHOOL_MASK_FROST + SCHOOL_MASK_HOLY)]    = { enabled = false, desc = STRING_SCHOOL_HOLYFROST,              default = { 0.65, 0.65, 0.60 } },
      [tostring(SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE)] = { enabled = false, desc = STRING_SCHOOL_SPELLSTORM,    default = { 0.58, 0.87, 0.58 } },
      [tostring(SCHOOL_MASK_ARCANE + SCHOOL_MASK_SHADOW)] = { enabled = false, desc = STRING_SCHOOL_SPELLSHADOW,            default = { 0.87, 0.73, 0.87 } },
      [tostring(SCHOOL_MASK_ARCANE + SCHOOL_MASK_HOLY)]   = { enabled = false, desc = STRING_SCHOOL_DIVINE,                 default = { 0.87, 0.87, 0.53 } },
      [tostring(SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW)] = { enabled = false, desc = STRING_SCHOOL_SHADOWSTORM,   default = { 0.70, 0.85, 0.70 } },
      [tostring(SCHOOL_MASK_NATURE + SCHOOL_MASK_HOLY)]   = { enabled = false, desc = STRING_SCHOOL_HOLYSTORM,              default = { 0.70, 1.00, 0.35 } },
      [tostring(SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY)]   = { enabled = false, desc = STRING_SCHOOL_SHADOWHOLY, default = { 1.00, 0.85, 0.65 } },

      -- Three or More Schools
      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_NATURE)]
        = { enabled = false, desc = STRING_SCHOOL_ELEMENTAL, default = { 0.57, 0.48, 0.49 } },

      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW)]
        = { enabled = false, desc = STRING_SCHOOL_CHROMATIC, default = { 0.69, 0.58, 0.65 } },

      [tostring(SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY)]
        = { enabled = false, desc = STRING_SCHOOL_MAGIC, default = { 0.74, 0.65, 0.59 } },

      [tostring(SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY)]
        = { enabled = false, desc = STRING_SCHOOL_ALL, default = { 0.78, 0.70, 0.65 } },
    },

    frameSettings = {
      clearLeavingCombat = false,
      showGrid = true,
      showPositions = true,
      frameStrata = "5HIGH",
    },

    megaDamage = {
      thousandSymbol = "|cffFF8000K|r",
      millionSymbol = "|cffFF0000M|r",
      billionSymbol = "|cffFF0000G|r",
      decimalPoint = true,
    },

    frames = {
      general = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "bottom",
        ["alpha"] = 100,
        ["megaDamage"] = true,

        -- position
        ["X"] = 0,
        ["Y"] = 224,
        ["Width"] = 512,
        ["Height"] = 128,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 18,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "CENTER",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ["interrupts"]   = { enabled = false, desc = INTERRUPTS,     default = { 1.00, 0.50, 0.00 } },
          ["killingBlow"]  = { enabled = false, desc = KILLING_BLOWS,  default = { 0.20, 1.00, 0.20 } },
          ["honorGains"]   = { enabled = false, desc = HONOR_GAINED,   default = { 0.10, 0.10, 1.00 } },

          ["auras"] = {
            enabled = false, desc = L["Buffs and Debuffs"],
            colors = {
              ["buffsGained"]        = { enabled = false, desc = L["Buffs Gained"],       default = { 1.00, 0.50, 0.50 } },
              ["buffsFaded"]         = { enabled = false, desc = L["Buffs Faded"],        default = { 0.50, 0.50, 0.50 } },
              ["debuffsGained"]      = { enabled = false, desc = L["Debuffs Gained"],     default = { 1.00, 0.10, 0.10 } },
              ["debuffsFaded"]       = { enabled = false, desc = L["Debuffs Faded"],      default = { 0.50, 0.50, 0.50 } },
            },
          },
          ["dispells"] = {
            enabled = false, desc = L["Dispell Buffs and Debuffs"],
            colors = {
              ["dispellBuffs"]       = { enabled = false, desc = "Buffs",              default = { 0.00, 1.00, 0.50 } },
              ["dispellDebuffs"]     = { enabled = false, desc = "Debuffs",            default = { 1.00, 0.00, 0.50 } },
              ["dispellStolen"]      = { enabled = false, desc = L["Spell Stolen"],       default = { 0.31, 0.71, 1.00 } },
            },
          },
          ["reputation"] = {
            enabled = false, desc = L["Reputation"],
            colors = {
              ["reputationGain"]     = { enabled = false, desc = L["Reputation Gained"],  default = { 0.10, 0.10, 1.00 } },
              ["reputationLoss"]     = { enabled = false, desc = L["Reputation Lost"],    default = { 1.00, 0.10, 0.10 } },
            },
          },
          ["combat"] = {
            enabled = false, desc = L["Combat Status"],
            colors = {
              ["combatEntering"]     = { enabled = false, desc = L["Entering Combat"],    default = { 1.00, 0.10, 0.10 } },
              ["combatLeaving"]      = { enabled = false, desc = L["Leaving Combat"],     default = { 0.10, 1.00, 0.10 } },
            },
          },
          ["lowResources"] = {
            enabled = false, desc = L["Low Resources"],
            colors = {
              ["lowResourcesHealth"] = { enabled = false, desc = L["Low Health"],         default = { 1.00, 0.10, 0.10 } },
              ["lowResourcesMana"]   = { enabled = false, desc = L["Low Mana"],           default = { 1.00, 0.10, 0.10 } },
            },
          },
        },

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 16,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- special tweaks
        ["showInterrupts"] = true,
        ["showDispells"] = true,
        ["showPartyKills"] = true,
        ["showBuffs"] = true,
        ["showDebuffs"] = true,
        ["showLowManaHealth"] = true,
        ["showCombatState"] = true,
        ["showRepChanges"] = true,
        ["showHonorGains"] = true,
      },

      outgoing = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "bottom",
        ["alpha"] = 100,
        ["megaDamage"] = true,

        -- position
        ["X"] = 400,
        ["Y"] = 0,
        ["Width"] = 164,
        ["Height"] = 512,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 18,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "RIGHT",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ['melee']         = { enabled = false, desc = L["Auto Attack Damage"], default = { 1.00, 1.00, 1.00 } },
          ['misstypesOut']  = { enabled = false, desc = L["Missed Attacks"],     default = { 0.50, 0.50, 0.50 } },
          ['shieldOut']     = { enabled = false, desc = L["Absorbs"],            default = { 0.60, 0.65, 1.00 } },

          ['healing'] = {
            enabled = false, desc = L["Healing Color Overrides"],
            colors = {
              ['healingOut']         = { enabled = false, desc = L["Healing"],            default = { 0.10, 0.75, 0.10 } },
              ['healingOutCritical'] = { enabled = false, desc = L["Healing (Critical)"], default = { 0.10, 1.00, 0.10 } },
              ['healingOutPeriodic'] = { enabled = false, desc = L["Healing (Periodic)"], default = { 0.10, 0.50, 0.10 } },
            }
          },
        },

        -- name formatting
        names = {
          -- appearance
          ["namePrefix"] = " |cffFFFFFF<|r",
          ["namePostfix"] = "|cffFFFFFF>|r",

          -- events from a player's character
          PLAYER = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 0,

            ["enableNameColor"] = true,
            ["removeRealmName"] = true,
            ["enableCustomNameColor"] = false,
            ["customNameColor"] = { 1, 1, 1 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from a npc
          NPC = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 0,

            ["enableNameColor"] = true,             -- Always On (Not in Options)
            ["removeRealmName"] = false,            -- Always Off (Not in Options)
            ["enableCustomNameColor"] = true,       -- Always On (Not in Options)
            ["customNameColor"] = { .3, 0, .3 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from the envirornment
          ENVIRONMENT = {
            ["nameType"] = 0,
          }
        },

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 16,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- special tweaks
        ["enableAutoAttack_Outgoing"] = true, -- OLD: enableAutoAttack
        ["enablePetAutoAttack_Outgoing"] = true,

        ["enableOutDmg"] = true,
        ["enableOutHeal"] = true,
        ["enableOutAbsorbs"] = true,
        ["enablePetDmg"] = true,
        ["enableVehicleDmg"] = true,
        ["enableDotDmg"] = true,
        ["enableHots"] = true,
        ["enableImmunes"] = true,
        ["enableMisses"] = true,
        ["enablePartialMisses"] = false,
        ["showHighestPartialMiss"] = false,
        ["enableKillCommand"] = false,

        ["enableOverhealing"] = true,
        ["enableOverhealingFormat"] = false,
        ["enableOverhealingSubtraction"] = false,
        ["overhealingPrefix"] = " |cffFFFFFF(O: ",
        ["overhealingPostfix"] = ")|r",
      },

      critical = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "bottom",
        ["alpha"] = 100,
        ["megaDamage"] = true,

        -- position
        ["X"] = 192,
        ["Y"] = 0,
        ["Width"] = 256,
        ["Height"] = 140,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 24,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "RIGHT",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ['meleeCrit']  = { enabled = false, desc = L["Auto Attack Damage (Critical)"], default = { 1.00, 1.00, 0.00 } },
        },

        -- name formatting
        names = {

          -- appearance
          ["namePrefix"] = " |cffFFFFFF<|r",
          ["namePostfix"] = "|cffFFFFFF>|r",

          -- events from a player's character
          PLAYER = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 0,

            ["enableNameColor"] = true,
            ["removeRealmName"] = true,
            ["enableCustomNameColor"] = false,
            ["customNameColor"] = { 1, 1, 1 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from a npc
          NPC = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 0,

            ["enableNameColor"] = true,             -- Always On (Not in Options)
            ["removeRealmName"] = false,            -- Always Off (Not in Options)
            ["enableCustomNameColor"] = true,       -- Always On (Not in Options)
            ["customNameColor"] = { .3, 0, .3 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from the envirornment
          ENVIRONMENT = {
            ["nameType"] = 0, -- NOT SHOWN
          }
        },

        -- critical appearance
        ["critPrefix"] = "|cffFF0000*|r",
        ["critPostfix"] = "|cffFF0000*|r",

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 16,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- special tweaks
        ["enableAutoAttack_Critical"] = true, -- OLD: showSwing
        ["prefixAutoAttack_Critical"] = true, -- OLD: prefixSwing
        ["petCrits"] = false,
      },

      damage = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "top",
        ["alpha"] = 100,
        ["megaDamage"] = true,

        -- position
        ["X"] = -288,
        ["Y"] = -80,
        ["Width"] = 448,
        ["Height"] = 160,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 18,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "LEFT",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ['damageTaken']               = { enabled = false, desc = L["Physical Damage"],          default = { 0.75, 0.10, 0.10 } },
          ['damageTakenCritical']       = { enabled = false, desc = L["Critical Physical Damage"], default = { 1.00, 0.10, 0.10 } },
          ['spellDamageTaken']          = { enabled = false, desc = L["Spell Damage"],             default = { 0.75, 0.30, 0.85 } },
          ['spellDamageTakenCritical']  = { enabled = false, desc = L["Critical Spell Damage"],    default = { 0.75, 0.30, 0.85 } },

          ['missTypesTaken'] = {
            enabled = false, desc = L["Miss Types"],
            colors = {
              ['missTypeMiss']    = { enabled = false, desc = MISS,   default = { 0.50, 0.50, 0.50 } },
              ['missTypeDodge']   = { enabled = false, desc = DODGE,   default = { 0.50, 0.50, 0.50 } },
              ['missTypeParry']   = { enabled = false, desc = PARRY,    default = { 0.50, 0.50, 0.50 } },
              ['missTypeEvade']   = { enabled = false, desc = EVADE,    default = { 0.50, 0.50, 0.50 } },
              ['missTypeDeflect'] = { enabled = false, desc = DEFLECT,  default = { 0.50, 0.50, 0.50 } },
              ['missTypeImmune']  = { enabled = false, desc = IMMUNE,   default = { 0.50, 0.50, 0.50 } },
              ['missTypeReflect'] = { enabled = false, desc = REFLECT,  default = { 0.50, 0.50, 0.50 } },
              ['missTypeResist']  = { enabled = false, desc = RESIST, default = { 0.50, 0.50, 0.50 } },
              ['missTypeBlock']   = { enabled = false, desc = BLOCK,  default = { 0.50, 0.50, 0.50 } },
              ['missTypeAbsorb']  = { enabled = false, desc = ABSORB,  default = { 0.50, 0.50, 0.50 } },
            },
          },

          ['missTypesTakenPartial'] = {
            enabled = false, desc = L["Miss Types |cff798BDD(Partials)|r"],
            colors = {
              ['missTypeResistPartial']  = { enabled = false, desc = L["Resisted |cff798BDD(Partial)|r"], default = { 0.75, 0.50, 0.50 } },
              ['missTypeBlockPartial']   = { enabled = false, desc = L["Blocked |cff798BDD(Partial)|r"],  default = { 0.75, 0.50, 0.50 } },
              ['missTypeAbsorbPartial']  = { enabled = false, desc = L["Asorbed |cff798BDD(Partial)|r"],  default = { 0.75, 0.50, 0.50 } },
            },
          },
        },

        -- critical appearance
        ["critPrefix"] = "|cffFF0000*|r",
        ["critPostfix"] = "|cffFF0000*|r",

        -- name formatting
        names = {

          -- appearance
          ["namePrefix"] = " |cffFFFFFF<|r",
          ["namePostfix"] = "|cffFFFFFF>|r",

          -- events from a player's character
          PLAYER = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 2,

            ["enableNameColor"] = true,
            ["removeRealmName"] = true,
            ["enableCustomNameColor"] = false,
            ["customNameColor"] = { 1, 1, 1 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from a npc
          NPC = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 2,

            ["enableNameColor"] = true,             -- Always On (Not in Options)
            ["removeRealmName"] = false,            -- Always Off (Not in Options)
            ["enableCustomNameColor"] = true,       -- Always On (Not in Options)
            ["customNameColor"] = { .3, 0, .3 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from the envirornment
          ENVIRONMENT = {
            -- Name Types:
            --   0 = None
            --   1 = Environment
            --   2 = Environment Type
            --   3 = Both ("Environment - Environment Type")
            --   4 = Both ("Environment Type - Environment")
            ["nameType"] = 2,

            ["enableNameColor"] = true,
            ["enableCustomNameColor"] = true,
            ["removeRealmName"] = false,            -- Always Off (Not in Options)
            ["customNameColor"] = { 0.32, 0.317, 0.1 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          }
        },

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 14,
        ["iconsEnabledAutoAttack"] = true,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- Special Tweaks
        ["showDodgeParryMiss"] = true,
        ["showDamageReduction"] = true,
      },

      healing = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "bottom",
        ["alpha"] = 100,
        ["megaDamage"] = true,

        -- positioon
        ["X"] = -288,
        ["Y"] = 88,
        ["Width"] = 448,
        ["Height"] = 144,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 18,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "LEFT",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ['shieldTaken']          = { enabled = false, desc = L["Shields"],          default = { 0.60, 0.65, 1.00 } },
          ['healingTaken']         = { enabled = false, desc = L["Healing"],          default = { 0.10, 0.75, 0.10 } },
          ['healingTakenCritical'] = { enabled = false, desc = L["Critical Healing"], default = { 0.10, 1.00, 0.10 } },
          ['healingTakenPeriodic'] = { enabled = false, desc = L["Periodic Healing"], default = { 0.10, 0.50, 0.10 } },
          ['healingTakenPeriodicCritical'] = { enabled = false, desc = L["Critical Periodic Healing"], default = { 0.10, 0.50, 0.10 } },
        },

        -- name formatting
        names = {

          -- appearance
          ["namePrefix"] = " |cffFFFFFF<|r",
          ["namePostfix"] = "|cffFFFFFF>|r",

          -- events from a player's character
          PLAYER = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 1,

            ["enableNameColor"] = true,
            ["removeRealmName"] = true,
            ["enableCustomNameColor"] = false,
            ["customNameColor"] = { 1, 1, 1 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from a npc
          NPC = {
            -- Name Types:
            --   0 = None
            --   1 = Source Name
            --   2 = Spell Name
            --   3 = Both ("Source Name - Spell Name")
            --   4 = Both ("Spell Name - Source Name")
            ["nameType"] = 2,

            ["enableNameColor"] = true,             -- Always On (Not in Options)
            ["removeRealmName"] = false,            -- Always On (Not in Options)
            ["enableCustomNameColor"] = true,       -- Always On (Not in Options)
            ["customNameColor"] = { .3, 0, .3 },

            ["enableSpellColor"] = true,
            ["enableCustomSpellColor"] = false,
            ["customSpellColor"] = { 1, 1, 1 },
          },

          -- events from the envirornment
          ENVIRONMENT = {
            ["nameType"] = 0, -- NOT SHOWN
          }
        },

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 16,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- special tweaks
        ["enableOverHeal"] = true,
        ["hideAbsorbedHeals"] = false,
        ["enableSelfAbsorbs"] = true,
        ["showOnlyMyHeals"] = false,
        ["showOnlyPetHeals"] = false,
      },

      --[[class = {
        ["enabledFrame"] = true,
        ["alpha"] = 100,

        -- position
        ["X"] = 0,
        ["Y"] = 64,
        ["Width"] = 64,
        ["Height"] = 64,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 64,
        ["fontOutline"] = "2OUTLINE",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ['comboPoints']     = { enabled = false, desc = "Combo Points",     default = { 1.00, 0.82, 0.00 } },
          ['comboPointsMax']  = { enabled = false, desc = "Max Combo Points", default = { 0.00, 0.82, 1.00 } },
        },
      },]]

      power = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "bottom",
        ["alpha"] = 100,
        ["megaDamage"] = true,

        -- position
        ["X"] = 0,
        ["Y"] = -16,
        ["Width"] = 128,
        ["Height"] = 96,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 17,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "CENTER",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },

        -- https://github.com/Gethe/wow-ui-source/blob/e337b8949ffad2876ea0489d8331db2414342d32
        -- /AddOns/Blizzard_CombatLog/Blizzard_CombatLog.lua#L1797
        colors = {
          ['color_MANA'] = { enabled = false, desc = MANA, default = {  0.00,  0.00,  1.00 } },
          ['color_RAGE'] = { enabled = false, desc = RAGE, default = {  1.00,  0.00,  0.00 } },
          ['color_FURY'] = { enabled = false, desc = FURY, default = { 0.788, 0.259, 0.992 } },
          ['color_PAIN'] = { enabled = false, desc = PAIN, default = { 1.000, 0.612, 0.000 } },

          ['color_FOCUS']  = { enabled = false, desc = FOCUS,  default = { 1.00, 0.50, 0.25 } },
          ['color_RUNES']  = { enabled = false, desc = RUNES,  default = { 0.50, 0.50, 0.50 } },
          ['color_ENERGY'] = { enabled = false, desc = ENERGY, default = { 1.00, 1.00, 0.00 } },

          ['color_CHI_POWER']            = { enabled = false, desc = CHI_POWER,            default = { 0.71, 1.00, 0.92 } },
          ['color_HOLY_POWER']           = { enabled = false, desc = HOLY_POWER,           default = { 0.95, 0.90, 0.60 } },
          ['color_RUNIC_POWER']          = { enabled = false, desc = RUNIC_POWER,          default = { 0.00, 0.82, 1.00 } },
          ['color_SOUL_SHARDS']          = { enabled = false, desc = SOUL_SHARDS,          default = { 0.50, 0.32, 0.55 } },
          ['color_LUNAR_POWER']          = { enabled = false, desc = LUNAR_POWER,          default = { 0.30, 0.52, 0.90 } },
          ['color_INSANITY_POWER']       = { enabled = false, desc = INSANITY_POWER,       default = { 0.40, 0.00, 0.80 } },
          ['color_MAELSTROM_POWER']      = { enabled = false, desc = MAELSTROM_POWER,      default = { 0.00, 0.50, 1.00 } },
          ['color_ALTERNATE_POWER'] = { enabled = false, desc = ALTERNATE_POWER_TEXT, default = { 0.10, 0.10, 0.98 } },
          ['color_ARCANE_CHARGES_POWER'] = { enabled = false, desc = ARCANE_CHARGES_POWER, default = { 0.10, 0.10, 0.98 } },
        },

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- special tweaks
        ["showEnergyGains"] = true,
        ["showPeriodicEnergyGains"] = true,
        ["showEnergyType"] = true,


        -- Generated from "Blizzard Add-On's/Constants.lua"
        ["disableResource_MANA"]             = false,
        ["disableResource_RAGE"]             = false,
        ["disableResource_FOCUS"]            = false,
        ["disableResource_ENERGY"]           = false,

        ["disableResource_RUNES"]            = true,
        ["disableResource_RUNIC_POWER"]      = false,
        ["disableResource_SOUL_SHARDS"]      = false,
        ["disableResource_LUNAR_POWER"]      = true,

        ["disableResource_CHI_POWER"]        = true,
        ["disableResource_HOLY_POWER"]       = false,
        ["disableResource_INSANITY_POWER"]   = false,
        ["disableResource_MAELSTROM_POWER"]  = true,

        ["disableResource_ARCANE_CHARGES"]   = false,
        ["disableResource_FURY"]             = false,
        ["disableResource_PAIN"]             = false,
      },

      procs = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "top",
        ["alpha"] = 100,

        -- position
        ["X"] = 0,
        ["Y"] = -256,
        ["Width"] = 294,
        ["Height"] = 64,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 24,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "CENTER",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },
        colors = {
          ['spellProc']     = { enabled = false, desc = L["Spell Procs"],    default = { 1.00, 0.82, 0.00 } },
          ['spellReactive'] = { enabled = false, desc = L["Spell Reactive"], default = { 1.00, 0.82, 0.00 } },
        },

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 16,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,
      },

      loot = {
        ["enabledFrame"] = true,
        ["secondaryFrame"] = 0,
        ["insertText"] = "top",
        ["alpha"] = 100,

        -- position
        ["X"] = 0,
        ["Y"] = -352,
        ["Width"] = 512,
        ["Height"] = 128,

        -- fonts
        ["font"] = "Condensed Bold (xCT+)",
        ["fontSize"] = 18,
        ["fontOutline"] = "2OUTLINE",
        ["fontJustify"] = "CENTER",

        -- font shadow
        ["enableFontShadow"] = true,
        ["fontShadowColor"] = { 0, 0, 0, 0.6 },
        ["fontShadowOffsetX"] = 2,
        ["fontShadowOffsetY"] = -2,

        -- font colors
        ["customColor"] = false,
        ["fontColor"] = { 1.00, 1.00, 1.00 },

        -- icons
        ["iconsEnabled"] = true,
        ["iconsSize"] = 16,
        ["spacerIconsEnabled"] = true,

        -- scrollable
        ["enableScrollable"] = false,
        ["scrollableLines"] = 10,
        ["scrollableInCombat"] = false,

        -- fading text
        ["enableCustomFade"] = true,
        ["enableFade"] = true,
        ["fadeTime"] = 0.3,
        ["visibilityTime"] = 5,

        -- special tweaks
        ["showItems"] = true,
        ["showItemTypes"] = true,
        ["showMoney"] = true,
        ["showItemTotal"] = true,
        ["showCrafted"] = true,
        ["showQuest"] = true,
        ["showPurchased"] = false,
        ["colorBlindMoney"] = false,
        ["filterItemQuality"] = 3,
      },
    },

    spells = {
      enableMerger = true,        -- enable/disable spam merger
      enableMergerDebug = false,  -- Shows spell IDs for debugging merged spells
      mergeHealing = false,
      mergeSwings = true,
      mergeRanged = true,
      mergeDispells = true,
      mergePet = false,
      mergeVehicle = true,
      mergePetColor = { 1, 0.5, 0 },
      mergeVehicleColor = { 0, 0.5, 1 },

      -- Only one of these can be true
      mergeDontMergeCriticals = true,
      mergeCriticalsWithOutgoing = false,
      mergeCriticalsByThemselves = false,
      mergeHideMergedCriticals = false,

      -- Abbreviate or Groups Settings
      formatAbbreviate = false,
      formatGroups = true,

      combo = {
        ["DEATHKNIGHT"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["DEMONHUNTER"] = {
          [1] = { },
          [2] = { },
        },

        ["DRUID"] = {
          [1] = { },
          [2] = { },
          [3] = { },
          [4] = { },
        },

        ["HUNTER"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["MAGE"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["MONK"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["PALADIN"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["PRIEST"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["ROGUE"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["SHAMAN"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["WARLOCK"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

        ["WARRIOR"] = {
          [1] = { },
          [2] = { },
          [3] = { },
        },

      },

      -- This gets dynamically generated
      merge = { },

      -- yes this is supposed to be blank :P
      -- it is dynamically generated in core.lua
      items = { },
    },

    spellFilter = {
      ["whitelistBuffs"]    = false,
      ["whitelistDebuffs"]  = false,
      ["whitelistSpells"]   = false,
      ["whitelistProcs"]    = false,
      ["whitelistItems"]    = false,
      ["whitelistDamage"]   = false,
      ["whitelistHealing"]  = false,
      ["trackSpells"]       = true,

      listBuffs    = { },  -- Used to filter gains/fades of buffs    (Spell Name)
      listDebuffs  = { },  -- Used to filter gains/fades of debuffs  (Spell Name)
      listSpells   = { },  -- Used to filter outgoing spells         (Spell ID)
      listProcs    = { },  -- Used to filter spell procs             (Proc Name)
      listItems    = { },  -- Used to filter Items                   (Item ID)
      listDamage   = { },  -- Used to filter incoming damage         (Spell ID)
      listHealing    = { },  -- Used to filter incoming healing        (Spell ID)

      -- Minimal Spell Amount
      filterPowerValue = 0,

      filterOutgoingDamageValue = 0,
      filterOutgoingDamageCritEnabled = false,
      filterOutgoingDamageCritValue = 0,

      filterOutgoingHealingValue = 0,
      filterOutgoingHealingCritEnabled = false,
      filterOutgoingHealingCritValue = 0,

      filterIncomingDamageValue = 0,
      filterIncomingDamageCritEnabled = false,
      filterIncomingDamageCritValue = 0,

      filterIncomingHealingValue = 0,
      filterIncomingHealingCritEnabled = false,
      filterIncomingHealingCritValue = 0,

    },
  },
}