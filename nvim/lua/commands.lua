vim.g.autoformat = true

vim.api.nvim_create_user_command("ToggleFormat", function()
  vim.g.autoformat = not vim.g.autoformat
end, { desc = "Toggle conform.nvim auto-formatting", nargs = 0 })
