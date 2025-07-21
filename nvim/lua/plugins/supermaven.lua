return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({})
    vim.keymap.set("n", "<leader>ts", "<cmd>SupermavenToggle<cr>")
  end,
}
