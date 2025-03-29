local ok, blink = pcall(require, "blink.cmp")
if not ok then return {} end
local capabilities = blink.get_lsp_capabilities()

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  capabilities = capabilities,
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}
