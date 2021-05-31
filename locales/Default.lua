--[[ ==========================================================================
	© Feyawen Ariana 2007-2015
		If you use my code, please give me credit.
		
		
	Default Language
	
	Any language specific text that appears in the Add-on can be accessed
	using L[""].  Languages that are not the Default language of the Add-on
	will need a lookup table for that language.
========================================================================== ]]--
local _, addon = ...


--[[
	Initialize the language table and define a default function that will
	return the same text unless otherwise overridden by a language
	specific table.
]]--
addon.L = {}
local L = addon.L
local function defaultFunc(L, key) return key end
setmetatable(L, {__index=defaultFunc})





