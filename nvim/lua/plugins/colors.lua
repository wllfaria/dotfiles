local function set_colorscheme()
  vim.o.background = 'dark'
  local current = 'kanagawa-dragon'
  vim.cmd.colorscheme(current)
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function() set_colorscheme() end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {
        overrides = function(colors)
          local theme = colors.theme
          return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        background = {
          dark = 'dragon',
          light = 'lotus',
        },
        transparent = false,
      }
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup {}
      set_colorscheme()
    end,
  },
}
