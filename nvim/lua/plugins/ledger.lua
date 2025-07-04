return {
  "wllfaria/ledger.nvim",
  enabled = false,
  config = function()
    require("ledger").setup({
      completion = {
        blink = { enabled = true },
      },
    })
  end,
}
