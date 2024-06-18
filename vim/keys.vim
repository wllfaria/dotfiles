tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n>

inoremap jk <Esc>

nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>P "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap Q <nop>

nnoremap <C-A-h> :vertical resize +4<CR>
nnoremap <C-A-j> :resize -4<CR>
nnoremap <C-A-k> :resize +4<CR>
nnoremap <C-A-l> :vertical resize -4<CR>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
xnoremap <leader>d "_d

nnoremap <c-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <leader>mx :!chmod +x %<CR>

nnoremap <Right> :tabnext<CR>
nnoremap <Left> :tabprev<CR>
nnoremap <Up> :tabnew<CR>
nnoremap <Down> :tabclose<CR>

nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>] :cnext<CR>
nnoremap <leader>[ :cprev<CR>
