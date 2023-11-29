return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require "nvim-treesitter.configs".setup {
			ensure_installed = {
				"lua",
				"typescript",
				"javascript",
				"python",
				"cpp",
			},
			sync_install = false,
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = false,
				disable = {},
			}
		}
	end
}
