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
      -- vim.cmd.colorscheme 'base16-rose-pine'
      -- comment_as_boolean()
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        background = { dark = 'wave', light = 'lotus' },
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
            EndOfBuffer = { fg = theme.ui.whitespace },
          }
        end,
      }
      -- vim.o.background = 'dark'
      -- vim.cmd.colorscheme 'kanagawa-dragon'
      -- comment_as_boolean()
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {}
      vim.cmd.colorscheme 'rose-pine'
      comment_as_boolean()
    end,
  },
}
