return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
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
    })
  end,
}
