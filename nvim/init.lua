require("keymaps")
require("autocmds")
require("options")
require("commands")
require("lsp")

vim.opt.laststatus = 3
vim.opt.statusline = " %f%m%=%l:%c "

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/tjdevries/colorbuddy.nvim" },
  { src = "https://github.com/nikolvs/vim-sunbather" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

vim.cmd("colorscheme gruvbuddy")
