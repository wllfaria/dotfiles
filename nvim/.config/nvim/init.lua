require 'config'
require 'custom'
-- require("colors").setup()

vim.opt.laststatus = 3
vim.opt.statusline =
  "%{%v:lua.require('custom.statusline').left()%}%=%{%v:lua.require('custom.statusline').center()%} %{%v:lua.require('custom.statusline').right()%}"
