return {
	dir = "~/code/personal/scheming",
	-- "wllfaria/scheming.nvim",
	config = function()
		local scheming = require("scheming")

		local function to_hex(int)
			return string.format("#%06x", int)
		end

		local colors = {
			normal = "#B77EE0",
			command = "#FB7373",
			visual = "#5FB0FC",
			dim = to_hex(vim.api.nvim_get_hl(0, { name = "Comment" }).fg),
			insert = "#FCCF67",
			white = "#FFFFFF",
			blue = "#5FB0FC",
			yellow = "#FCCF67",
			magenta = "#B77EE0",
			red = "#FB7373",
			green = "#36C692",
		}

		scheming.setup({
			mappings = { toggle = { "<leader>sc" } },
			schemes = {
				radium = {
					package_name = "colors.radium",
				},
				ayu = { mirage = true },
				miasma = {},
				["rose-pine"] = {
					variant = "dawn",
				},

				catppuccin = {
					flavour = "latte",
				},
				"tokyodark",
				"tokyonight",
				"vscode",
				"gruvbuddy",
				"midnight",
				"cyberdream",
				"moonfly",

				gruvbox = {
					contrast = "",
				},
			},
			override_hl = {
				StatusLineModeNormal = { bg = colors.normal, fg = colors.white },
				StatusLineNormalSeparator = { bg = nil, fg = colors.normal },
				StatusLineModeCommand = { bg = colors.command, fg = colors.white },
				StatusLineCommandSeparator = { bg = nil, fg = colors.command },
				StatusLineModeInsert = { bg = colors.insert, fg = colors.white },
				StatusLineInsertSeparator = { bg = nil, fg = colors.insert },
				StatusLineModeVisual = { bg = colors.visual, fg = colors.white },
				StatusLineVisualSeparator = { bg = nil, fg = colors.visual },
				StatusLineGitBranch = { bg = nil, fg = colors.green },
				StatusLineFilename = { bg = nil, fg = colors.dim },
				StatusLineCursor = { bg = nil, fg = colors.green },
				StatusLineCursorPercent = { bg = nil, fg = colors.normal },

				FiletypeLua = { bg = nil, fg = colors.blue },
				FiletypeRust = { bg = nil, fg = colors.yellow },
				FiletypeJs = { bg = nil, fg = colors.yellow },
				FiletypeTs = { bg = nil, fg = colors.blue },
				FiletypeOcaml = { bg = nil, fg = colors.yellow },
				FiletypeC = { bg = nil, fg = colors.blue },
				FiletypeGo = { bg = nil, fg = colors.blue },
				FiletypeGleam = { bg = nil, fg = colors.magenta },
				FileTypeElixir = { bg = nil, fg = colors.magenta },
				FiletypeDir = { bg = nil, fg = colors.yellow },
				FiletypeNone = { bg = nil, fg = colors.red },
			},
		})
	end,
}
