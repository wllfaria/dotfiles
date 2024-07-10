return {
  'williamboman/mason.nvim',
  enabled = false,
  event = { 'InsertEnter', 'BufRead', 'BufNewFile', 'InsertLeave', 'BufWritePost' },
  dependencies = { 'neovim/nvim-lspconfig', 'folke/neodev.nvim', 'L3MON4D3/LuaSnip' },
  config = function()
    local mason = require 'mason'
    local lspconfig = require 'lspconfig'
    -- local lsp_defaults = lspconfig.util.default_config
    local neodev = require 'neodev'

    -- local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- lsp_defaults.capabilities = vim.tbl_deep_extend('force', lsp_defaults.capabilities, cmp_capabilities)

    neodev.setup {}
    mason.setup {}

    lspconfig.rust_analyzer.setup {
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = 'clippy',
            extraArgs = { '--tests' },
            features = 'all',
          },
        },
      },
    }

    lspconfig.lua_ls.setup {}
    lspconfig.gopls.setup {}

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end)
    vim.keymap.set('n', '<leader>dn', function() vim.lsp.diagnostic.goto_next() end)
    vim.keymap.set('n', '<leader>dN', function() vim.lsp.diagnostic.goto_prev() end)
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format() end)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end)

    vim.keymap.set(
      'n',
      '<leader>i',
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }) end
    )
  end,
}
