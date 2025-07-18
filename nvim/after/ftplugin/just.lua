vim.api.nvim_create_user_command(
  "Just",
  function(cmd) vim.cmd("vert Start -wait=always just " .. cmd.args) end,
  { nargs = "*" }
)
