local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local deco = {
    taglist = require("deco.taglist"),
    tasklist = require("deco.tasklist"),
}

local taglist_buttons = deco.taglist()
local tasklist_buttons = deco.tasklist()
local color = require("themes.colors")

local separator = wibox.widget.textbox("     ")
local calendar_widget = require("deco.calendar")

mytextclock = wibox.widget.textclock(
    '<span color="' .. color.fg_normal .. '" font="Ubuntu Nerd Font Bold 13"> %a %b %d, %H:%M </span>',
    10
)

local cw = calendar_widget({
    theme = "nord",
    placement = "bottom_right",
    start_sunday = true,
    radius = 8,
    previous_month_button = 1,
    padding = 5,
    next_month_button = 3,
})

mytextclock:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
        cw.toggle()
    end
end)

awful.screen.connect_for_each_screen(function(s)
    local profile_img = require("layout.topbar.profile_img")
    local fancy_taglist = require("fancy_taglist")
    mytaglist = fancy_taglist.new({
        screen = s,
        taglist = { buttons = taglist_buttons },
        tasklist = { buttons = tasklist_buttons },
        filter = awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.rounded_rect,
        },
    })

    fancy_taglist = wibox.widget({
        {
            mytaglist,
            widget = wibox.container.background,
            shape = gears.shape.rounded_rect,
            bg = color.bg_light,
        },
        left = dpi(3),
        right = dpi(3),
        top = dpi(3),
        bottom = dpi(3),
        widget = wibox.container.margin,
    })
    local mywibox = awful.wibar({
        position = "bottom",
        margins = { top = dpi(0), left = dpi(0), right = dpi(0), bottom = 0 },
        screen = s,
        height = dpi(35),
        opacity = 1,
        fg = color.lightblue,
        bg = "#00000000",
    })

    --Main Wibar
    mywibox:setup({
        {
            layout = wibox.layout.stack,
            expand = "none",
            {
                layout = wibox.layout.align.horizontal,
                {
                    -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    separator,
                    profile_img,
                    separator,
                    fancy_taglist,
                    separator,
                },
                nil,
                {
                    -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    mytextclock,
                    separator,
                },
            },
        },
        widget = wibox.container.background,
        bg = color.bg_dark,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 0)
        end,
    })
end)
