return {
  "williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
  config = function()
    local mason = require "mason"
		local mason_lspconfig = require "mason-lspconfig"
		local lspconfig = require "lspconfig"

		mason.setup()
		mason_lspconfig.setup({
			"lua_ls",
			"tsserver",
			"emmet_ls",
			"clangd",
			"gdtoolkit",
			"omnisharp",
			"codelldb",
		})

		mason_lspconfig.setup_handlers {
			function (server_name)
				lspconfig[server_name].setup {}
			end,
		}
  end
}
