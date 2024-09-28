local current_os = vim.loop.os_uname().sysname
-- if current_os == "Linux" then
--   vim.g.termdebugger = "gdb"
-- elseif "macOS" then
vim.g.termdebugger = "lldb"
vim.g.termdebug_cmd = "run"

-- end

local function debug_in_tab()
  local path = vim.fn.input("path: ", "", "file")
  vim.cmd("Termdebug " .. path)
  vim.cmd("Program")
  local buf = vim.api.nvim_get_current_buf()
  vim.cmd.tabnew()
  vim.api.nvim_set_current_buf(buf)
  vim.cmd.tabprevious()
  vim.cmd("Program")
  vim.cmd.wincmd("c")
end

vim.api.nvim_create_user_command("DebugInTab", debug_in_tab, {})

vim.keymap.set("n", "<leader>dt", function() vim.cmd("DebugInTab") end)
vim.keymap.set("n", "<leader>db", function() vim.cmd("Break") end)
vim.keymap.set("n", "<leader>do", function() vim.cmd("Over") end)
vim.keymap.set("n", "<leader>ds", function() vim.cmd("Step") end)
vim.keymap.set("n", "<leader>dS", function() vim.cmd("Stop") end)
