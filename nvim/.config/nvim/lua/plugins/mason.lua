return {
  'williamboman/mason.nvim',
  event = { 'InsertEnter', 'BufRead', 'BufNewFile', 'InsertLeave', 'BufWritePost' },
  dependencies = { 'neovim/nvim-lspconfig', 'folke/neodev.nvim' },
  config = function()
    local mason = require 'mason'
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig.configs'
    local lsp_defaults = lspconfig.util.default_config
    local neodev = require 'neodev'

    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    lsp_defaults.capabilities = vim.tbl_deep_extend('force', lsp_defaults.capabilities, cmp_capabilities)

    neodev.setup {}
    mason.setup {}

    local lexical_config = {
      filetypes = { 'elixir', 'eelixir', 'heex' },
      cmd = { '/home/wiru/.local/bin/lexical/bin/start_lexical.sh' },
      settings = {},
    }
    if not configs.lexical then
      configs.lexical = {
        default_config = {
          filetypes = lexical_config.filetypes,
          cmd = lexical_config.cmd,
          settings = lexical_config.settings,
          root_dir = function(fname)
            return lspconfig.util.root_pattern('mix.exs', '.git')(fname) or vim.loop.os_homedir()
          end,
        },
      }
    end

    lspconfig.rust_analyzer.setup {
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = 'clippy',
            extraArgs = { '--tests' },
            features = 'all',
          },
          procMacro = {
            ignored = {
              leptos_macro = {
                'component',
                'server',
              },
            },
          },
        },
      },
    }

    lspconfig.tsserver.setup {
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
    }

    lspconfig.lua_ls.setup {}
    lspconfig.gopls.setup {}
    lspconfig.eslint.setup {}
    lspconfig.svelte.setup {}

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end)
    vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next { scope = 'workspace' } end)
    vim.keymap.set('n', '<leader>dN', function() vim.diagnostic.goto_prev { scope = 'workspace' } end)

    vim.keymap.set(
      'n',
      '<leader>i',
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }) end
    )

    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end)
  end,
}
