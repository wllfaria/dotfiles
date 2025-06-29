---@type vim.lsp.Config
return {
  cmd = { "aml_ls" },
  filetypes = { "aml" },
  root_markers = { ".git", "Cargo.toml" },
}
