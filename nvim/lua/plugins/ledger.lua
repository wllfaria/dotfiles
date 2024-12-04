return {
  dir = "/Users/wiru/code/ledger.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function() require("ledger").setup({}) end,
}
