local function comment_as_boolean()
  local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
  vim.api.nvim_set_hl(0, 'Comment', { fg = bools.fg, bg = bools.bg })
  local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
  vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = marked.fg, bg = marked.bg, bold = true })
end

return {
  {
    'wincent/base16-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.o.background = 'dark'
      -- vim.cmd.colorscheme 'base16-gruvbox-dark-hard'
      -- comment_as_boolean()
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      require('kanagawa').setup {
        background = { dark = 'dragon', light = 'lotus' },
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_dim },
            TelescopePromptBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
            TelescopeResultsBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
      }
      vim.cmd.colorscheme 'kanagawa'
      comment_as_boolean()
    end,
  },
}
