return {
	"williamboman/mason.nvim",
	event = { "InsertEnter", "BufRead", "BufNewFile", "InsertLeave", "BufWritePost" },
	dependencies = { "neovim/nvim-lspconfig", "folke/neodev.nvim" },
	config = function()
		local mason = require("mason")
		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")
		local lsp_defaults = lspconfig.util.default_config
		local neodev = require("neodev")
		local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_capabilities)

		neodev.setup({})
		mason.setup()

		local lexical_config = {
			filetypes = { "elixir", "eelixir", "heex" },
			cmd = { "/home/wiru/.local/bin/lexical/bin/start_lexical.sh" },
			settings = {},
		}
		if not configs.lexical then
			configs.lexical = {
				default_config = {
					filetypes = lexical_config.filetypes,
					cmd = lexical_config.cmd,
					settings = lexical_config.settings,
					root_dir = function(fname)
						return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
					end,
				},
			}
		end

		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
						extraArgs = { "--tests" },
						features = "all",
					},
				},
			},
		})

		lspconfig.tsserver.setup({})
		lspconfig.gleam.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.ocamllsp.setup({})
		lspconfig.elixirls.setup({
			cmd = { "/home/wiru/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
		})
		lspconfig.lexical.setup({})

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		vim.keymap.set("n", "<leader>vrr", "<cmd> lua vim.lsp.buf.references()<cr>")
		vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		vim.keymap.set("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")
		vim.keymap.set("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")
		vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>")
		vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	end,
}
