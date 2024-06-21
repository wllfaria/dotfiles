let current_os = system('uname')
let current_os = substitute(current_os, '\n', '', 'g')

function! RunCargoCheck()
    echo "cargo check..."
    silent make! check
    redraw!

    let qflist = getqflist()
    let l:error_count = 0
    let l:warning_count = 0
    if len(qflist) > 0
        " Check for type W
        " Ignore everything until we get an E
        let l:collect_err = 0
        let l:new_qf_list = []
        for i in qflist 

            " Count number of warnings
            if i.type == "W" && i.text !~ ".*generated\\s\\d*\\swarning"
            " if i.type == "W"
                let l:warning_count += 1
                let l:collect_err = 0
            endif

            " Count errors
            if i.type == "E"
                let l:collect_err = 1
                let l:error_count += 1
            endif

            " Add errors to the new quickfix list
            if l:collect_err 
                call add(new_qf_list, i)
            endif

        endfor

        call setqflist(new_qf_list)

    endif

    " If we have errors then open the quickfix window
    " otherwise display the number of warnings
    if l:error_count > 0
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

    let l:err_out = "echo 'E: " . error_count . "'"
    if l:error_count > 0 
        let l:err_out = "echohl ToggleRustErr | echo 'E: " . error_count . "' | echohl None"
    endif

    let l:warn_out = " | echon ' | W: " . warning_count . "'"
    if l:warning_count > 0 
        let l:warn_out = "| echon ' | ' | echohl ToggleRustWarn | echon 'W: " . warning_count . "' | echohl None"
    endif

    exec err_out . warn_out
endfunction

command! CheckRust call RunCargoCheck()

nnoremap <C-X> :CheckRust<CR>
