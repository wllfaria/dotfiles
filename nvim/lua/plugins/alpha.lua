local headers = require "plugins.helpers.alpha-headers"

return {
	'goolord/alpha-nvim',
	config = function ()
		local alpha = require "alpha"
		local dashboard = require "alpha.themes.dashboard"
		math.randomseed(os.time())

		local function pick_color()
			local colors = {"String", "Identifier", "Keyword", "Number"}
			return colors[math.random(#colors)]
		end

		local function make_header(color)
			return {
				type = "text",
				val = headers[math.random(#headers)],
				opts = { position = "center", hl = color }
			}
		end

		local function make_footer(color)
			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
			return {
				type = "text",
				val = datetime .. nvim_version_info,
				opts = { hl = color, position = "center" }
			}
		end

		local function make_buttons()
			return {
				type = "group",
				val = {
					{ type = "text", val = "Quick Actions", opts = { position = 'center' } },
					{ type = 'padding', val = 1 },
					dashboard.button("<Leader>b", 					"  File Explorer"),
					dashboard.button("<Leader>f", 					"  Find File"),
					dashboard.button("<Leader>r", 					"  Recent Files"),
					dashboard.button("q", 									"  Quit", ":qa<cr>"),
				}
			}
		end

		local chosen_color = pick_color()
		local header = make_header(chosen_color)
		local buttons = make_buttons()
		local footer = make_footer(chosen_color)

		alpha.setup {
			layout = {
				{ type = "padding", val = 2 },
				header,
				{ type = "padding", val = 2 },
				buttons,
				{ type = "padding", val = 2 },
				footer,
			}
		}
	end
}
