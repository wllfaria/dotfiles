local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local user = require("user")
local color = require("themes.colors")

local logo = wibox.widget({
    {
        {
            widget = wibox.widget.imagebox,
            image = user.user_img,
            resize = true,
            opacity = 1,
        },
        left = dpi(7),
        right = dpi(7),
        top = dpi(4),
        bottom = dpi(4),
        widget = wibox.container.margin,
    },
    bg = color.bg_dark,
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
})
return logo
