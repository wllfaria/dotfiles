return {
  'ibhagwan/fzf-lua',
  enabled = false,
  config = function()
    local fzf_lua = require 'fzf-lua'

    fzf_lua.setup {
      'skim',
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
        },
      },
      grep = {
        rg_opts = '-l --no-heading --color=always --smart-case --max-columns=4096 -e',
      },
    }

    fzf_lua.register_ui_select(function(_, items)
      local min_h, max_h = 0.15, 0.70
      local h = (#items + 4) / vim.o.lines
      if h < min_h then
        h = min_h
      elseif h > max_h then
        h = max_h
      end
      return { winopts = { height = h, width = 0.60, row = 0.40 } }
    end)

    vim.keymap.set('n', '<leader>fgc', fzf_lua.git_commits)
    vim.keymap.set('n', '<leader>fgb', fzf_lua.git_branches)
    vim.keymap.set('n', '<leader>fgg', fzf_lua.git_files)
    vim.keymap.set('n', '<leader>fr', fzf_lua.resume)
    vim.keymap.set('n', '<leader>fc', fzf_lua.commands)
    vim.keymap.set('n', '<leader>fht', fzf_lua.helptags)
    vim.keymap.set('n', '<leader>fk', fzf_lua.keymaps)
    vim.keymap.set('n', '<leader>fhi', fzf_lua.highlights)
    vim.keymap.set('n', '<leader>fa', fzf_lua.autocmds)
    vim.keymap.set('n', '<leader>ff', fzf_lua.lgrep_curbuf)
    vim.keymap.set('n', '<leader>fs', fzf_lua.lsp_document_symbols)
    vim.keymap.set('n', '<leader>fb', fzf_lua.buffers)
    vim.keymap.set('n', '<leader>fd', fzf_lua.diagnostics_workspace)
    vim.keymap.set('n', '<leader>fpf', fzf_lua.files)
    vim.keymap.set('n', '<leader>flg', fzf_lua.live_grep)
  end,
}
