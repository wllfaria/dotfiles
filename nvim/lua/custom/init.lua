require("custom.telescope.init")
require("custom.termdebug")
require("custom.lazygit")
require("custom.tokei")

vim.cmd("packadd termdebug")

vim.opt.laststatus = 3
vim.opt.statusline = "%{%v:lua.require('custom.statusline').left()%} %= %{%v:lua.require('custom.statusline').right()%}"
