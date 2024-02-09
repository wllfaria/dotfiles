local color                                 = require("themes.colors")

local theme                                 = {}

theme.useless_gap                           = 4
theme.font                                  = "CaskaydiaCove NerdFont 12"

local layout_path                           = "/usr/share/awesome/themes/default/layouts/"

-------------------------
--Colors-----------------
-------------------------
theme.fg                                    = color.fg_normal
theme.bg                                    = color.bg_dark
theme.bg_normal                             = color.bg_dark
theme.fg_normal                             = color.mid_light
theme.bg_focus                              = color.mid_dark
theme.fg_focus                              = color.fg_normal
theme.border_width                          = 1
theme.border_normal                         = "#000000"
theme.border_focus                          = "#535d6c"
theme.logout_box_bg                         = "#00000090"

--------------------------
--Layout icons------------
--------------------------
theme.layout_fairh                          = layout_path .. "fairhw.png"
theme.layout_fairv                          = layout_path .. "fairvw.png"
theme.layout_floating                       = layout_path .. "floatingw.png"
theme.layout_magnifier                      = layout_path .. "magnifierw.png"
theme.layout_max                            = layout_path .. "maxw.png"
theme.layout_fullscreen                     = layout_path .. "fullscreenw.png"
theme.layout_tilebottom                     = layout_path .. "tilebottomw.png"
theme.layout_tileleft                       = layout_path .. "tileleftw.png"
theme.layout_tile                           = layout_path .. "tilew.png"
theme.layout_tiletop                        = layout_path .. "tiletopw.png"
theme.layout_spiral                         = layout_path .. "spiralw.png"
theme.layout_dwindle                        = layout_path .. "dwindlew.png"
theme.layout_cornernw                       = layout_path .. "cornernw.png"
theme.layout_cornerne                       = layout_path .. "cornerne.png"
theme.layout_cornersw                       = layout_path .. "cornersw.png"
theme.layout_cornerse                       = layout_path .. "cornerse.png"

------------------------
--Taglist---------------
------------------------
theme.taglist_bg_empty                      = color.bg_dark
theme.taglist_fg_empty                      = color.mid_normal
theme.taglist_bg_occupied                   = color.bg_dark
theme.taglist_fg_occupied                   = color.fg_normal
theme.taglist_bg_focus                      = color.bg_light
theme.taglist_fg_focus                      = color.cyan
theme.taglist_fg_urgent                     = color.yellow

theme.taglist_spacing                       = 3
theme.taglist_font                          = "CaskaydiaCove NerdFont 14"

------------------------
--Tasklist--------------
------------------------
theme.tasklist_bg_minimize                  = color.bg_normal
theme.tasklist_bg_focus                     = color.bg_normal
theme.tasklist_shape_border_width           = 3
theme.tasklist_shape_border_color           = color.bg_normal
theme.tasklist_shape_border_color_focus     = color.cyan
theme.tasklist_shape_border_color_minimized = color.magenta
theme.tasklist_shape_border_color_urgent    = color.yellow

return theme
