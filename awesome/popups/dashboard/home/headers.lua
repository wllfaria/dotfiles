--Standard Modules
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

--Custom Modules
local color = require("popups.color")
local user = require("popups.user_profile")

-----------------------
--Header text----------
-----------------------
local create_header = function(text)
	local image = wibox.widget({
		image = user.image_path,
		widget = wibox.widget.imagebox,
		resize = true,
		forced_height = dpi(60),
		forced_width = dpi(60),
	})
	local textbox = wibox.widget({
		markup = '<span color="' .. color.blueish_white .. '" font="Ubuntu Nerd Font bold 16">' .. text .. "</span>",
		font = "Ubuntu Nerd Font 14",
		widget = wibox.widget.textbox,
		fg = color.white,
	})

	local header = wibox.widget({
		{
			image,
			{
				{
					{
						textbox,
						widget = wibox.container.margin,
						top = dpi(4),
						left = dpi(12),
						bottom = dpi(4),
						forced_width = dpi(410),
					},
					widget = wibox.container.background,
					bg = color.background_lighter,
					shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, 10)
					end,
				},
				widget = wibox.container.margin,
				left = dpi(12),
			},
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.margin,
		top = dpi(12),
		bottom = dpi(0),
		left = dpi(12),
		right = dpi(12),
		forced_width = dpi(430),
	})

	return header
end

local headers = {
	home = create_header("  Hello " .. user.name),
}

return headers
