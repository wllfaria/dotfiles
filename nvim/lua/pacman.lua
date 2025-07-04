local pacman = {}

---@return table<string, table>
function pacman.list_plugins()
  local cwd = vim.uv.cwd()
  if not cwd then return {} end
  local plugin_dir = vim.fs.joinpath(cwd, "lua", "plugins")

  local plugins = {}

  for file_name, type in vim.fs.dir(plugin_dir, { depth = 1}) do
    if type ~= "file" or file_name:sub(-4) ~= ".lua" then goto continue end
    local plugin_path = "plugins." .. file_name:sub(1, -5) -- remove .lua extension

    local ok, plugin_spec = pcall(require, plugin_path)
    if not ok then goto continue end

    if plugin_spec.enabled == false then goto continue end

    ---@type string
    local plugin_name = plugin_spec[1]
    plugins[plugin_name] = plugin_spec

    ::continue::
  end

  return plugins
end

--- @return table
function pacman.sources()
  local plugins = pacman.list_plugins()

  local sources = {}

  for plugin_name in pairs(plugins) do
    local source = "https://github.com/" .. plugin_name
    table.insert(sources, { src = source })
  end

  return sources
end

---@param plugin_name string
---@param build_cmd string
function pacman.build_plugin(plugin_name, build_cmd)
  local plugin_path = vim.fn.stdpath('data') .. '/site/pack/*/opt/' .. plugin_name
  local paths = vim.fn.glob(plugin_path, false, true)

  if #paths <= 0 then
    vim.notify("Plugin not installed: " .. plugin_name, vim.log.levels.ERROR)
    return false
  end

  local current_dir = vim.fn.getcwd()
  vim.fn.chdir(paths[1])

  local cmd_parts = {}
  for part in string.gmatch(build_cmd, "%S+") do
    table.insert(cmd_parts, part)
  end

  local result = vim.system(cmd_parts):wait()

  vim.fn.chdir(current_dir)

  if result.code ~= 0 then
    vim.notify("Build failed for " .. plugin_name .. ": " .. result.stderr, vim.log.levels.ERROR)
    return false
  end

  return true
end

function pacman.setup()
  local plugins = pacman.list_plugins()
  for source, spec in pairs(plugins) do
    if spec.build then
      local name = source:gsub(".*/", "")
      pacman.build_plugin(name, spec.build)
    end

    if spec.config then
      spec.config()
    end
  end
end

return pacman


