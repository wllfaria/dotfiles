return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		local bottom_layout = {
			results_title = "",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
			},
		}

		local pickers = {
			find_files = bottom_layout,
			git_files = bottom_layout,
			buffers = bottom_layout,
			help_tags = bottom_layout,
			live_grep = bottom_layout,
			keymaps = bottom_layout,
		}

		require("telescope").setup({
			pickers = pickers,
			defaults = {
				mappings = {
					i = {
						["<Esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--with-filename",
					"--no-heading",
					"--line-number",
					"--column",
					"--ignore-case",
					"--hidden",
				},
				file_ignore_patterns = {
					"%.git/",
					"shell/zsh%-.*/",
					"gtk/",
					"nvim/pack/",
					"Cargo.lock",
					"%.snap",
					"node_modules/",
				},
				preview = false,
				layout_config = {
					bottom_pane = {
						height = 0.25,
					},
					horizontal = {
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",
			},
		})
		pcall(require("telescope").load_extension, "fzf")

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
	end,
}
