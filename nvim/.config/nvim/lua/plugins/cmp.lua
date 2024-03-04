return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "NormalFloat:NormalFloat,CursorLine:Visual",
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "NormalFloat:NormalFloat,CursorLine:Visual",
                }),
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
                ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lua" },
                { name = "buffer" },
                { name = "path" },
            },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {})
        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, {})
    end,
}
