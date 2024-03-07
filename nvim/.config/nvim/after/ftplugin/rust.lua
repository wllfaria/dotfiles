vim.lsp.start({
    name = "rust_analyzer",
    cmd = { "rust-analyzer" },
    detached = false,
    root_dir = vim.fs.dirname(vim.fs.find({ '.rustfmt.toml', 'rustfmt.toml' }, {
        upward = true,
    })[1]),
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
                extraArgs = { "--tests" },
                features = "all",
            },
        }
    },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})
