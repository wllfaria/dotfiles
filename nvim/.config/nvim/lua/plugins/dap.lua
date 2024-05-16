return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local ui = require 'dapui'

    require('dapui').setup()
    require('nvim-dap-virtual-text').setup {}

    vim.keymap.set('n', '<space>?', function() require('dapui').eval(nil, { enter = true }) end)

    vim.keymap.set('n', '<leader>B', dap.set_breakpoint)
    vim.keymap.set('n', '<leader>.', dap.continue)
    vim.keymap.set('n', '<leader>>', dap.step_into)
    vim.keymap.set('n', '<leader>;', dap.step_over)
    vim.keymap.set('n', '<leader><', dap.step_out)
    vim.keymap.set('n', '<leader>,', dap.step_back)
    vim.keymap.set('n', '<leader>r', dap.restart)

    dap.listeners.before.attach.dapui_config = function() ui.open() end
    dap.listeners.before.launch.dapui_config = function() ui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
    dap.listeners.before.event_exited.dapui_config = function() ui.close() end
  end,
}
