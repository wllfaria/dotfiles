local M = {}

function M.open_win()
  local buf = vim.api.nvim_create_buf(false, true)
  local height = math.floor(vim.o.lines * 0.7)
  local width = math.floor(vim.o.columns * 0.9)
  local row = math.floor(vim.o.lines - height) / 2
  local col = math.floor(vim.o.columns - width) / 2

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    height = height,
    width = width,
    row = row,
    col = col,
    style = 'minimal',
  })

  return win
end

return M
