local palette = require 'colors.lucky.palette'
local plugin_groups = require 'colors.lucky.plugins'

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

local M = {}
M.name = 'lucky'
M.palette = palette

M.term_colors = {
  M.palette.default.bg,
  M.palette.default.red,
  M.palette.default.green,
  M.palette.default.yellow,
  M.palette.default.blue,
  M.palette.default.purple,
  M.palette.default.teal,
  M.palette.default.bg,
  M.palette.default.bg2,
  M.palette.default.red_bright,
  M.palette.default.green_bright,
  M.palette.default.yellow_bright,
  M.palette.default.blue_bright,
  M.palette.default.purple_bright,
  M.palette.default.teal_bright,
  M.palette.default.white,
}

function M:get_groups(config)
  local groups = plugin_groups:with_config(config)
  M.groups = groups
  return groups
end

M.get_termcolors = function() return M.term_colors end

M.setup = function(config)
  M:get_groups(config)

  vim.cmd.hi 'clear'
  vim.o.termguicolors = true
  vim.g.colors_name = M.name

  for group, settings in pairs(M.groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  for index, value in ipairs(M.term_colors) do
    vim.g['terminal_color_' .. index - 1] = value
  end
end

return M
