local handle_url = function(url)
  vim.ui.select({
    { target = 'browser', text = 'Open in Browser' },
    { target = 'clipboard', text = 'Copy to Clipboard' },
  }, {
    format_item = function(item) return item.text end,
  }, function(choice)
    if choice.target == 'browser' then
      vim.ui.open(url)
    else
      vim.fn.setreg('+', url)
      vim.notify 'Copied URL to clipboard.'
    end
  end)
end

local prompt = function()
  local handle = vim.fn.input 'handle > '
  local url = 'https://github.com/' .. handle
  handle_url(url)
end

vim.keymap.set('n', '<leader>ghl', function() prompt() end)
