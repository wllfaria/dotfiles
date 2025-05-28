---@type vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
  root_markers = { "go.work", "go.mod", ".git" },
}
