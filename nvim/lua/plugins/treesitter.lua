return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.parsers").get_parser_configs().asm = {
			install_info = {
				url = "https://github.com/rush-rs/tree-sitter-asm.git",
				files = { "src/parser.c" },
				branch = "main",
			},
		}
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"typescript",
				"javascript",
				"python",
				"cpp",
				"asm",
			},
			sync_install = false,
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = false,
				disable = {},
			},
		})
	end,
}
