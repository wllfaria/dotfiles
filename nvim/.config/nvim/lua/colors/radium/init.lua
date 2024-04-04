local plugin_groups = require("colors.radium.plugins")
local palette = require("colors.radium.palette")

-- " Radium
-- " A radioactive colorscheme.
-- " Authored by: https://github.com/dharmx
-- " License: GPL-3.0
--
-- " GNU GENERAL PUBLIC LICENSE
-- " Version 3, 29 June 2007
-- "
-- " Permissions of this strong copyleft license are conditioned on
-- " making available complete source code of licensed works and
-- " modifications, which include larger works using a licensed work,
-- " under the same license. Copyright and license notices must be
-- " preserved. Contributors provide an express grant of patent rights.
-- "
-- " Read the complete license here: https://www.gnu.org/licenses/gpl-3.0.en.html

local Radium = {}
Radium.__index = Radium

local instance = nil

function Radium:new()
	if instance == nil then
		instance = setmetatable({
			config = {},
			name = "radium",
			palette = palette,
			term_colors = {
				palette.default.bg,
				palette.default.red,
				palette.default.green,
				palette.default.yellow,
				palette.default.blue,
				palette.default.magenta,
				palette.default.cyan,
				palette.default.bg1,
				palette.default.grey,
				palette.default.red_bright,
				palette.default.green_bright,
				palette.default.yellow_bright,
				palette.default.blue_bright,
				palette.default.magenta_bright,
				palette.default.cyan_bright,
				palette.default.white,
			},
		}, Radium)
	end
	return instance
end

function Radium:get_groups(config)
	local groups = plugin_groups:with_config(config)
	self.groups = groups
	return groups
end

function Radium:get_termcolors()
	return self.term_colors
end

function Radium.setup(config)
	local radium = Radium:new()
	radium.config = vim.tbl_deep_extend("force", radium.config, config or {})
end

Radium.load = function()
	local radium = Radium:new()
	print("config", vim.inspect(radium.config))
	radium:get_groups(radium.config)

	vim.cmd.hi("clear")
	vim.o.termguicolors = true
	vim.g.colors_name = Radium.name

	for group, settings in pairs(radium.groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	for index, value in ipairs(radium.term_colors) do
		vim.g["terminal_color_" .. index - 1] = value
	end
end

return Radium
