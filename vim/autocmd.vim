augroup globals
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 50 })

  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

