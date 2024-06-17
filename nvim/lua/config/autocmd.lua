local augroup = vim.api.nvim_create_augroup('startup-autocmds', {})

vim.api.nvim_create_autocmd('TermOpen', {
  group = augroup,
  command = 'setlocal nonumber norelativenumber',
  desc = 'remove line numbers from terminal windows',
})

