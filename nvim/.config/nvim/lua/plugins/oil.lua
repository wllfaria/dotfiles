return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      columns = {
        'icon',
        'size',
        'mtime',
        'permissions',
      },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
