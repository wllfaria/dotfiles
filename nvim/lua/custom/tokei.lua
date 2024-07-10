local utils = require 'custom.utils'

local function open_tokei()
  local _ = utils.open_win()

  vim.fn.termopen 'tokei .'

  vim.cmd.startinsert()
end

vim.api.nvim_create_user_command('Tokei', open_tokei, {})
