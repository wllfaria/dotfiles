local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local color = require("layout.topbar.colors")
local dpi = beautiful.xresources.apply_dpi
local separator = wibox.widget.textbox("   ")

local ss_tool = require("popups.screen_record.screenshot.main")

local media = require("popups.media_player.main")

local create_button = function(icon)
	local icon_image = wibox.widget({
		widget = wibox.widget.imagebox,
		image = os.getenv("HOME") .. "/.config/awesome/layout/topbar/icons/" .. icon .. ".png",
		resize = true,
		opacity = 1,
	})
	local created_button = wibox.widget({
		{
			icon_image,
			left = dpi(6),
			right = dpi(6),
			top = dpi(6),
			bottom = dpi(6),
			widget = wibox.container.margin,
		},
		bg = color.background_lighter,
		shape = gears.shape.rounded_rect,
		widget = wibox.container.background,
	})
	return created_button
end

local screenshot = create_button("screenshot")
local music = create_button("music-icon")

screenshot:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		ss_tool.visible = not ss_tool.visible
	elseif button == 3 then
		awful.spawn.with_shell(
			'scrot /tmp/screenshot.png && convert /tmp/screenshot.png -resize 20% /tmp/resized_screenshot.png && dunstify -i /tmp/resized_screenshot.png "Screenshot Captured" && cp /tmp/screenshot.png ~/Pictures/file1_`date +"%Y%m%d_%H%M%S"`.png && rm /tmp/resized_screenshot.png && rm /tmp/screenshot.png'
		)
	end
end)

music:connect_signal("button::release", function()
	media.visible = not media.visible
end)

local grouped_buttons = wibox.widget({
	{
		{
			separator,
			music,
			separator,
			screenshot,
			separator,
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.background,
		shape = gears.shape.rounded_rect,
		bg = color.background_lighter,
	},
	left = dpi(3),
	right = dpi(3),
	top = dpi(3),
	bottom = dpi(3),
	widget = wibox.container.margin,
})

return grouped_buttons
