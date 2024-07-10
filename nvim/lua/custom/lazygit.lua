local utils = require 'custom.utils'

local function open_lazygit()
  local win = utils.open_win()

  vim.fn.termopen('lazygit', {
    on_exit = function() vim.api.nvim_win_close(win, true) end,
  })

  vim.cmd.startinsert()
end

vim.api.nvim_create_user_command('LazygitStart', open_lazygit, {})
vim.keymap.set('n', '<leader>gs', function() vim.cmd 'LazygitStart' end)
