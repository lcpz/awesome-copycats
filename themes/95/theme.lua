
--[[
                               
     95 Awesome WM config      
     github.com/copycat-killer 
                               
--]]

theme                               = {}

theme.dir                           = os.getenv("HOME") .. "/.config/awesome/themes/95"
theme.wallpaper                     = theme.dir .. "/wall.png"
theme.bottombar_path                = "png:" .. theme.dir .. "/icons/bottombar/"

theme.font                          = "Tamsyn 10.5"
theme.fg_normal                     = "#000000"
theme.fg_focus                      = "#F6784F"
theme.bg_normal                     = "#060606"
theme.bg_focus                      = "#060606"
theme.fg_urgent                     = "#CC9393"
theme.bg_urgent                     = "#2A1F1E"
theme.border_width                  = "1"
theme.border_normal                 = "#0E0E0E"
theme.border_focus                  = "#F79372"

theme.taglist_fg_focus              = "#FFFFFF"
theme.taglist_bg_focus              = "#0404FC"
theme.tasklist_fg_focus             = "#000000"
theme.tasklist_fg_normal            = "#000000"
theme.tasklist_bg_focus             = "png:" .. theme.dir .. "/icons/bottombar/focus.png"
theme.tasklist_bg_normal            = "png:" .. theme.dir .. "/icons/bottombar/normal.png"
theme.menu_height                   = "16"
theme.menu_width                    = "140"

theme.menu_submenu_icon             = theme.dir .. "/icons/submenu.png"

theme.layout_tile                   = theme.dir .. "/icons/tile.png"
theme.layout_tileleft               = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom             = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                  = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                  = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                 = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                = theme.dir .. "/icons/dwindle.png"
theme.layout_max                    = theme.dir .. "/icons/max.png"
theme.layout_fullscreen             = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier              = theme.dir .. "/icons/magnifier.png"
theme.layout_floating               = theme.dir .. "/icons/floating.png"

return theme
