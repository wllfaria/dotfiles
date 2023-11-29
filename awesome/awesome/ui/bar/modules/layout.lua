local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require('helpers')
local gears = require("gears")

local layouts = awful.widget.layoutbox()
layouts:buttons(
  gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc(-1) end),
    awful.button({ }, 5, function () awful.layout.inc(1) end)
  )
)

local widget = {
  {
    {
      layouts,
      clip_shape = helpers.rrect(3),
      widget = wibox.container.margin
    },
    margins = (beautiful.barDir == "top" or "bottom") and 10 or 10,
    widget = wibox.container.margin
  },
  bg = beautiful.bg2,
  widget = wibox.container.background
}
return widget
