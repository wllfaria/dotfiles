return {
  dir = "/Users/wiru/code/ledger.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("ledger").setup({
      keymaps = {
        reports = {
          { key = "<leader>lbl", name = "Balance", command = "ledger --strict -f main.ledger bal" },
          { key = "<leader>lbd", name = "Budget", command = "ledger --strict -f main.ledger budget" },
          { key = "<leader>lbr", name = "Budget", command = "hledger -f main.ledger bal" },
        },
      },
    })
  end,
}
