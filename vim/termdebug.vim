packadd termdebug

let current_os = system('uname')
let current_os = substitute(current_os, '\n', '', 'g')

if current_os == 'Linux'
  let g:termdebugger = 'gdb'
elseif current_os == 'Darwin'
  let g:termdebugger = 'lldb'
endif

function! DebugInTab()
  let path = input('path: ', '', 'file')
  execute 'Termdebug ' . path
  execute 'Program'
  let buf = bufnr('%')
  tabnew
  execute 'buffer' buf
  tabprevious
  execute 'Program'
  wincmd c
endfunction

command! DebugInTab call DebugInTab()

nnoremap <leader>dt :DebugInTab<CR>
nnoremap <leader>dD :Debug<CR>
nnoremap <leader>db :Break<CR>
nnoremap <leader>do :Over<CR>
nnoremap <leader>ds :Step<CR>
nnoremap <leader>dS :Stop<CR>
