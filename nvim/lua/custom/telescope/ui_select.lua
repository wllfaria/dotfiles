if not pcall(require, 'plenary.strings') then return end

if not pcall(require, 'telescope') then return end

local actions = require 'telescope.actions'
local actions_state = require 'telescope.actions.state'
local finders = require 'telescope.finders'
local pickers = require 'telescope.pickers'
local themes = require 'telescope.themes'

--- Custom `vim.ui.select()` handler utilizing telescope.
---
---@generic Item
---
---@param items Item[]
---@param opts table
---@param callback fun(item: Item, idx: integer)
---
---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(items, opts, callback)
  opts.format_item = opts.format_item or vim.inspect

  local results = vim
    .iter(ipairs(items))
    :map(function(idx, item) return string.format('%d: %s', idx, opts.format_item(item)) end)
    :totable()

  local picker = pickers.new(themes.get_cursor(), {
    prompt_title = opts.prompt or 'Select one:',
    sorter = require('telescope.config').values.generic_sorter {},
    finder = finders.new_table { results = results },
    attach_mappings = function(buffer)
      actions.select_default:replace(function()
        local entry = actions_state.get_selected_entry()

        if not entry then return end

        actions.close(buffer)

        vim.schedule(function() pcall(callback, items[entry.index], entry.index) end)
      end)

      return true
    end,
  })

  picker:find()
end
