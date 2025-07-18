return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "astro",
      "eslint",
      "gopls",
      "tailwind",
      "ts_ls",
      "ruff",
      "basedpyright",
      "zls",
      "clangd",
      "jsonls",
      -- "aml_ls",
      "lua_ls",
      "rust_analyzer",
    })
  end,
}
