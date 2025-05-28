return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "eslint",
      "lua_ls",
      "rust_analyzer",
      "gopls",
      "ts_ls",
      "ruff",
      "basedpyright",
      "svelte",
    })
  end,
}
