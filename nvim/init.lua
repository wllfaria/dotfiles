require("keymaps")
require("autocmds")
require("options")
require("commands")
require("statusline")
require("termdebug")
require("hide_env")

vim.opt.laststatus = 3

function Statusline()
  local ok, branch = pcall(vim.fn.FugitiveHead)
  if not ok then return "" end

  if branch and #branch > 0 then branch = "  " .. branch end

  return branch .. " %f%m%=%l:%c"
end

vim.opt.statusline = "%!luaeval('Statusline()')"

vim.diagnostic.config({
  ---@diagnostic disable-next-line: assign-type-mismatch
  float = { border = { " " } },
  virtual_text = false,
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or { " " }
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

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

local pacman = require("pacman")
vim.pack.add(pacman.sources())
pacman.setup()

vim.cmd("colorscheme vague")
