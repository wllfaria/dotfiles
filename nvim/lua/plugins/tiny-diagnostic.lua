return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    local tiny_diag = require("tiny-inline-diagnostic")
    tiny_diag.setup({ preset = "simple" })
    vim.diagnostic.config({ virtual_text = false })

    tiny_diag.disable()

    vim.keymap.set("n", "<leader>td", function()
      require("tiny-inline-diagnostic").toggle()
    end)
  end,
}
