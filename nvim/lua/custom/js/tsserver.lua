local M = {}

M.setup = function()
  vim.lsp.start {
    name = 'tsserver',
    cmd = { 'typescript-language-server', '--stdio' },
    root_dir = vim.F.if_nil(
      vim.fs.root(0, 'tsconfig.json'),
      vim.fs.root(0, 'package.json'),
      vim.fs.root(0, 'jsconfig.json'),
      '.git/',
      vim.uv.cwd()
    ),
    settings = {},
  }
end

return M

