require 'custom.rust.rust_check'
require 'custom.rust.rust_debugger'
local lsp = require 'custom.rust.rust_analyzer'

lsp.setup()

vim.api.nvim_command 'autocmd FileType * setlocal omnifunc=v:lua.vim.lsp.omnifunc'

