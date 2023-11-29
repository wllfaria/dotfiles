return {
	'norcalli/nvim-colorizer.lua',
	config = function()
		local colorizer = require "colorizer"
		colorizer.setup({
			'css',
			'lua',
			'javascript',
			'typescript',
			'javascriptreact',
			'typescriptreact',
		})
	end
}
