return {
  "moonbit-community/moonbit.nvim",
  ft = { "moonbit" },
  opts = {
    -- optionally disable the treesitter integration
    treesitter = {
      enabled = true,
      -- Set false to disable automatic installation and updating of parsers.
      auto_install = true,
    },
    lsp = {
      on_attach = function(client, bufnr) end,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    },
  },
}
