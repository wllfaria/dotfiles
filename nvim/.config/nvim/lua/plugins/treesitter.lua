return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ignore_install = {},
            modules = {},
            auto_install = true,
            ensure_installed = {
                "lua",
                "typescript",
                "javascript",
                "rust",
                "markdown",
                "vimdoc",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
