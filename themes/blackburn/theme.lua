--[[                                    ]]--
--                                        -
--    Blackburn Awesome WM 3.5.+ theme    --
--       github.com/copycat-killer        --
--                                        -
--[[                                    ]]--


theme = {}

theme.dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
theme.wallpaper                             = theme.dir .. "/wall.png"
theme.topbar_path                           = "png:" .. theme.dir .. "/icons/topbar/"

theme.font                                  = "Tamsyn 10"
theme.taglist_font                          = "Icons 10"
theme.fg_normal                             = "#D7D7D7"
theme.fg_focus                              = "#F6784F"
theme.bg_normal                             = "#060606" 
theme.bg_focus                              = "#060606" 
theme.fg_urgent                             = "#CC9393"
theme.bg_urgent                             = "#2A1F1E"
theme.border_width                          = "1"
theme.border_normal                         = "#0E0E0E"
theme.border_focus                          = "#404040"

theme.taglist_fg_focus                      = "#F6784F"
theme.taglist_bg_focus                      = "#060606" 
theme.tasklist_fg_focus                     = "#F6784F"
theme.tasklist_bg_focus                     = "#060606" 
theme.textbox_widget_margin_top             = 1
theme.awful_widget_height                   = 14
theme.awful_widget_margin_top               = 2
theme.menu_height                           = "16"
theme.menu_width                            = "140"

theme.menu_submenu_icon                     = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                   = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                 = theme.dir .. "/icons/square_unsel.png"
theme.arrl_lr_pre                           = theme.dir .. "/icons/arrl_lr_pre.png"
theme.arrl_lr_post                          = theme.dir .. "/icons/arrl_lr_post.png"

theme.layout_tile                           = theme.dir .. "/icons/tile.png"
theme.layout_tilegaps                       = theme.dir .. "/icons/tilegaps.png"
theme.layout_tileleft                       = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                     = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                        = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                          = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                          = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                         = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                        = theme.dir .. "/icons/dwindle.png"
theme.layout_max                            = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                     = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                      = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                       = theme.dir .. "/icons/floating.png"

theme.tasklist_floating                     = ""
theme.tasklist_maximized_horizontal         = ""
theme.tasklist_maximized_vertical           = "" 

theme.widget_mail_notify                    = theme.dir .. "/icons/mail_notify.png"
theme.widget_no_net_notify                  = theme.dir .. "/icons/no_net_notify.png"

return theme
