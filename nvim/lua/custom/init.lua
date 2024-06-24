require 'custom.fzf_lua'
require 'custom.termdebug'
require 'custom.lazygit'

vim.opt.laststatus = 3
vim.opt.statusline = "%{%v:lua.require('custom.statusline').left()%} %= %{%v:lua.require('custom.statusline').right()%}"

