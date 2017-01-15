
--[[
                                     
     Steamburn Awesome WM config 3.0 
     github.com/copycat-killer       
                                     
--]]

local theme                                     = {}

theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
themes_dir                                      = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                                 = themes_dir .. "/wall.png"

theme.font                                      = "Tamsyn 10.5"

theme.fg_normal                                 = "#e2ccb0"
theme.fg_focus                                  = "#d88166"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#140c0b"
theme.bg_focus                                  = "#140c0b"
theme.bg_urgent                                 = "#2a1f1e"
theme.border_width                              = 1
theme.border_normal                             = "#302627"
theme.border_focus                              = "#c2745b"
theme.border_marked                             = "#CC9393"
theme.taglist_fg_focus                          = "#d88166"
theme.tasklist_bg_focus                         = "#140c0b"
theme.tasklist_fg_focus                         = "#d88166"
theme.taglist_squares_sel                       = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = themes_dir .. "/icons/square_unsel.png"

theme.menu_height                               = 16
theme.menu_width                                = 140
theme.menu_submenu_icon                         = themes_dir .. "/icons/submenu.png"

theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.useless_gap                               = 0

theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

return theme
