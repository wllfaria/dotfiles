return {
  theme = {
    name = "gruvbox",
  },
  plugins = {
    "ellisonleao/gruvbox.nvim",
  },
  mappings = {
    leader = " ",
    custom = {},
    by_mode = {
      n = {},
      i = {
        ["jk"] = { "<Esc>", "Exit to normal mode" },
      },
      v = {},
      x = {},
    },
  },
}
