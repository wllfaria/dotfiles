vim.g.mapleader = " " -- Using Space as leader

-- General mapping
vim.keymap.set("i", "jk", "<Esc>") -- Using jk as ESC
vim.keymap.set("n", "<leader>v", "<C-v>")

-- Resizing Windows
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>") -- Resize window Ctrl + UP
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>") -- Resize window Ctrl + DOWN
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>") -- Resize window Ctrl + LEFT
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>") -- Resize window Ctrl + RIGHT

vim.keymap.set("v", "<Tab>", ">gv") -- Indent selected text
vim.keymap.set("v", "<S-Tab>", "<gv") -- Unindent selected text
vim.keymap.set("v", ">>", ">gv") -- Indent selected text
vim.keymap.set("v", "<<", "<gv") -- Unindent selected text

-- LSP
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Go to declaration
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end)
vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end)

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>") -- Search for a file (ignoring git-ignore)
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>") -- Search for a file
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<CR>") -- Find a string in project
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").grep_string({
		search = vim.fn.input("Grep String > "),
	})
end)

vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<CR>") -- Show all problems in project (with help of LSP)

-- Move Lines with ALT + hjkl
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

function _G.set_terminal_keymaps()
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
