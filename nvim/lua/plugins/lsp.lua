return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "astro",
      "eslint",
      "tailwind",
      "lua_ls",
      "rust_analyzer",
      "gopls",
      "ts_ls",
    })
  end,
}
