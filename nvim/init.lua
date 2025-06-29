require("keymaps")
require("autocmds")
require("options")
require("commands")
require("statusline")
require("termdebug")
require("hide_env")

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
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.opt.laststatus = 3

function Statusline()
  local ok, branch = pcall(vim.fn.FugitiveHead)
  if not ok then return "" end

  if branch and #branch > 0 then branch = "  " .. branch end

  return branch .. " %f%m%=%l:%c"
end

vim.opt.statusline = "%!luaeval('Statusline()')"
-- vim.opt.statusline = "%{%v:lua.require('statusline').left()%} %= %{%v:lua.require('statusline').right()%}"

vim.diagnostic.config({
  ---@diagnostic disable-next-line: assign-type-mismatch
  float = { border = { " " } },
  virtual_text = true,
})

vim.lsp.enable({
  "astro",
  "eslint",
  "lua_ls",
  "rust_analyzer",
  "gopls",
  "tailwind",
  "ts_ls",
  "ruff",
  "basedpyright",
  "svelte",
  "zls",
  "clangd",
  "roc_ls",
  "jsonls",
  "aml_ls",
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or { " " }
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
