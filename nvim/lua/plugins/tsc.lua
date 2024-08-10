return {
  'dmmulroy/tsc.nvim',
  config = function()
    require('tsc').setup {}
    vim.keymap.set('n', '<leader>tsc', function() vim.cmd ':TSC' end)
  end,
}
