return {
  "neovim/nvim-lspconfig",
  dependencies = { { "folke/neodev.nvim", opts = {} } },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local configs = {
      gopls = {},
      clangd = {},
      zls = {},
      ocamllsp = {
        settings = { codelens = { enable = true }, inlayHints = { enable = true } },
        filetypes = { "ocaml", "ocaml.interface", "ocaml.menhir", "ocaml.cram" },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy", extraArgs = { "--tests" } },
            cargo = { allFeatures = true },
            rustfmt = { extraArgs = { "+nightly" } },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { library = { "~/.local/share/nvim/lazy/plenary.nvim/lua" } },
          },
        },
      },
    }

    for server, config in pairs(configs) do
      local with_capabilities = vim.tbl_deep_extend("force", config, { capabilities = capabilities })
      lspconfig[server].setup(with_capabilities)
    end

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
    vim.keymap.set("n", "<leader>dn", function() vim.lsp.diagnostic.goto_next() end)
    vim.keymap.set("n", "<leader>dN", function() vim.lsp.diagnostic.goto_prev() end)
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set("n", "<leader>dr", function() vim.diagnostic.reset() end)

    vim.keymap.set(
      "n",
      "<leader>i",
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })) end
    )
  end,
}
