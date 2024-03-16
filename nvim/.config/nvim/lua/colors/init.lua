local radium = require("colors.radium")
local lucky = require("colors.lucky")

--- @alias ThemeStyle vim.api.keyset.highlight
--- @alias ThemeGroup table<string, ThemeStyle>
--- @alias HexColor string

--- @class ThemeConfig
--- @field theme string
--- @field variant string
--- @field transparent boolean
local config = {
	theme = "radium",
	variant = "default",
	transparent = false,
}

local themes = {
	radium = radium,
	lucky = lucky,
}

local theme = themes[config.theme]

local groups = theme:get_groups(config)

vim.cmd.hi("clear")
vim.o.termguicolors = true
vim.g.colors_name = config.theme

for group, settings in pairs(groups) do
	vim.api.nvim_set_hl(0, group, settings)
end

for index, value in ipairs(theme.term_colors) do
	vim.g["terminal_color_" .. index - 1] = value
end

return config
