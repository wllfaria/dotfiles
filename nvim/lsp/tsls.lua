local ok, blink = pcall(require, "blink.cmp")
if not ok then return {} end
local capabilities = blink.get_lsp_capabilities()

return {
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
  single_file_support = true,
}
