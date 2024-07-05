local m = {}

local function format_on_save(buffer)
  vim.api.nvim_create_autocmd('bufwritepre', {
    buffer = buffer,
    group = vim.api.nvim_create_augroup(('formatter%d'):format(buffer), { clear = true }),
    callback = function(event) vim.lsp.buf.format { bufnr = event.buf } end,
  })
end

m.setup = function()
  vim.lsp.start {
    name = 'sveltelsp',
    cmd = { 'svelteserver', '--stdio' },
    filetypes = { 'svelte' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'package.json', 'node_modules', '.git' }, { upward = true })[1])
      or vim.loop.cwd(),
    settings = {},
    on_attach = function(_, buffer) format_on_save(buffer) end,
  }
end

return m

