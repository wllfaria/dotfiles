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
            vim.g.adwaita_darker = false
            vim.g.adwaita_disable_cursorline = true
            vim.g.adwaita_transparent = true
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
                background = {       -- map the value of 'background' option to a theme
                    dark = "dragon", -- try "dragon" !
                    light = "lotus",
                },
                transparent = true,
            })

            -- vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({
                options = {
                    transparent = true
                }
            })
            -- vim.cmd.colorscheme("github_dark")
        end,
    },
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            require("tokyodark").setup({
                transparent_background = true
            })
            -- vim.cmd.colorscheme("tokyodark")
        end,
    }
}
