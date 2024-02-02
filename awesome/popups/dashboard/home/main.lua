--Standard Modules
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local color = require("popups.color")

local make_dashboard = function(s)
	local header = require("popups.dashboard.home.headers")

	local calendar = require("popups.dashboard.home.widgets.calendar")
	local exit = require("popups.dashboard.home.widgets.exit")

	local Separator = wibox.widget.textbox("    ")
	Separator.forced_height = 950
	Separator.forced_width = 440

	local dashboard_home = awful.popup({
		screen = s,
		widget = wibox.container.background,
		ontop = true,
		bg = "#00000000",
		visible = false,
		forced_width = 450,
		maximum_height = 950,
		placement = function(c)
			awful.placement.top_left(c, { margins = { top = dpi(43), bottom = dpi(8), left = dpi(8), right = dpi(8) } })
		end,
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 0)
		end,
		opacity = 1,
	})

	local home = wibox.widget({
		header.home,
		calendar,
		exit,
		layout = wibox.layout.fixed.vertical,
	})

	dashboard_home:setup({
		{
			home,
			layout = wibox.layout.stack,
		},
		widget = wibox.container.background,
		bg = color.background_dark,
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 10)
		end,
	})
	return dashboard_home
end

return make_dashboard
