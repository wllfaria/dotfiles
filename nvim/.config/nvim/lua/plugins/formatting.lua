return {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = { lua = { "stylua" } },
            format_on_save = { lsp_fallback = true, timeout_ms = 500 }
        })
    end,
}
