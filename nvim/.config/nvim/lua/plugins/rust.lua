return {
  'saecki/crates.nvim',
  event = 'BufEnter',
  config = function() require('crates').setup {} end,
}
