return {
  "dmmulroy/tsc.nvim",
  event = "VeryLazy",
  lazy = true,
  ft = { "typescript", "typescriptreact", "astro" },
  config = function()
    require("tsc").setup({})
    vim.keymap.set("n", "<leader>tsc", function() vim.cmd(":TSC") end)
  end,
}
