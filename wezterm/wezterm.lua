local wezterm = require('wezterm')
local config = {}

config.font = wezterm.font_with_fallback({
  {
    family = 'Rec Mono Casual',
    harfbuzz_features = {
      'calt=1',
      'clig=1',
      'liga=1',
      'ss01=1',
      'ss02=1',
      'ss03=1',
      'ss04=1',
      'ss05=1',
      'ss06=1',
      'ss07=1',
      'ss08=1',
    },
  },
  {
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = {
      'calt=1',
      'clig=1',
      'liga=1',
      'ss01=1',
      'ss02=1',
      'ss03=1',
      'ss04=1',
      'ss05=1',
      'ss06=1',
      'ss07=1',
      'ss08=1',
    },
  },
})

config.font_size = 18.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.enable_tab_bar = false

local colors = {
  kanagawa_wave = {
    foreground = '#dcd7ba',
    background = '#1f1f28',
    cursor_bg = '#c8c093',
    cursor_fg = '#1f1f28',
    cursor_border = '#c8c093',
    selection_fg = '#c8c093',
    selection_bg = '#2d4f67',
    scrollbar_thumb = '#16161d',
    split = '#16161d',
    indexed = { [16] = '#ffa066', [17] = '#ff5d62' },
    ansi = { '#090618', '#c34043', '#76946a', '#c0a36e', '#7e9cd8', '#957fb8', '#6a9589', '#c8c093' },
    brights = { '#727169', '#e82424', '#98bb6c', '#e6c384', '#7fb4ca', '#938aa9', '#7aa89f', '#dcd7ba' },
  },
  kanagawa_dragon = {
    background = '#181616',
    cursor_bg = '#C8C093',
    cursor_border = '#DCD7BA',
    cursor_fg = '#181616',
    selection_fg = '#c8c093',
    selection_bg = '#2d4f67',
    foreground = '#C5C9C5',
    indexed = {},
    ansi = { '#0D0C0C', '#C4746E', '#8A9A7B', '#C4B28A', '#8BA4B0', '#A292A3', '#8EA4A2', '#C8C093' },
    brights = { '#A6A69C', '#E46876', '#87A987', '#E6C384', '#7FB4CA', '#938AA9', '#7AA89F', '#C5C9C5' },
  },
}

local keys = {
  { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment },
  { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment },
}
config.keys = keys

config.colors = require('themes.vague')

return config
