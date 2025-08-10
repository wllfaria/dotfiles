local ok, fzf_lua = pcall(require, "fzf-lua")
if not ok then
  return
end

fzf_lua.setup({
  keymap = { fzf = { ["ctrl-q"] = "select-all+accept" } },
  previewers = { codeaction = { toggle_behavior = "extend" } },
  lsp = {
    code_actions = {
      winopts = {
        width = 70,
        height = 20,
        relative = "cursor",
        preview = {
          hidden = true,
          vertical = "down:50%",
        },
      },
    },
  },
})

vim.keymap.set("n", "<leader>fpf", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>fgc", "<cmd>FzfLua git_commits<cr>")
vim.keymap.set("n", "<leader>fgb", "<cmd>FzfLua git_branches<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua commands<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>FzfLua nvim_options<cr>")
vim.keymap.set("n", "<leader>fht", "<cmd>FzfLua help_tags<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>")
vim.keymap.set("n", "<leader>fhi", "<cmd>FzfLua highlights<cr>")
vim.keymap.set("n", "<leader>fa", "<cmd>FzfLua autocmds<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua lgrep_curbuf<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>fgg", "<cmd>FzfLua git_files<cr>")
vim.keymap.set("n", "<leader>flg", "<cmd>FzfLua live_grep<cr>")

vim.keymap.set("n", "<leader>fd", function()
  require("fzf-lua").diagnostics_workspace({ sort = 1 })
end)

---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(items, opts, on_choice)
  local ui_select = require("fzf-lua.providers.ui_select")

  if not ui_select.is_registered() then
    ui_select.register(function(ui_opts)
      if ui_opts.kind == "luasnip" then
        ui_opts.prompt = "Snippet choice: "
        ui_opts.winopts = {
          relative = "cursor",
          height = 0.35,
          width = 0.3,
        }
      else
        ui_opts.winopts = { height = 0.5, width = 0.4 }
      end

      if ui_opts.kind then
        ui_opts.winopts.title = string.format(" %s ", ui_opts.kind)
      end

      return ui_opts
    end)
  end

  if #items > 0 then
    return vim.ui.select(items, opts, on_choice)
  end
end
