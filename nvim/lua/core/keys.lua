require("core.helpers.globals")
require("core.helpers.keymaps")

g.mapleader = " " -- Using Space as leader

-- General mapping
im("jk", "<Esc>") -- Using jk as ESC

-- Resizing Windows
nm("<C-Up>", ":resize +2<cr>") -- Resize window Ctrl + UP
nm("<C-Down>", ":resize -2<cr>") -- Resize window Ctrl + DOWN
nm("<C-Left>", ":vertical resize -2<cr>") -- Resize window Ctrl + LEFT
nm("<C-Right>", ":vertical resize +2<cr>") -- Resize window Ctrl + RIGHT

vm("<Tab>", ">gv") -- Indent selected text
vm("<S-Tab>", "<gv") -- Unindent selected text

-- LSP
nm("K", "<cmd>lua vim.lsp.buf.hover()<CR>") -- Hover object
nm("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code actions
nm("gR", "<cmd>lua vim.lsp.buf.rename()<CR>") -- Rename an object
nm("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Go to declaration

-- Telescope
nm("gd", "<cmd>Telescope lsp_definitions<CR>") -- Go to declaration
nm("<leader>p", "<cmd>Telescope find_files<CR>") -- Search for a file (ignoring git-ignore)
nm("<leader>P", "<cmd>Telescope git_files<CR>") -- Search for a file
nm("<leader>f", "<cmd>Telescope live_grep<CR>") -- Find a string in project
nm("<leader>r", "<cmd>Telescope oldfiles<CR>") -- Show recent files
nm("<leader>q", "<cmd>Telescope buffers<CR>") -- Show all buffers

-- Trouble
nm("<leader>x", "<cmd>TroubleToggle<CR>") -- Show all problems in project (with help of LSP)
nm("gr", "<cmd>Trouble lsp_references<CR>") -- Show use of object in project

-- Neo Tree
nm("<leader>b", "<cmd>Neotree toggle<CR>") -- Toggle file explorer

-- Dap
nm("<leader>db", "<cmd>DapToggleBreakpoint<CR>") -- Toggle breakpoint on current line
nm("<leader>dr", "<cmd>DapContinue<CR>") -- Start or Continue execution

-- Move Lines with ALT + hjkl
nm("<A-j>", ":m .+1<cr>==")
nm("<A-k>", ":m .-2<cr>==")
im("<A-j>", "<esc><cmd>m .+1<cr>==gi")
im("<A-k>", "<esc><cmd>m .-2<cr>==gi")
vm("<A-j>", ":m '>+1<cr>gv=gv")
vm("<A-k>", ":m '<-2<cr>gv=gv")

-- Remove Search Highlight
nm("<leader>sl", ":noh<cr>")

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
