vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("big_file", { clear = true }),
  desc = "Disable features in big files",
  pattern = "bigfile",
  callback = function(args)
    vim.schedule(function() vim.bo[args.buf].syntax = vim.filetype.match({ buf = args.buf }) or "" end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  desc = "Close with <q>",
  pattern = {
    "git",
    "help",
    "man",
    "qf",
    "scratch",
  },
  callback = function(args) vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf }) end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank_highlight", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    -- Setting a priority higher than the LSP references one.
    vim.hl.on_yank({ priority = 250 })
  end,
})
