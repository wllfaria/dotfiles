return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "BufRead",
  version = false,
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua",
      "typescript",
      "javascript",
      "rust",
      "markdown",
      "vimdoc",
      "markdown_inline",
      "ocaml",
      "json",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
