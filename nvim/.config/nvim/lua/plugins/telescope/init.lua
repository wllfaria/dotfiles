return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local extensions = require("plugins.telescope.extensions")
        local pickers = require("plugins.telescope.pickers")
        local mappings = require("plugins.telescope.mappings")
        require("plugins.telescope.git_links")

        require("telescope").setup({
            extensions = extensions,
            pickers = pickers,
            defaults = {
                mappings = mappings,
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--with-filename",
                    "--no-heading",
                    "--line-number",
                    "--column",
                    "--ignore-case",
                    "--hidden",
                },
                file_ignore_patterns = {
                    "%.git/",
                    "shell/zsh%-.*/",
                    "gtk/",
                    "nvim/pack/",
                    "Cargo.lock",
                    "%.snap",
                },
                preview = false,
                layout_config = {
                    bottom_pane = {
                        height = 0.25,
                    },
                    horizontal = {
                        prompt_position = "top",
                    },
                },
                sorting_strategy = "ascending",
            },
        })
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
    end
}
