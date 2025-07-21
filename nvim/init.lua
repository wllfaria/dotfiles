require("keymaps")
require("autocmds")
require("options")
require("commands")
require("lsp")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" } },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
  change_detection = { notify = false },
})

vim.opt.laststatus = 3
function Statusline()
  local ok, branch = pcall(vim.fn.FugitiveHead)
  if not ok then
    return ""
  end
  if branch and #branch > 0 then
    branch = "  " .. branch
  end
  return branch .. " %f%m%=%l:%c"
end

vim.opt.statusline = "%!luaeval('Statusline()')"

vim.diagnostic.config({
  ---@diagnostic disable-next-line: assign-type-mismatch
  float = { border = "rounded" },
  virtual_text = false,
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
