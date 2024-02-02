local awful = require("awful")
local wibox = require("wibox")
local mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    s.mywibox = awful.wibar({ position = "bottom", screen = s })
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        {             -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
