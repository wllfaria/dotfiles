return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        require("neodev").setup({})

        lspconfig.lua_ls.setup({
            settings = {
                Lua = { completion = { callSnippet = "Replace" } },
            },
        })

        lspconfig.rust_analyzer.setup({
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                        extraArgs = { "--tests" },
                        features = "all",
                    },
                    inlayHints = {
                        implicitDrops = {
                            enable = true,
                        },
                    },
                },
            },
        })
    end
}
