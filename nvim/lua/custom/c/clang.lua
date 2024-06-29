local M = {}

local function format_on_save(buffer)
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = buffer,
    group = vim.api.nvim_create_augroup(('formatter%d'):format(buffer), { clear = true }),
    callback = function(event) vim.lsp.buf.format { bufnr = event.buf } end,
  })
end

M.setup = function()
  vim.lsp.start {
    name = 'clang',
    cmd = { 'clang' },
    filetypes = { 'c', 'cpp' },
    root_dir = vim.fs.find({ 'build-commands.json', 'CMakeLists.txt', '.clang-format' }, { upward = true })[1]
      or vim.loop.cwd(),
    settings = {},
    on_attach = function(_, buffer) format_on_save(buffer) end,
  }
end

return M

