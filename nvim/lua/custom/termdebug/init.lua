vim.g.termdebugger = "gdb"

vim.keymap.set("n", "<leader>db", function() vim.cmd("Break") end)
vim.keymap.set("n", "<leader>do", function() vim.cmd("Over") end)
vim.keymap.set("n", "<leader>ds", function() vim.cmd("Step") end)
vim.keymap.set("n", "<leader>dS", function() vim.cmd("Stop") end)
