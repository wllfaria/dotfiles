--- @class Ui
--- @field buffer integer
--- @field win integer
--- @field group number
local M = {}
M.__index = M

local mt = {
  buffer = nil,
  win = nil,
  group = vim.api.nvim_create_augroup('NotesUI', {}),
}

--- @return Ui
function M.new()
  local self = setmetatable(mt, M)
  return self
end

function M:open_bottom_win()
  local width = vim.o.columns
  local height = vim.o.lines
  local win_height = vim.fn.min { height, 10 }

  local buf = vim.api.nvim_create_buf(false, true)
  print(buf)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = win_height,
    border = 'single',
    col = 0,
    row = height - win_height,
  })

  self.win = win
  self.buffer = buf
  self:set_events()
end

function M:set_events()
  vim.api.nvim_create_autocmd({ 'BufLeave' }, {
    buffer = self.buffer,
    callback = function() self:close() end,
  })
end

function M:close()
  if self.buffer == nil then return end
  vim.api.nvim_buf_delete(self.buffer, {})
  self.buffer = nil
  self.win = nil
end

function M:get_line() return vim.api.nvim_get_current_line() end

--- @param content string[]
function M:set_buffer_content(content) vim.api.nvim_buf_set_lines(self.buffer, 0, -1, false, content) end

return M

