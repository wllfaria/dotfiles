pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")

local menubar = require("menubar")

RC = {}
RC.vars = require("main.user-variables")

require("main.error-handling")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.wallpaper = RC.vars.wallpaper

modkey = RC.vars.modkey

local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules"),
}

require("deco.notifications")

local keys = {
    globalbuttons = require("keys.globalbuttons"),
    clientbuttons = require("keys.clientbuttons"),
    globalkeys = require("keys.globalkeys"),
    bindtotags = require("keys.bindtotags"),
    clientkeys = require("keys.clientkeys"),
}

RC.layouts = main.layouts()
RC.tags = main.tags()

RC.mainmenu = awful.menu({
    items = main.menu(),
    theme = {
        width = 250,
        height = 30,
        font = "Ubuntu Nerd Font 14",
        bg_normal = "#00000080",
        bg_focus = "#729fcf",
        border_width = 3,
        border_color = "#000000",
    },
})

RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = RC.mainmenu })
menubar.utils.terminal = RC.vars.terminal

RC.globalkeys = keys.globalkeys()
RC.globalkeys = keys.bindtotags(RC.globalkeys)
root.buttons(keys.globalbuttons())
root.keys(RC.globalkeys)

mykeyboardlayout = awful.widget.keyboardlayout()

require("layout.topbar.topbar")
awful.rules.rules = main.rules(keys.clientkeys(), keys.clientbuttons())

require("main.signals")

beautiful.init("~/.config/awesome/themes/theme.lua")
beautiful.useless_gap = 4
require("main.client")

awful.spawn.with_shell("picom --daemon")
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --left-of DP-2")
awful.spawn.with_shell("xrandr --output DP-2 --mode 1920x1080 --rate 240 --primary")
awful.spawn.with_shell("xinput --set-prop 17 'libinput Accel Profile Enabled' 0, 1")
awful.spawn.with_shell("xinput --set-prop 17 'libinput Accel Speed' 0")
