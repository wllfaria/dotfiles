local radium = require("colors.radium")

--- @alias HexColor string

--- @class Theme
--- @field groups function
--- @field colors table<string, HexColor>

--- @class Colors
--- @field current_theme string
--- @field themes table<string, Theme>
local Colors = {
    current_theme = "radium",
    transparent = true,
    themes = {
        radium = radium,
    }
}

local theme = Colors.themes[Colors.current_theme]
local groups = theme.groups(Colors.transparent)
local colors = theme.colors

vim.cmd.hi("clear")
vim.o.termguicolors = true
vim.g.colors_name = Colors.current_theme

for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
end

--- Returns the table of colors from the current theme
---
--- @return table<string, HexColor>
Colors.current_theme_colors = function()
    return colors
end

return Colors
