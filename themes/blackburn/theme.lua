--[[                                        ]]--
--                                            -
--    Blackburn Awesome WM 3.5.+ theme        --
--       github.com/copycat-killer            --
--                                            -
--[[                                        ]]--


theme = {}

themes_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
themes_bg_normal                            = "png:" .. themes_dir .. "/taskbar/bg_normal2.png"
themes_bg_focus                             = "png:" .. themes_dir .. "/taskbar/bg_focus.png"

theme.wallpaper                             = themes_dir .. "/wall.png"

theme.font                                  = "Tamsyn 10"
theme.taglist_font                          = "Icons 10"
theme.fg_normal                             = "#D7D7D7"
theme.fg_focus                              = "#F6784F"
theme.bg_normal                             = themes_bg_normal
theme.bg_focus                              = "#060606"
theme.fg_urgent                             = "#CC9393"
theme.bg_urgent                             = "#2A1F1E"
theme.border_width                          = "1"
theme.border_normal                         = "#0E0E0E"
theme.border_focus                          = "#404040"

theme.titlebar_bg_focus                     = "#FFFFFF"
theme.titlebar_bg_normal                    = "#FFFFFF"
theme.taglist_fg_focus                      = "#F6784F"
theme.taglist_bg_focus                      = themes_bg_normal
theme.tasklist_fg_focus                     = "#F6784F"
theme.tasklist_bg_focus                     = themes_bg_normal
theme.textbox_widget_margin_top             = 1
theme.awful_widget_height                   = 14
theme.awful_widget_margin_top               = 2
theme.mouse_finder_color                    = "#CC9393"
theme.menu_height                           = "16"
theme.menu_width                            = "140"

theme.menu_submenu_icon                     = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel                   = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                 = themes_dir .. "/icons/square_unsel.png"
theme.arrl_lr_pre                           = themes_dir .. "/icons/arrl_lr_pre.png"
theme.arrl_lr_post                          = themes_dir .. "/icons/arrl_lr_post.png"

theme.layout_tile                           = themes_dir .. "/icons/tile.png"
theme.layout_tileleft                       = themes_dir .. "/icons/tileleft.png"
theme.layout_tilebottom                     = themes_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                        = themes_dir .. "/icons/tiletop.png"
theme.layout_fairv                          = themes_dir .. "/icons/fairv.png"
theme.layout_fairh                          = themes_dir .. "/icons/fairh.png"
theme.layout_spiral                         = themes_dir .. "/icons/spiral.png"
theme.layout_dwindle                        = themes_dir .. "/icons/dwindle.png"
theme.layout_max                            = themes_dir .. "/icons/max.png"
theme.layout_fullscreen                     = themes_dir .. "/icons/fullscreen.png"
theme.layout_magnifier                      = themes_dir .. "/icons/magnifier.png"
theme.layout_floating                       = themes_dir .. "/icons/floating.png"

theme.tasklist_floating                     = ""
theme.tasklist_maximized_horizontal         = ""
theme.tasklist_maximized_vertical           = "" 

theme.widget_mail_notify                    = themes_dir .. "/icons/mail_notify.png"
theme.widget_no_net_notify                  = themes_dir .. "/icons/no_net_notify.png"

return theme
