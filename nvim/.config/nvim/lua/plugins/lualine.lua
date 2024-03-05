return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        local lualine = require "lualine"
        local colours = {
            bg = "#1d202100",
            fg = "#ebdbb2",
            grey = "#a89984",
            green = "#98971a",
            yellow = "#d79921",
            blue = "#458588",
            magenta = "#b16286",
            red = "#cc241d",
            cyan = "#689d6a",
            orange = "#d65d0e",
        }
        lualine.setup {
            options = {
                component_separators = { left = " ", right = " " },
                theme = {
                    normal = {
                        a = { fg = colours.fg, bg = colours.magenta },
                        b = { fg = colours.cyan, bg = colours.bg },
                        c = { fg = colours.fg, bg = colours.bg },
                        x = { fg = colours.fg, bg = colours.bg },
                        y = { fg = colours.magenta, bg = colours.bg },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    insert = {
                        a = { fg = colours.fg, bg = colours.orange },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    visual = {
                        a = { fg = colours.fg, bg = colours.blue },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    command = {
                        a = { fg = colours.fg, bg = colours.red },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    terminal = {
                        a = { fg = colours.orange, bg = colours.bg },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                },
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = { {
                    "mode",
                    fmt = function(mode, _)
                        return string.sub(mode, 1, 1)
                    end
                } },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = "󰝶 ",
                        },
                    },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", symbols = { modified = "  ", readonly = "", unnamed = "" } },
                },
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = colours.green },
                    },
                    { "diff" },
                },
                lualine_y = {
                    { "progress" },
                    { "location", color = { fg = colours.cyan, bg = colours.bg } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date("%X")
                    end,
                },
            },
            extensions = { 'quickfix', 'fugitive', 'fzf', 'trouble', 'mason', 'lazy' },
        }
    end
}
