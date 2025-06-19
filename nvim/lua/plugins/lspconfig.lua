return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "astro",
      "eslint",
      "lua_ls",
      "rust_analyzer",
      "gopls",
      "tailwind",
      "ts_ls",
      "ruff",
      "basedpyright",
      "svelte",
    })
  end,
}
