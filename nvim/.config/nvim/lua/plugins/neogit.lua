return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        require('neogit').setup({})

        vim.keymap.set("n", "<leader>gs", "<cmd>Neogit kind=split<CR>")
    end
}
