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
      }
      vim.cmd.colorscheme 'kanagawa'
      comment_as_boolean()
    end,
  },
}
