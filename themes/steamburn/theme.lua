--[[
                                     
     Steamburn Awesome WM config 2.0 
     github.com/copycat-killer       
                                     
--]]

theme                               = {}

themes_dir                          = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
theme.wallpaper                     = themes_dir .. "/wall.png"

theme.font                          = "Tamsyn 10.5"
theme.fg_normal                     = "#cdcdcd"
theme.fg_focus                      = "#d79d38"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = "#140c0b"
theme.bg_focus                      = "#140c0b"
theme.bg_urgent                     = "#2a1f1e"
theme.border_width                  = "1"
theme.border_normal                 = "#140c0f"
theme.border_focus                  = "#915543"
theme.border_marked                 = "#CC9393"
theme.taglist_fg_focus              = "#d47456"
theme.tasklist_bg_focus             = "#140c0b"
theme.tasklist_fg_focus             = "#d47456"
theme.menu_height                   = "16"
theme.menu_width                    = "140"

theme.layout_txt_tile               = "[t]"
theme.layout_txt_tileleft           = "[l]"
theme.layout_txt_tilebottom         = "[b]"
theme.layout_txt_tiletop            = "[tt]"
theme.layout_txt_fairv              = "[fv]"
theme.layout_txt_fairh              = "[fh]"
theme.layout_txt_spiral             = "[s]"
theme.layout_txt_dwindle            = "[d]"
theme.layout_txt_max                = "[m]"
theme.layout_txt_fullscreen         = "[F]"
theme.layout_txt_magnifier          = "[M]"
theme.layout_txt_floating           = "[|]"

theme.menu_submenu_icon             = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_unsel.png"

theme.tasklist_disable_icon         = true
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

return theme
