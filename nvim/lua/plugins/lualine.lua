return {
  'nvim-lualine/lualine.nvim',
  enabled = false,
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
      },
      extensions = {
        'quickfix',
        'mason',
      },
    }
  end,
}
