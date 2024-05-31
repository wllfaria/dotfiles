return {
  'NeogitOrg/neogit',
  event = 'BufEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neogit').setup {
      auto_show_console = false,
      console_timeout = 20000,
    }

    vim.keymap.set('n', '<leader>gs', '<cmd>Neogit kind=vsplit<CR>')
  end,
}
