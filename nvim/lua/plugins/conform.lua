return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  enabled = true,
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "prettierd" },
      astro = { "prettierd" },
      jsonc = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      sql = { "pg_format" },
    },
    format_on_save = function()
      if not vim.g.autoformat then return nil end
      return { timeout_ms = 3000, lsp_format = "fallback" }
    end,
  },
}
