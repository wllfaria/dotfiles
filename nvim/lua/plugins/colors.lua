local is_transparent = true

if is_transparent then
	vim.opt.fillchars:append({
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
				-- vim.cmd("colorscheme gruvbox")
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
			-- vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.adwaita_darker = true
			vim.g.adwaita_disable_cursorline = true
			vim.g.adwaita_transparent = true
			-- vim.cmd("colorscheme adwaita")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},

				overrides = function(colors)
					local theme = colors.theme
					return {
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
}
