return {
  "ibhagwan/fzf-lua",
  lazy = true,
  event = "VeryLazy",
  keys = {
    { "<leader>fpf", "<cmd>FzfLua files<cr>" },
    { "<leader>fgc", "<cmd>FzfLua git_commits<cr>" },
    { "<leader>fgb", "<cmd>FzfLua git_branches<cr>" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>" },
    { "<leader>fc", "<cmd>FzfLua commands<cr>" },
    { "<leader>fo", "<cmd>FzfLua nvim_options<cr>" },
    { "<leader>fht", "<cmd>FzfLua help_tags<cr>" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>" },
    { "<leader>fhi", "<cmd>FzfLua highlights<cr>" },
    { "<leader>fa", "<cmd>FzfLua autocmds<cr>" },
    { "<leader>ff", "<cmd>FzfLua lgrep_curbuf<cr>" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
    { "<leader>fd", function() require("fzf-lua").diagnostics_workspace({ sort = 1 }) end },
    { "<leader>fgg", "<cmd>FzfLua git_files<cr>" },
    { "<leader>flg", "<cmd>FzfLua live_grep<cr>" },
  },
  opts = {
    keymap = {
      fzf = { ["ctrl-q"] = "select-all+accept" },
    },
    previewers = {
      codeaction = { toggle_behavior = "extend" },
    },
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
  },
  init = function()
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

          if ui_opts.kind then ui_opts.winopts.title = string.format(" %s ", ui_opts.kind) end

          return ui_opts
        end)
      end

      if #items > 0 then return vim.ui.select(items, opts, on_choice) end
    end
  end,
}
