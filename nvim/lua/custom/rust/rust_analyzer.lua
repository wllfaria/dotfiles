local M = {}

local function format_on_save(buffer)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    group = vim.api.nvim_create_augroup(("formatter%d"):format(buffer), { clear = true }),
    callback = function(event)
      vim.lsp.buf.format({ bufnr = event.buf })
    end,
  })
end

M.setup = function()
  vim.lsp.start({
    name = 'rust-analyzer',
    cmd = { 'rust-analyzer' },
    root_dir = vim.F.if_nil(vim.fs.root(0, 'Cargo.toml'), 'rust-project.json', vim.uv.cwd()),
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
          extraArgs = { "--tests" },
        },
      }
    },
    on_attach = function(_, buffer)
      format_on_save(buffer)
    end
  })
end


return M
