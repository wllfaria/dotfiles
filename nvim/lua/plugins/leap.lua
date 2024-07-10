return {
  'ggandor/leap.nvim',
  enabled = false,
  event = 'BufEnter',
  config = function() require('leap').create_default_mappings() end,
}
