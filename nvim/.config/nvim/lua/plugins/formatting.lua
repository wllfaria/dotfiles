return {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "markdownlint" },
                css = { "prettier" },
                scss = { "prettier" },
                lua = { "stylua" },
                s = { "asmfmt" },
                asm = { "asmfmt" },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>cf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end)
    end,
}
