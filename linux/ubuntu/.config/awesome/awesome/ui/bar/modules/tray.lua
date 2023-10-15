-- THIS WAS ENTIRELY WRITTEN BY ME SO IT WILL CONTAIN UNREADABEL / WORST CODE EVER SEEN

local awful       = require("awful")
local gears       = require("gears")
local beautiful   = require("beautiful")
local helpers     = require("helpers")
local wibox       = require("wibox")
local dpi         = require("beautiful").xresources.apply_dpi

-- TOGGLER

local togglertext = wibox.widget {
  font = beautiful.icofont .. " 20",
  text = "󰅁",
  valign = "center",
  align = "center",
  widget = wibox.widget.textbox,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      awesome.emit_signal('systray::toggle')
    end)
  )
}

-- TRAY

local systray     = wibox.widget {
  {
    widget = wibox.widget.systray,
  },
  top = dpi(9),
  bottom = dpi(9),
  visible = false,
  left = dpi(9),
  right = dpi(9),
  widget = wibox.container.margin
}

awesome.connect_signal('systray::toggle', function()
  if systray.visible then
    systray.visible = false
    togglertext.text = '󰅁'
  else
    systray.visible = true
    togglertext.text = '󰅂'
  end
end)

local widget = wibox.widget {
  {
    {
      systray,
      togglertext,
      layout = wibox.layout.fixed.horizontal,
    },
    shape = helpers.rrect(2),
    bg = beautiful.bg2,
    widget = wibox.container.background,
  },
  margins = 0,
  widget  = wibox.container.margin,
}
return widget
