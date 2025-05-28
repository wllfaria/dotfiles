---@type vim.lsp.Config
return {
  cmd = { "typescript-language-server", "--stdio" },
  init_options = {
    plugins = {
      {
        name = "@astrojs/ts-plugin",
        location = "/Users/wiru/.nvm/versions/node/v20.5.1/lib/node_modules/@astrojs/ts-plugin/",
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
  single_file_support = true,
}
