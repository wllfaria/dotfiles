local M         = {}
local awful     = require("awful")
local gears     = require("gears")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local helpers   = require("helpers")

M.launcher = wibox.widget {
  {
    image = beautiful.nixlogo,
    opacity = 0.7,
    forced_height = 22,
    forced_width = 22,
    resize = true,
    widget = wibox.widget.imagebox,
  },
  top = 12,
  left = 6,
  bottom = 6,
  widget = wibox.container.margin,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      awesome.emit_signal("toggle::dashboard")
    end)
  )
}

M.powerbutton = wibox.widget {
  {
    {
      {
        font = beautiful.icofont .. " 16",
        markup = helpers.colorizeText('󰐥', beautiful.err),
        widget = wibox.widget.textbox,
      },
      margins = 6,
      right = 9,
      widget = wibox.container.margin
    },
    bg = beautiful.bg2,
    widget = wibox.container.background
  },
  widget = wibox.container.margin,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      awesome.emit_signal('show::exit')
    end)
  )
}

return M
