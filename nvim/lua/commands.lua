vim.g.autoformat = true

vim.api.nvim_create_user_command(
  "ToggleFormat",
  function() vim.g.autoformat = not vim.g.autoformat end,
  { desc = "Toggle conform.nvim auto-formatting", nargs = 0 }
)

vim.api.nvim_create_user_command("ToggleInlayHints", function()
  vim.g.inlay_hints = not vim.g.inlay_hints
  local mode = vim.api.nvim_get_mode().mode
  vim.lsp.inlay_hint.enable(vim.g.inlay_hints and (mode == "n" or mode == "v"))
end, { desc = "Toggle inlay hints", nargs = 0 })
