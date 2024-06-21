local M = {}

local function format_on_save(buffer)
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = buffer,
    group = vim.api.nvim_create_augroup(('formatter%d'):format(buffer), { clear = true }),
    callback = function(event) vim.lsp.buf.format { bufnr = event.buf } end,
  })
end

M.setup = function()
  local root = vim.F.if_nil(
    vim.fs.root(0, 'tsconfig.json'),
    vim.fs.root(0, 'package.json'),
    vim.fs.root(0, 'jsconfig.json'),
    '.git/',
    vim.uv.cwd()
  )

  vim.lsp.start {
    name = 'tsserver',
    cmd = { 'typescript-language-server', '--stdio' },
    root_dir = root,
    settings = {},
    on_attach = function(_, buffer)
      print('attaching to buffer ' .. buffer)
      format_on_save(buffer)
    end,
  }
end

return M

