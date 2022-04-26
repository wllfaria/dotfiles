"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set expandtab
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
autocmd!
scriptencoding utf-8
set t_Co=256
if !1 | finish | endif
set nocompatible
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set shell=fish
set backupskip=/tmp/*,/private/tmp/*
set inccommand=split
set t_BE=
set nosc noru nosm
set lazyredraw
set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*
autocmd InsertLeave * set nopaste
set formatoptions+=r
set cursorline
syntax enable
set winblend=0
set wildoptions=pum
set pumblend=5


"--------------------------------------------------------------------------
" Maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
inoremap jk <ESC>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Quicker switching between windows
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Quicker way to split windows
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Better way to deal with tabs
nmap te :tabedit
nmap <leader><S-Tab> :tabprev<Return>
nmap <leader><Tab> :tabnext<Return>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv
nmap <leader>2 :call coc#config('diagnostic.messageTarget', 'float')<CR>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Select all
nmap <C-a> gg<S-v>G

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir)

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/colorize.vim
source ~/.config/nvim/plugins/purify.vim
source ~/.config/nvim/plugins/nightfox.vim

call plug#end()

if exists("&termguicolors") && exists("&winblend")
  let g:neosolarized_termtrans=1
  " runtime ./colors/NeoSolarized.vim
  " runtime ./colors/Gruvbox.vim
  runtime ./colors/base16-default-dark.vim
  colorscheme base16-default-dark
endif
