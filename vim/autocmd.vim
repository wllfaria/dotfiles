augroup globals
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 50 })

    au BufWritePre *.rs RustFmt
augroup END
