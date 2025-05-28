---@param root string
local function get_tsserver_pnpm_path(root)
  local function filter(name, path)
    return name == "tsserverlibrary.js" and path:match("%.pnpm.*/typescript@.*/node_modules/typescript/lib$")
  end

  local candidates = vim.fs.find(filter, { path = root, type = "file", limit = 1 })
  if #candidates == 0 then return "" end

  return vim.fs.dirname(candidates[1])
end

local function get_tsserver_path()
  local cwd = vim.uv.cwd()
  if not cwd then return "" end

  local node_modules = cwd .. "/node_modules"
  if not vim.uv.fs_stat(node_modules) then return "" end

  local is_pnpm = vim.uv.fs_stat("pnpm-lock.yaml") ~= nil
  if is_pnpm then return get_tsserver_pnpm_path(node_modules) end

  return node_modules and "typescript/lib" or ""
end

---@type vim.lsp.Config
return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    typescript = { tsdk = get_tsserver_path() },
  },
  root_markers = { "package.json", "tsconfig.json", ".git", "jsconfig.json" },
}
