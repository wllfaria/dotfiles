require("colors")
require("config")
require("custom")

vim.opt.laststatus = 3
vim.opt.statusline = "%{%v:lua.require('custom.statusline').left()%} %= %{%v:lua.require('custom.statusline').right()%}"
