require("custom.telescope.init")
require("custom.termdebug")

vim.cmd("packadd termdebug")

vim.opt.laststatus = 3
vim.opt.statusline = "%{%v:lua.require('custom.statusline').left()%} %= %{%v:lua.require('custom.statusline').right()%}"

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.aya",
  callback = function() vim.bo.filetype = "asm" end,
})
