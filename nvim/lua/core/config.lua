vim.opt.confirm = true
vim.opt.mouse = "a"
vim.opt.cursorline = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.colorcolumn = "80"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.ignorecase = true
vim.opt.joinspaces = false
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.pumblend = 17
vim.opt.smoothscroll = true
vim.opt.fillchars = { eob = "~" }
