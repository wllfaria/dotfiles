local user = require("user")
local color

local colorschemes = {
    adwaita = require("themes.colors.adwaita"),
}

if user.theme == 'adwaita' then
    color = colorschemes.adwaita
end

return color
