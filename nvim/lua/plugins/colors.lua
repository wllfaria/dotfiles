require("core.helpers.globals")

local is_transparent = true

if is_transparent then
	opt.fillchars:append({
		horiz = " ",
		horizup = " ",
		horizdown = " ",
		vert = " ",
		vertleft = " ",
		vertright = " ",
		verthoriz = " ",
		eob = " ",
	})
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			local gruvbox = require("gruvbox")
			gruvbox.setup({
				terminal_colors = true,
				contrast = "hard",
				transparent_mode = is_transparent,
				-- cmd("colorscheme gruvbox")
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			if is_transparent then
				require("tokyonight").setup({
					transparent = true,
					styles = {
						sidebars = "transparent",
						floats = "transparent",
					},
				})
			end
			-- cmd("colorscheme tokyonight")
		end,
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			g.adwaita_darker = true
			g.adwaita_disable_cursorline = true
			g.adwaita_transparent = true
			cmd("colorscheme adwaita")
		end,
	},
}
