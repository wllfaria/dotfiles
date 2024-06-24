return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
  end,
}

