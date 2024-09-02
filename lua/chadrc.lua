-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "one_light",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
  cmp = {
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },
  nvdash = {
    load_on_startup = true,
  }
}

return M
