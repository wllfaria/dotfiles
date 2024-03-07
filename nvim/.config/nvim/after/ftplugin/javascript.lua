vim.lsp.start({
    name = "tsserver",
    cmd = { "tsserver", "--stdio" },
    detached = false,
    root_dir = vim.fs.dirname(vim.fs.find({ 'package.json' }, {
        upward = true,
    })[1]),
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
})
