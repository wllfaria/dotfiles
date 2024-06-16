local current_os = vim.loop.os_uname().sysname
if current_os == 'Linux' then
  vim.g.termdebugger = 'rust-gdb'
elseif 'macOS' then
  vim.g.termdebugger = 'rust-lldb'
end
