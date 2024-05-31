" general options
set autoread
set backspace=indent,eol,start
set noswapfile
set ttimeoutlen=10
set matchpairs+=<:>
set showmatch
set matchtime=42069
set undodir=~/.vim/undo
set undofile
set formatoptions=crqnjp
syntax on
filetype plugin indent on
syntax enable
set t_Co=16
let g:javascript_plugin_jsdoc = 1
execute pathogen#infect()

set autoindent
set breakindent
set breakindentopt=shift:3,list:3
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

set complete=.,w,b
set completeopt=menu,menuone
set pumheight=12
set pumwidth=20
set wildchar=<C-n>
set wildmenu
set wildoptions=fuzzy,pum

set colorcolumn=101
set confirm
set fillchars=fold:\ ,foldopen:v,foldclose:>
set foldmethod=indent
set foldlevel=99
set guicursor=a:block,v-r-cr-o:hor20,i:ver20
set laststatus=2
set menuitems=12
set number
set relativenumber
set scrolloff=8
set shortmess=ixstTF
set showcmd
set showcmdloc=statusline
set signcolumn=yes
set splitbelow
set splitright
set termguicolors
set wrap
set whichwrap=b,h,l

" search
set hlsearch
set incsearch
set ignorecase
set wildignorecase
set path=.,**
set grepprg=rg\ --vimgrep\ --ignore-case
set grepformat=%f:%l:%c:%m

command! -nargs=+ Grep silent! grep! <args> | cwindow | redraw!

let g:netrw_banner = 0

" colorscheme
colorscheme industry

" space outside of insert mode is silly
map <space> <nop>

" netrw
nnoremap - :Explore<cr>

" don't yank single characters
nnoremap x "_x

" this should be the default
nnoremap U <c-r>

" this should also be the default
nnoremap Y y$

" clear search highlights
nnoremap <silent> <esc> <esc><cmd>nohlsearch<cr>

" stay in visual mode when [in|de]denting text
xnoremap < <gv
xnoremap > >gv

" move lines around in visual mode
xnoremap <silent> J :m '>+1<cr>gv=gv
xnoremap <silent> K :m '<-2<cr>gv=gv

" quickfix list
nnoremap <c-q> :copen<cr>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>

" location list
nnoremap <c-l> :lopen<cr>
nnoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>
nnoremap [L :lfirst<cr>
nnoremap ]L :llast<cr>

" buffer list
nnoremap <c-b> :buffers<cr>:b 
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>
nnoremap [B :bfirst<cr>
nnoremap ]B :blast<cr>

" resize windows
nnoremap <c-s-k> :resize +2<cr>
nnoremap <c-s-j> :resize -2<cr>
nnoremap <c-s-l> :vertical resize -2<cr>
nnoremap <c-s-h> :vertical resize +2<cr>

" sane terminal keymaps
tnoremap <c-]> <c-\><c-n>
tnoremap <c-space> <space>
tnoremap <s-space> <space>
tnoremap <c-bs> <c-w>
tnoremap <s-bs> <bs>
tnoremap <c-cr> <cr>
tnoremap <s-cr> <cr>
