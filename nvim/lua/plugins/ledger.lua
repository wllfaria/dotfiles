return {
  dir = "/Users/wiru/code/ledger.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function() require("ledger").setup({}) end,
}
