local ui = require 'custom.notes.ui'
local workspaces = require 'custom.notes.workspaces'

--- @class Notes
--- @field step number
--- @field workspaces Workspaces
--- @field ui Ui
--- @field setup fun(): Notes
local M = {}
M.__index = M

local steps = {
  workspaces = 1,
  note = 2,
  ['1'] = 'workspaces',
  ['2'] = 'note',
}

--- @param step number
--- @return number
local function next_step(step)
  local next = steps[tostring(step + 1)]
  assert(next ~= nil, 'skill issue: accessing next step but its nil')
  local next_step = steps[next]
  assert(type(next_step) == 'number', 'skill issue: accessing next step but its not a number')
  return next_step
end

--- @param step number
--- @return number
local function prev_step(step)
  local prev = steps[tostring(step - 1)]
  assert(prev ~= nil, 'skill issue: accessing prev step but its nil')
  local next_step = steps[prev]
  assert(type(next_step) == 'number', 'skill issue: accessing prev step but its not a number')
  return next_step
end

local mt = {
  step = steps.workspaces,
  workspaces = nil,
  ui = nil,
}

function M:go_back()
  if self.step == 2 then
    self.step = prev_step(self.step)
    self.workspaces:clear()
    self.workspaces:load_workspaces()
  elseif self.step == 1 then
    self:close()
  end
end

function M:close() self.ui:close() end

function M:confirm()
  if self.step == 1 then
    self.workspaces:display_notes()
    self.step = next_step(self.step)
    return
  end

  local path = self.workspaces:select_note()
  self:close()
  self.ui:close()
  vim.cmd 'vsplit'
  vim.cmd('e ' .. path)
end

--- @return Notes
function M.open()
  mt.ui = ui.new()
  mt.workspaces = workspaces.new(prev_step, next_step, mt.ui)
  mt.workspaces:clear()
  local self = setmetatable(mt, M)
  self.step = 1
  self.workspaces:load_workspaces()

  self:set_local_keymaps()

  return self
end

function M:set_local_keymaps()
  local keymaps = {
    ['<CR>'] = ':NotesConfirm<CR>',
    ['q'] = ':NotesClose<CR>',
    ['<ESC>'] = ':NotesBack<CR>',
  }

  for key, command in pairs(keymaps) do
    vim.api.nvim_buf_set_keymap(self.ui.buffer, 'n', key, command, { noremap = true, silent = true })
  end
end

local function set_commands_and_keymaps()
  vim.api.nvim_create_user_command('NotesOpen', function() M.open() end, {})
  vim.api.nvim_create_user_command('NotesClose', function() mt:close() end, {})
  vim.api.nvim_create_user_command('NotesConfirm', function() mt:confirm() end, {})
  vim.api.nvim_create_user_command('NotesBack', function() mt:go_back() end, {})

  vim.keymap.set('n', '<leader>no', function() vim.cmd 'NotesOpen' end, {})
  vim.keymap.set('n', '<leader>nc', function() vim.cmd 'NotesClose' end, {})
end

set_commands_and_keymaps()

return M

