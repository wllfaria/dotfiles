vim.api.nvim_create_autocmd("FileType", {
  pattern = "moonbit",
  callback = function() vim.cmd("TSEnable highlight") end,
})
