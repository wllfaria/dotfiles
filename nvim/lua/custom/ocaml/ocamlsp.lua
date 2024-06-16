local utils = require 'custom.utils'

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
  local root_dir = vim.uv.cwd()

  vim.lsp.start({
    name = 'ocamlsp',
    cmd = { 'ocamllsp' },
    filetypes = { 'ocaml', 'menhir', 'ocamlinterface', 'ocamllex', 'reason', 'dune' },
    root_dir = utils.root_pattern('*.opam', 'esy.json', 'package.json', '.git', 'dune-project', 'dune-workspace')(root_dir),
    on_attach = function(_, buffer)
      format_on_save(buffer)
    end
  })
end


return M

