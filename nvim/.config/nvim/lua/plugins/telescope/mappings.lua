local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fgc", builtin.git_commits)
vim.keymap.set("n", "<leader>fgb", builtin.git_branches)
vim.keymap.set("n", "<leader>fr", builtin.resume)
vim.keymap.set("n", "<leader>fc", builtin.commands)
vim.keymap.set("n", "<leader>fo", builtin.vim_options)
vim.keymap.set("n", "<leader>fht", builtin.help_tags)
vim.keymap.set("n", "<leader>fpr", builtin.reloader)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fk", builtin.keymaps)
vim.keymap.set("n", "<leader>fhi", builtin.highlights)
vim.keymap.set("n", "<leader>fa", builtin.autocommands)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
vim.keymap.set("n", "<leader>fpf", builtin.find_files)
vim.keymap.set("n", "<leader>fgg", builtin.git_files)
vim.keymap.set("n", "<leader>flg", builtin.live_grep)

return {
    i = {
        ["<Esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}
