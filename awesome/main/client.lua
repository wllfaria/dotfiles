local awful = require("awful")

client.connect_signal("focus", function(c)
	c.border_color = "#1a1b26"
end)
client.connect_signal("unfocus", function(c)
	c.border_color = "#1a1b26"
end)
-- }}}
client.connect_signal("focus", function(c)
	c.border_width = 5
end)
client.connect_signal("unfocus", function(c)
	c.border_width = 5
end)
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	if not awesome.startup then
		awful.client.setslave(c)
	end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

--Grab the focus on opened window when swotching workspaces
tag.connect_signal("property::selected", function(t)
	local selected = tostring(t.selected) == "false"
	if selected then
		local focus_timer = timer({ timeout = 0.2 })
		focus_timer:connect_signal("timeout", function()
			local c = awful.mouse.client_under_pointer()
			if not (c == nil) then
				client.focus = c
				c:raise()
			end
			focus_timer:stop()
		end)
		focus_timer:start()
	end
end)

local last_focused_client = nil

client.connect_signal("focus", function(c)
	last_focused_client = c
end)

client.connect_signal("unmanage", function(c)
	local screen = awful.screen.focused()
	if screen then
		local clients = screen.clients
		if #clients > 0 then
			local index = #clients
			while index > 0 and clients[index] == c do
				index = index - 1
			end
			local client_to_focus = clients[index] or last_focused_client or clients[#clients]
			client.focus = client_to_focus
			client_to_focus:raise()
		end
	end
end)
