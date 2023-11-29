local wibox     = require("wibox")
local awful     = require("awful")
local beautiful = require("beautiful")
local dpi       = require("beautiful").xresources.apply_dpi
local gears     = require("gears")
local bling     = require("modules.bling")
local helpers   = require("helpers")
local playerctl = bling.signal.playerctl.lib {
  ignore = "google-chrome-stable"
}

local art_widget = wibox.widget {
  image = beautiful.songdefpicture,
  opacity = 0.4,
  shape = helpers.rrect(8),
  forced_height = dpi(36),
  forced_width = dpi(255),
  widget = wibox.widget.imagebox,
}

local title_widget = wibox.widget {
    markup = helpers.colorizeText('󰋋 ', beautiful.fg),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local next_widget = wibox.widget {
  align = 'center',
  font = beautiful.icofont .. " 16",
  text = '󰒭',
  widget = wibox.widget.textbox,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      playerctl:next()
    end)
  ),
}

local prev_widget = wibox.widget {
  align = 'center',
  font = beautiful.icofont .. " 16",
  text = '󰒮',
  widget = wibox.widget.textbox,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      playerctl:previous()
    end)
  ),
}

local play_widget = wibox.widget {
  align = 'center',
  font = beautiful.icofont .. " 16",
  markup = helpers.colorizeText('󰐊', beautiful.fg),
  widget = wibox.widget.textbox,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      playerctl:play_pause()
    end)
  ),
}

playerctl:connect_signal("metadata", function(_, title, artist, album_path, album, new, player_name)
  -- Change displaying image when song changes
  art_widget:set_image(helpers.cropSurface(6, gears.surface.load_uncached(album_path)))
  local song_title = title .. " - " .. artist
  local shaped_title = helpers.truncateString(song_title, 20)
  title_widget:set_markup(shaped_title)
end)

playerctl:connect_signal("playback_status", function(_, playing, player_name)
  -- Change Play/Pause button when song is playing
  play_widget.markup = playing and helpers.colorizeText("󰏤", beautiful.fg) or helpers.colorizeText("󰐊", beautiful.fg)
end)

local widget = wibox.widget {
  art_widget,
  {
    {
      widget = wibox.widget.textbox,
    },
    bg = {
      type = "linear",
      from = { 0, 0 },
      to = { 250, 0 },
      stops = { { 0, beautiful.bg .. "00" }, { 1, beautiful.mbg } }
    },
    widget = wibox.container.background,
  },
  {
    {
      title_widget,
      nil,
      { prev_widget, play_widget, next_widget, spacing = 8, layout = wibox.layout.fixed.horizontal },
      layout = wibox.layout.align.horizontal,
    },
    widget = wibox.container.margin,
    left = 6,
    right = 6,
  },
  layout = wibox.layout.stack,
}

return widget
