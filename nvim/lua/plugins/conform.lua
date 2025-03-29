vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, { desc = "Disable autoformat-on-save" })

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, { desc = "Re-enable autoformat-on-save" })

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  enabled = true,
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
      },
      format_on_save = function(buffer)
        if vim.g.disable_autoformat or vim.b[buffer].disable_autoformat then return end
        return { timeout_ms = 3000, lsp_format = "fallback" }
      end,
    })
  end,
}
