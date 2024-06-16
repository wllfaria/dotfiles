local M = {}

M.setup = function()
  vim.lsp.start({
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    root_dir = vim.F.if_nil(vim.fs.root(0, '.git/'), vim.fs.joinpath(vim.env.HOME, '.config/nvim'), vim.uv.cwd()),
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
          showWord = "Disabled",
        },
        diagnostics = {
          disable = { "redefined-local", "lowercase-global" },
        },
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = "Disable",
          library = { vim.env.VIMRUNTIME },
        },
      }
    }
  })
end

return M

