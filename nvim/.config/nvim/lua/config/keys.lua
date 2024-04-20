vim.g.mapleader = ' '

vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile', { expr = true })
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>P', '"_dP')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<C-A-h>', function() vim.cmd 'vertical resize +2' end)
vim.keymap.set('n', '<C-A-j>', function() vim.cmd 'resize -2' end)
vim.keymap.set('n', '<C-A-k>', function() vim.cmd 'resize +2' end)
vim.keymap.set('n', '<C-A-l>', function() vim.cmd 'vertical resize -2' end)

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<c-f>', ':silent !tmux neww tmux-sessionizer<cr>')
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>mx', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<Right>', function() vim.cmd.tabnext() end)
vim.keymap.set('n', '<Left>', function() vim.cmd.tabprev() end)
vim.keymap.set('n', '<Up>', function() vim.cmd.tabnew() end)
vim.keymap.set('n', '<Down>', function() vim.cmd.tabclose() end)

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  command = 'silent! lua vim.highlight.on_yank({ timeout = 50 })',
})
