local helpers = require "better-vim-core.helpers"
local nvim_tree_options = require "better-vim-core.file-explorer"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

local function load_theme(table)
  table.lazy = false
  table.priority = 1000
  return table
end

vim.opt.rtp:prepend(lazypath)
local default_plugins = {
  "editorconfig/editorconfig-vim",
  "tpope/vim-sleuth",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup(nvim_tree_options)
    end,
  },
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "better-vim-core.file-finder"
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function()
      return vim.fn.executable "make" == 1
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "better-vim-core.statusline"
    end,
  },
  load_theme({ "catppuccin/nvim", name = "catppuccin" }),
  load_theme({ "Mofiqul/dracula.nvim" }),
  load_theme({ "ayu-theme/ayu-vim" }),
  load_theme({ "drewtempelmeyer/palenight.vim" }),
  load_theme({ "folke/tokyonight.nvim" }),
  load_theme({ "arcticicestudio/nord-vim" }),
  load_theme({ "olimorris/onedarkpro.nvim" }),
  load_theme({ "rose-pine/neovim" }),
  load_theme({ "EdenEast/nightfox.nvim" }),
  "mattn/emmet-vim",
  {
    "akinsho/bufferline.nvim",
    version = "v4.*",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  "folke/which-key.nvim",
  {
    "glepnir/dashboard-nvim",
    config = function()
      require "better-vim-core.ui.dashboard"
    end,
  },
  "norcalli/nvim-colorizer.lua",
  "tpope/vim-sensible",
  "tpope/vim-surround",
  "andymass/vim-matchup",
  { "windwp/nvim-autopairs", opts = {} },
  "yuttie/comfortable-motion.vim",
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      pcall(require("nvim-treesitter.install").update { with_sync = false })
      require "better-vim-core.treesitter"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require "better-vim-core.ui.indent-blankline"
    end,
  },
  "maxmellon/vim-jsx-pretty",
  "jparise/vim-graphql",
  {
    "folke/zen-mode.nvim",
    config = function()
      require "better-vim-core.ui.zen-mode"
    end,
  },
  "stevearc/dressing.nvim",
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
      "folke/neodev.nvim",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require "better-vim-core.cmp"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = helpers.get_config_item { "gitsigns" },
  },
  -- Avoid to close window when you delete a buffer
  "moll/vim-bbye",
}

local custom_plugins = helpers.get_config_item { "plugins" }
local all_plugins = helpers.merge_tables(default_plugins, custom_plugins)

require("lazy").setup({
  spec = all_plugins,
  ui = {
    border = "rounded",
  },
})
