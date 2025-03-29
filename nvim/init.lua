require("config")
require("custom")

vim.diagnostic.config({
  float = { border = "rounded" },
  virtual_text = true,
})

vim.lsp.enable({
  "eslint",
  "luals",
  "rust_analyzer",
  "gopls",
  "tsls",
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
