vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<c-j>", "<C-\\><C-n>")

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-A-h>", function() vim.cmd("vertical resize +4") end)
vim.keymap.set("n", "<C-A-j>", function() vim.cmd("resize -4") end)
vim.keymap.set("n", "<C-A-k>", function() vim.cmd("resize +4") end)
vim.keymap.set("n", "<C-A-l>", function() vim.cmd("vertical resize -4") end)

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("x", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>P", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<CR>")

vim.keymap.set("n", "<leader>tn", function() vim.cmd.tabnext() end)
vim.keymap.set("n", "<leader>tp", function() vim.cmd.tabprev() end)
vim.keymap.set("n", "<leader>to", function() vim.cmd.tabnew() end)
vim.keymap.set("n", "<leader>tc", function() vim.cmd.tabclose() end)
vim.keymap.set("n", "<right>", function() vim.cmd.tabnext() end)
vim.keymap.set("n", "<left>", function() vim.cmd.tabprev() end)
vim.keymap.set("n", "<up>", function() vim.cmd.tabnew() end)
vim.keymap.set("n", "<down>", function() vim.cmd.tabclose() end)

vim.keymap.set("n", "<leader>co", function() vim.cmd.copen() end)
vim.keymap.set("n", "<leader>cc", function() vim.cmd.cclose() end)
vim.keymap.set("n", "<leader>]", function() vim.cmd.cnext() end)
vim.keymap.set("n", "<leader>[", function() vim.cmd.cprev() end)

vim.keymap.set("n", "<leader>cy", ":set signcolumn=yes<CR>")
vim.keymap.set("n", "<leader>cn", ":set signcolumn=no<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.hl.on_yank({ timeout = 50 })",
})

vim.keymap.set("n", "-", "<CMD>Ex<CR>")

vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", "<leader>dn", function() vim.lsp.diagnostic.goto_next() end)
vim.keymap.set("n", "<leader>dN", function() vim.lsp.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>dr", function() vim.diagnostic.reset() end)

vim.keymap.set(
  "n",
  "<leader>i",
  function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })) end
)
