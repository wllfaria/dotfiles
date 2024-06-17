local M = {}

local function stylua_format()
  local bufnr = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  local cmd = string.format('stylua -', vim.fn.shellescape(filepath))

  local input = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, true), '\n')
  local result = vim.fn.system(cmd, input)

  if vim.v.shell_error == 0 then
    local lines = vim.split(result, '\n', { plain = true })
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  else
    vim.api.nvim_err_writeln('Error running stylua: ' .. result)
  end
end

local function format_on_save(buffer)
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = buffer,
    group = vim.api.nvim_create_augroup(('formatter%d'):format(buffer), { clear = true }),
    callback = function(_) stylua_format() end,
  })
end

M.setup = function()
  vim.lsp.start {
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    root_dir = vim.F.if_nil(vim.fs.root(0, '.git/'), vim.fs.joinpath(vim.env.HOME, '.config/nvim'), vim.uv.cwd()),
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
          showWord = 'Disabled',
        },
        diagnostics = {
          disable = { 'redefined-local', 'lowercase-global' },
        },
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          checkThirdParty = 'Disable',
          library = { vim.env.VIMRUNTIME },
        },
      },
    },
    on_attach = function(_, buffer) format_on_save(buffer) end,
  }
end

return M

