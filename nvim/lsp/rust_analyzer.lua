---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  single_file_support = true,
  root_markers = { "Cargo.toml" },
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy", extraArgs = { "--tests", "--no-deps", "--all-targets" } },
      cargo = { allFeatures = true, targetDir = true },
      checkOnSave = false,
      rustfmt = { extraArgs = { "+nightly" } },
      diagnostics = { disabled = { "macro-error" } },
      inlayHints = { chainingHints = { enable = false } },
    },
  },
  on_attach = function(client, buffer)
    vim.api.nvim_buf_create_user_command(buffer, "CargoReload", function()
      vim.notify("reloading workspace")

      client:request("rust-analyzer/reloadWorkspace", nil, function(err)
        if err then error(tostring(err)) end
        vim.notify("Cargo workspace reloaded")
      end, 0)
    end, {})
  end,
}
