local is_transparent = true

if is_transparent then
    vim.opt.fillchars:append({
        horiz = " ",
        horizup = " ",
        horizdown = " ",
        vert = " ",
        vertleft = " ",
        vertright = " ",
        verthoriz = " ",
        eob = " ",
    })
end

return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            local gruvbox = require("gruvbox")
            gruvbox.setup({
                terminal_colors = true,
                contrast = "hard",
                transparent_mode = false,
                -- vim.cmd.colorscheme("gruvbox"),
            })
        end,
    },
    {
        "aktersnurra/no-clown-fiesta.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("no-clown-fiesta")
        end,
    },
    {
        "alexanderbluhm/black.nvim",
        priority = 1000,
        config = function()
            -- require("black").setup({})
            -- vim.cmd.colorscheme("black")
        end,
    },
    {
        "wuelnerdotexe/vim-enfocado",
        priority = 1000,
        config = function()
            -- require("enfocado").setup({})
            -- vim.cmd.colorscheme("enfocado")
        end,
    },
    {
        "dasupradyumna/midnight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("midnight").setup({})
            -- vim.cmd.colorscheme("midnight")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            require("nightfox").setup({})
            -- vim.cmd.colorscheme("carbonfox")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            -- vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.adwaita_darker = true
            vim.g.adwaita_disable_cursorline = true
            vim.g.adwaita_transparent = false
            -- vim.cmd.colorscheme("adwaita")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            },
                        },
                    },
                },

                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                    }
                end,
                background = { -- map the value of 'background' option to a theme
                    dark = "dragon", -- try "dragon" !
                    light = "lotus",
                },
                transparent = false,
            })

            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                variant = "main",
            })
            -- vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({})
            -- vim.cmd.colorscheme("github_dark_default")
        end,
    },
}
