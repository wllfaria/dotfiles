local ok, blink = pcall(require, "blink.cmp")
if not ok then return {} end
local capabilities = blink.get_lsp_capabilities()

return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  capabilities = capabilities,
  single_file_support = true,
  root_markers = { "Cargo.toml" },
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy", extraArgs = { "--tests" } },
      cargo = { allFeatures = true },
      rustfmt = { extraArgs = { "+nightly" } },
    },
  },
}
