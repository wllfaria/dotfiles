local helpers = require "better-vim-core.helpers"
local themeName = helpers.get_config_item { "theme", "name" }

if themeName == "rose-pine" then
  local rose_pine_options = helpers.get_config_item { "theme", "rose_pine" }
  require("rose-pine").setup(rose_pine_options)
end

-- Setting catppuccin color
if themeName == "catppuccin" then
  require("catppuccin").setup {
    flavour = helpers.get_config_item { "theme", "catppuccin_flavour" },
    transparent_background = false,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {},
    color_overrides = {},
    highlight_overrides = {
      all = function(colors)
        return {
          NormalFloat = { bg = colors.none },
        }
      end
    },
  }
end

if themeName == "ayu" then
  vim.cmd('let ayucolor = "' .. helpers.get_config_item { "theme", "ayucolor" } .. '"')
end

if themeName == "nightfox" then
  local nightfox_options = helpers.get_config_item { "theme", "nightfox" }
  require("nightfox").setup(nightfox_options)
end

vim.cmd("colorscheme " .. helpers.get_config_item { "theme", "name" })
