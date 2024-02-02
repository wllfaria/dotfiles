local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local color = require("layout.topbar.colors")

local function make_logo(s)
	local dashboard = require("popups.dashboard.home.main")(s)
	local logo = wibox.widget({
		{
			{
				widget = wibox.widget.imagebox,
				image = os.getenv("HOME") .. "/.config/awesome/layout/topbar/icons/awesome-config-logo.jpg",
				resize = true,
				opacity = 1,
			},
			left = dpi(7),
			right = dpi(7),
			top = dpi(7),
			bottom = dpi(7),
			widget = wibox.container.margin,
		},
		bg = color.background_dark,
		shape = gears.shape.rounded_rect,
		widget = wibox.container.background,
	})

	logo:connect_signal("button::release", function()
		dashboard.visible = not dashboard.visible
	end)
	return logo
end

return make_logo
