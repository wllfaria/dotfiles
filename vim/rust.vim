let current_os = system('uname')
let current_os = substitute(current_os, '\n', '', 'g')

let current_os == 'Linux'
    let g:termdebugger = 'rust-gdb'
elseif current_os == 'Darwin'
    let g:termdebugger = 'rust-lldb'
endif

function! RunCargoCheck()
  echomsg 'cargo check...'
  silent! make! check
  redraw!

  let qflist = getqflist()
  let error_count = 0
  let warning_count = 0

  if len(qflist) > 0
    let collect_err = 0
    let new_qf_list = []

    for entry in qflist
      if entry.type ==# 'W' && entry.text !~ '.*generated\s\d*\swarning'
        let warning_count += 1
        let collect_err = 0
      endif

      if entry.type ==# 'E'
        let collect_err = 1
        let error_count += 1
      endif

      if collect_err == 1
        call add(new_qf_list, entry)
      endif
    endfor

    call setqflist(new_qf_list)
  endif

  if error_count > 0
    if tabpagewinnr(tabpagenr(), '$') > 1
      botright copen 6
    else
      copen 6
    endif
    wincmd p
    cfirst
  else
    cclose
  endif

  let err_out = "echo 'E: " . error_count . "'"
  if error_count > 0
    let err_out = "echohl ToggleRustErr | echo 'E: " . error_count . "' | echohl None"
  endif

  let warn_out = " | echon ' | W: " . warning_count . "'"
  if warning_count > 0
    let warn_out = "| echon ' | ' | echohl ToggleRustWarn | echon 'W: " . warning_count . "' | echohl None"
  endif

  execute err_out . warn_out
endfunction

command! CheckRust call RunCargoCheck()

nnoremap <C-X> :CheckRust<CR>
