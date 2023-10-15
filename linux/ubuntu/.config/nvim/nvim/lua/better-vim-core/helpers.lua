local config = require "better-vim.better-vim"
local default_config = require "better-vim-core.default-config"
local home = os.getenv "HOME"

local M = {}

M.file_exists = function(name)
  local file = io.open(name, "r")
  if file ~= nil then
    io.close(file)
    return true
  else
    return false
  end
end

M.config_path = home .. "/.config/nvim/lua/better-vim"
M.home = home

M.get_file_name = function()
  if vim.bo.filetype == "NvimTree" then
    return "  Explorer"
  else
    return " " .. vim.fn.expand "%:t"
  end
end

M.get_config_item = function(keys)
  local value = config
  local defaultValue = default_config

  for _, key in ipairs(keys) do
    if value[key] ~= nil then
      value = value[key]
    else
      value = defaultValue[key]
    end

    defaultValue = defaultValue[key]
  end

  return value
end

M.table_length = function(table)
  local _table = table or {}
  local count = 0
  for _ in pairs(_table) do
    count = count + 1
  end
  return count
end

M.merge_tables = function(...)
  local tables_to_merge = { ... }
  assert(#tables_to_merge > 1, "There should be at least two tables to merge them")

  for k, t in ipairs(tables_to_merge) do
    assert(type(t) == "table", string.format("Expected a table as function parameter %d", k))
  end

  local result = tables_to_merge[1]

  for i = 2, #tables_to_merge do
    local from = tables_to_merge[i]
    for k, v in pairs(from) do
      if type(k) == "number" then
        table.insert(result, v)
      elseif type(k) == "string" then
        if type(v) == "table" then
          result[k] = result[k] or {}
          result[k] = M.merge_tables(result[k], v)
        else
          result[k] = v
        end
      end
    end
  end

  return result
end

M.ternary = function(cond, true_expression, false_expression)
  if cond then
    return true_expression
  else
    return false_expression
  end
end

M.shallow_merge = function(table1, table2)
  local new_table = {}

  for k, v in pairs(table1) do
    new_table[k] = v
  end

  for k, v in pairs(table2) do
    new_table[k] = M.ternary(v == "remove", nil, v)
  end

  return new_table
end

M.with_leader_as_prefix = function(key)
  local leader = M.get_config_item { "mappings", "leader" }
  local label = leader == " " and "<SPACE>" or leader

  return label .. key
end

M.get_better_vim_version = function()
  local bettervimrc_path = home .. "/.config/better-vim/.bettervimrc"
  local file = io.open(bettervimrc_path, "r")
  if file then
    for line in file:lines() do
      local key, value = line:match "([^=]+)=(.+)"

      -- Check if the key matches the target
      if key == "export BETTER_VIM_VERSION" then
        -- Remove the quotes around the value
        local unquoted_value = value:match '^"(.*)"$' or value:match "^'(.*)'$"
        local final_value = unquoted_value or value
        return "v" .. final_value
      end
    end
    file:close()
  end

  return ""
end

M.unloadable_by_key = function(plugin_key, plugin_config)
  local unload_plugins_table = M.get_config_item { "unload_plugins" }
  for _, k in pairs(unload_plugins_table) do
    if plugin_key == k then
      return {}
    end
  end

  return plugin_config
end

return M
