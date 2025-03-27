require("custom.telescope")
require("custom.termdebug")

vim.cmd("packadd termdebug")

vim.opt.laststatus = 3

function Statusline()
  local ok, branch = pcall(vim.fn.FugitiveHead)
  if not ok then return "" end

  if branch and #branch > 0 then branch = "  " .. branch end

  return branch .. " %f%m%=%l:%c"
end

vim.opt.statusline = "%!luaeval('Statusline()')"
-- vim.opt.statusline = "%{%v:lua.require('custom.statusline').left()%} %= %{%v:lua.require('custom.statusline').right()%}"

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.aya",
  callback = function() vim.bo.filetype = "asm" end,
})
