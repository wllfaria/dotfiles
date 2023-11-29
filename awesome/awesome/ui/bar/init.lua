local awful       = require("awful")
local beautiful   = require("beautiful")
local wibox       = require("wibox")
local dpi         = require("beautiful").xresources.apply_dpi
local helpers     = require("helpers")

local taglist     = require("ui.bar.modules.tags")
local layoutbox   = require("ui.bar.modules.layout")
local systraybox  = require("ui.bar.modules.tray")
local time        = require("ui.bar.modules.time")
local status      = require("ui.bar.modules.status")
local launcher    = require("ui.bar.modules.misc").launcher
local powerbutton = require("ui.bar.modules.misc").powerbutton
local music       = require("ui.bar.modules.music")

local barMargin   = beautiful.barShouldHaveGaps and beautiful.barPadding or 0
local barheight   = dpi(beautiful.barSize) - 5
local alignlayout = wibox.layout.align.horizontal
local fixedlayout = wibox.layout.fixed.horizontal

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
  -- Create a table of tags for each screen
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  local wibar = awful.wibar {
    position                    = beautiful.barDir,
    height                      = barheight,
    screen                      = s,
    ontop                       = false,
    shape                       = barMargin == 0 and helpers.rrect(0) or helpers.rrect(5),
    bg                          = beautiful.bg,
    fg                          = beautiful.fg1,
    margins = {
      bottom = beautiful.barDir == 'top' and 0 or math.ceil(barMargin / 2),
      left = beautiful.barDir == 'right' and 0 or math.ceil(barMargin / 2),
      right = beautiful.barDir == 'left' and 0 or math.ceil(barMargin / 2),
      top = beautiful.barDir == 'bottom' and 0 or math.ceil(barMargin / 2),
    },
  }

  -- Setting up the layout of the widgets
  wibar:setup {
    expand = 'none',
    layout = alignlayout,
    {
      -- Left Widgets
      layout = fixedlayout,
      launcher,
      {
        {
          {
            {
              taglist(s),
              widget = wibox.container.margin,
              margins = (beautiful.barDir == "top" or "bottom") and 8 or dpi(15),
            },
            widget = wibox.container.margin,
          },
          bg = beautiful.bg2,
          widget = wibox.container.background
        },
        widget = wibox.container.place
      },
      spacing = 8,
    },
    top = dpi(8),
    bottom = dpi(5),
    right = dpi(7),
    left = dpi(7),
    widget = wibox.container.place,
    {
      -- Middle spacing
      music,
      widget = wibox.container.place,
    },
    { -- Right widgets
      {
        systraybox,
        status,
        time,
        layoutbox,
        powerbutton,
        spacing = 7,
        layout = fixedlayout,
      },
      top = dpi(8),
      bottom = dpi(5),
      right = dpi(7),
      left = dpi(7),
      widget = wibox.container.margin
    },
  }
end)

