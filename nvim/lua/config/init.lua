require 'config.opts'
require 'config.keys'
require 'config.lazy'
require 'config.globals'

-- setting up debugger
vim.cmd 'packadd termdebug'
vim.g.termdebug_wide = 1

vim.cmd 'autocmd User TermdebugStartPre let g:TermDebugging = 1'
vim.cmd 'autocmd User TermdebugStopPost let g:TermDebugging = 0'
