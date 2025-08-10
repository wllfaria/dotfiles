local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter.setup({
  auto_install = true,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
