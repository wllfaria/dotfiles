local ok, blink = pcall(require, "blink.cmp")
if not ok then return {} end
local capabilities = blink.get_lsp_capabilities()

return {
  cmd = { "gopls" },
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
  root_markers = { "go.work", "go.mod", ".git" },
}
