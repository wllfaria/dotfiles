--- @alias StepFun fun(step: number): number

--- @class Workspaces
--- @field prev_step StepFun
--- @field next_step StepFun
--- @field notes_dir string
--- @field ui Ui
--- @field workspaces string[]

--- @class Workspaces
local M = {}
M.__index = M

local mt = {
  prev_step = nil,
  next_step = nil,
  ui = nil,
  notes_dir = vim.fn.expand '$HOME' .. '/notes',
  workspaces = {},
  directory = nil,
  notes = {},
}

function M:load_workspaces()
  self.workspaces = self:read_dir(self.notes_dir, false)
  self.ui:open_bottom_win()
  self.ui:set_buffer_content(self.workspaces)
end

--- @param path string
--- @param only_markdown boolean
--- @return string[]
function M:read_dir(path, only_markdown)
  local dir_handle = vim.uv.fs_scandir(path)
  local results = {}

  if not dir_handle then return results end

  while true do
    local name, type = vim.uv.fs_scandir_next(dir_handle)
    if not name then break end

    if only_markdown then
      if vim.fn.fnamemodify(name, ':e') == 'md' then table.insert(results, name) end
    else
      if type == 'directory' then table.insert(results, name) end
    end
  end

  return results
end

function M:clear() self.workspaces = {} end

function M:display_notes()
  local line = self.ui:get_line()
  local path = vim.fs.joinpath(self.notes_dir, line)
  self.directory = line
  self.notes = self:read_dir(path, true)
  self.ui:set_buffer_content(self.notes)
end

function M:select_note()
  local line = self.ui:get_line()
  local note_path = vim.fs.joinpath(self.notes_dir, self.directory, line)
  return note_path
end

--- @param prev_step StepFun
--- @param next_step StepFun
--- @param ui Ui
--- @return Workspaces
function M.new(prev_step, next_step, ui)
  mt.prev_step = prev_step
  mt.next_step = next_step
  mt.ui = ui
  return setmetatable(mt, M)
end

return M

