--[[
                                   
     Dremora Awesome WM config 2.0 
     github.com/copycat-killer     
                                   
--]]

theme                               = {}

theme.dir                           = os.getenv("HOME") .. "/.config/awesome/themes/dremora"
theme.wallpaper                     = theme.dir .. "/wall.png"

theme.font                          = "Tamsyn 10.5"
theme.taglist_font                  = "Icons 10"
theme.fg_normal                     = "#747474"
theme.fg_focus                      = "#DDDCFF"
theme.bg_normal                     = "#121212"
theme.bg_focus                      = "#121212"
theme.fg_urgent                     = "#CC9393"
theme.bg_urgent                     = "#2A1F1E"
theme.border_width                  = "0"
theme.border_normal                 = "#121212"
theme.border_focus                  = "#292929"
theme.titlebar_bg_focus             = "#292929"

theme.taglist_fg_focus              = "#dddcff"
theme.taglist_bg_focus              = "#121212"
theme.menu_height                   = "16"
theme.menu_width                    = "140"

theme.submenu_icon                  = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = theme.dir .. "/icons/square_unsel.png"
theme.arrl_lr_pre                   = theme.dir .. "/icons/arrl_lr_pre.png"
theme.arrl_lr_post                  = theme.dir .. "/icons/arrl_lr_post.png"

theme.layout_tile                   = theme.dir .. "/icons/tile.png"
theme.layout_tilegaps               = theme.dir .. "/icons/tilegaps.png"
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

theme.tasklist_disable_icon         = true
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

-- lain related
theme.useless_gap_width             = 10
theme.layout_uselesstile            = theme.dir .. "/icons/uselesstile.png"
theme.layout_uselesstileleft        = theme.dir .. "/icons/uselesstileleft.png"
theme.layout_uselesstiletop         = theme.dir .. "/icons/uselesstiletop.png"

return theme
