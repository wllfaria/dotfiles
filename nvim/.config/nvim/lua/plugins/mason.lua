return {
    "williamboman/mason.nvim",
    event = { "InsertEnter", "BufRead", "BufNewFile", "InsertLeave", "BufWritePost" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "folke/neodev.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lsp_defaults = lspconfig.util.default_config
        local neodev = require("neodev")

        neodev.setup({
            override = function(_, library)
                library.enabled = true
            end,
        })

        lsp_defaults.capabilities =
            vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "rust_analyzer",
                "eslint",
            },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({})
            end,
        })

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
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
                },
            },
        })
    end,
}
