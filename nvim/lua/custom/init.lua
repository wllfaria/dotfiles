require 'custom.fzf_lua'
require 'custom.termdebug'
require 'custom.lazygit'
local notes = require 'custom.notes'

notes.set_commands_and_keymaps()

vim.opt.laststatus = 3
vim.opt.statusline = "%{%v:lua.require('custom.statusline').left()%} %= %{%v:lua.require('custom.statusline').right()%}"

