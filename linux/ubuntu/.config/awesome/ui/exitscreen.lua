local awful           = require("awful")
local wibox           = require("wibox")
local gears           = require("gears")
local beautiful       = require("beautiful")
local dpi             = beautiful.xresources.apply_dpi
local helpers         = require("helpers")
local gfs             = require("gears.filesystem")

local powerofficon    = "󰐥 "
local rebooticon      = "󰦛 "
local suspendicon     = "󰤄 "
local exiticon        = "󰈆 "
local lockicon        = "󰍁 "

local poweroffcommand = function()
  awful.spawn.with_shell("poweroff")
  awesome.emit_signal('hide::exit')
end

local rebootcommand   = function()
  awful.spawn.with_shell("reboot")
  awesome.emit_signal('hide::exit')
end

local suspendcommand  = function()
  awesome.emit_signal('hide::exit')
  awful.spawn.with_shell("systemctl suspend")
end

local exitcommand     = function()
  awesome.quit()
end

local lockcommand     = function()
  awesome.emit_signal('hide::exit')
  awesome.emit_signal('toggle::lock')
end

local close           = wibox.widget {
  {
    font = beautiful.icofont .. " 24",
    markup = helpers.colorizeText('X', beautiful.err),
    widget = wibox.widget.textbox,
  },
  widget = wibox.container.place,
  halign = 'left',
  buttons = gears.table.join(
    awful.button({}, 1, function()
      awesome.emit_signal('hide::exit')
    end)
    ),
}

local createButton    = function(icon, cmd, name)
  local button = wibox.widget {
    {
      {
        {
          id = 'text_role',
          align = 'center',
          font = beautiful.icofont .. " 32",
          markup = helpers.colorizeText(icon, '#ffffff'),
          widget = wibox.widget.textbox
        },
        left = 40,
        top = 40,
        right = 22,
        bottom = 40,
        widget = wibox.container.margin
      },
      shape = helpers.rrect(10),
      bg = '#ffffff' .. '10',
      buttons = gears.table.join(
        awful.button({}, 1, function()
          cmd()
        end)
        ),
      widget = wibox.container.background
    },
    {
      id = 'text_role',
      align = 'center',
      font = beautiful.sans .. " Bold 16",
      markup = helpers.colorizeText(name, '#ffffff'),
      widget = wibox.widget.textbox
    },
    spacing = 20,
    layout = wibox.layout.fixed.vertical
  }
  return button
end



local poweroffbutton = createButton(powerofficon, poweroffcommand, "Poweroff")
local rebootbutton = createButton(rebooticon, rebootcommand, "Reboot")
local lockbutton = createButton(lockicon, lockcommand, "Lock")
local suspendbutton = createButton(suspendicon, suspendcommand, "Sleep")
local exitbutton = createButton(exiticon, exitcommand, "Exit")


local box = wibox.widget {
  {
    {
      {
        {
          {
            widget        = wibox.container.background,
            border_width  = dpi(0),
            forced_width  = dpi(100),
            forced_height = dpi(100),
            shape         = helpers.rrect(200),
            border_color  = '#ffffff'
          },
          widget = wibox.container.place,
          halign = 'center',
        },
        {
          markup = helpers.colorizeText("Wiru", beautiful.fg),
          font = beautiful.sans .. " Semibold 16",
          align = 'center',
          valign = 'center',
          widget = wibox.widget.textbox,
        },
        layout = wibox.layout.fixed.vertical,
        spacing = 10,
      },
      {
        markup = helpers.colorizeText("Choose Wisely, Explorer!", beautiful.fg),
        font = beautiful.sans .. " Light 46",
        align = 'center',
        valign = 'center',
        widget = wibox.widget.textbox,
      },
      {
        {
          poweroffbutton,
          rebootbutton,
          lockbutton,
          suspendbutton,
          exitbutton,
          layout = wibox.layout.fixed.horizontal,
          spacing = 40,
        },
        widget = wibox.container.margin,
        top = 40,
      },
      spacing = 0,
      layout = wibox.layout.fixed.vertical
    },
    widget = wibox.container.place,
    halign = 'center',
  },
  widget = wibox.container.margin,
  bottom = 80,
}
local exit_screen_grabber = awful.keygrabber({
  auto_start = true,
  stop_event = "release",
  keypressed_callback = function(_, _, key, _)
    if key == "s" then
      suspendcommand()
    elseif key == "e" then
      exitcommand()
    elseif key == "l" then
      lockcommand()
    elseif key == "p" then
      poweroffcommand()
    elseif key == "r" then
      rebootcommand()
    elseif key == "Escape" or key == "q" or key == "x" then
      awesome.emit_signal("hide::exit")
    end
  end,
})

awful.screen.connect_for_each_screen(function(s)
  if s.index == 2 then
    return
  end
  local exit = wibox({
    shape = helpers.rrect(0),
    screen = s,
    width = beautiful.scrwidth,
    height = beautiful.scrheight,
    bg = beautiful.bg .. 'CC',
    ontop = true,
    visible = false,
  })
  local back = wibox.widget {
    id = "bg",
    widget = wibox.widget.textbox,
    forced_height = beautiful.scrheight,
    forced_width = beautiful.scrwidth,
    horizontal_fit_policy = "fit",
    vertical_fit_policy = "fit",
  }
  exit:setup {
    back,
    {
      {
        close,
        box,
        nil,
        expand = 'none',
        layout = wibox.layout.align.vertical,
      },
      margins = dpi(15),
      widget = wibox.container.margin,
    },
    layout = wibox.layout.stack
  }
  local makeImage = function()
    os.execute("mkdir -p ~/.cache/awesome/blur/")
    local cmd = 'convert ' ..
        beautiful.wallpaper .. ' -modulate 50 -filter Gaussian -blur 0x6 ~/.cache/awesome/blur/' .. require('theme.colors')
        .ow
    awful.spawn.easy_async_with_shell(cmd, function()
      local blurwall = gfs.get_cache_dir() .. "blur/" .. require('theme.colors').ow
      back.image = blurwall
    end)
  end
  makeImage()
  awful.placement.centered(exit)
  awesome.connect_signal("toggle::exit", function()
    if exit.visible then
      exit_screen_grabber:stop()
      exit.visible = false
    else
      exit.visible = true
      exit_screen_grabber:start()
    end
  end)
  awesome.connect_signal("show::exit", function()
    exit_screen_grabber:start()
    exit.visible = true
  end)
  awesome.connect_signal("hide::exit", function()
    exit_screen_grabber:stop()
    exit.visible = false
  end)
end)
