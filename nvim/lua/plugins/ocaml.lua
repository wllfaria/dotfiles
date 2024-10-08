return {
  "tjdevries/ocaml.nvim",
  enabled = false,
  config = function()
    require("ocaml").setup()
    vim.keymap.set(
      "n",
      "<leader>out",
      require("ocaml.actions").update_interface_type,
      { desc = "[O]caml [U]pdate [T]ype" }
    )
  end,
}
