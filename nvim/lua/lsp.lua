local mapping = {
  lua = { "lua_ls" },
  rust = { "rust_analyzer" },
  javascript = { "ts_ls", "eslint" },
  typescript = { "ts_ls", "eslint" },
  typescriptreact = { "ts_ls", "tailwind", "eslint" },
  javascriptreact = { "ts_ls", "tailwind", "eslint" },
  json = { "jsonls" },
  jsonc = { "jsonls" },
}

local augroup = vim.api.nvim_create_augroup("lsp", { clear = true })

for ft, lsps in pairs(mapping) do
  vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = ft,
    callback = function()
      vim.lsp.enable(lsps)
    end,
  })
end
