vim.lsp.start({
    name = "lua_ls",
    cmd = { "lua-language-server" },
    detached = false,
    filetype = { "lua" },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

