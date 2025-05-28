vim.cmd("packadd cfilter")

local function delete_qf_under_cursor()
  local index = vim.fn.line(".")
  require("quickfix").delete_item(index)
  vim.cmd(tostring(index))
end

vim.keymap.set("n", "dd", delete_qf_under_cursor, { buffer = 0 })
vim.keymap.set("n", "q", ":bd<cr>", { buffer = 0 })
