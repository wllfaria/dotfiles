local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful") -- for awesome.icon

local M = {} -- menu
local _M = {} -- module

local terminal = RC.vars.terminal
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
	{
		"Hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "Manual", terminal .. " -e man awesome" },
	{ "Edit config", editor_cmd .. " " .. awesome.conffile },
	{ "Terminal", terminal },
	{ "Shutdown/Logout", "oblogout" },
	{ "Restart", awesome.restart },
	{
		"Quit",
		function()
			awesome.quit()
		end,
	},
}

M.network_main = {
	{ "wicd-curses", "wicd-curses" },
	{ "wicd-gtk", "wicd-gtk" },
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	local menu_items = {
		{ "Awesome", M.awesome, beautiful.awesome_subicon },
		{ "Open Terminal", terminal },
		{ "Change Wallpaper", "nitrogen" },
	}

	return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get()
	end,
})
