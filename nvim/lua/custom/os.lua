local M = {}

M.systems = {
  Linux = "linux",
  Mac = "Mac",
}

function M.get_system()
  local current_os = vim.loop.os_uname().sysname
  return current_os == "Linux" and M.systems.Linux or M.systems.Mac
end

return M
