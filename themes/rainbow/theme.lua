--[[                                  ]]--
--                                      -
--    Rainbow Awesome WM 3.5.+ theme    --
--      github.com/copycat-killer       --
--                                      -
--[[                                  ]]--


theme = {}

themes_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/rainbow"
theme.wallpaper                             = themes_dir .. "/wall.png"

theme.font                                  = "Tamsyn 10"
theme.fg_normal                             = "#9E9E9E"
theme.fg_focus                              = "#EBEBFF"
theme.bg_normal                             = "#242424"
theme.bg_focus                              = "#242424"
theme.fg_urgent                             = "#000000"
theme.bg_urgent                             = "#FFFFFF"
theme.border_width                          = "1"
theme.border_normal                         = "#242424"
theme.border_focus                          = "#999999"
theme.taglist_fg_focus                      = "#EBEBFF"
theme.taglist_bg_focus                      = "#3D3D3D"
theme.menu_height                           = "16"
theme.menu_width                            = "140"

theme.menu_submenu_icon                     = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel                   = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                 = themes_dir .. "/icons/square_unsel.png"
theme.widget_mail_notify                    = themes_dir .. "/icons/mail_notify.png"
theme.widget_no_net_notify                  = themes_dir .. "/icons/no_net_notify.png"

theme.layout_txt_tile                       = "[t]" 
theme.layout_txt_tileleft                   = "[l]"
theme.layout_txt_tilebottom                 = "[b]"
theme.layout_txt_tiletop                    = "[tt]"
theme.layout_txt_fairv                      = "[fv]"
theme.layout_txt_fairh                      = "[fh]"
theme.layout_txt_spiral                     = "[s]"
theme.layout_txt_dwindle                    = "[d]"
theme.layout_txt_max                        = "[m]"
theme.layout_txt_fullscreen                 = "[F]"
theme.layout_txt_magnifier                  = "[M]"
theme.layout_txt_floating                   = "[*]"

theme.layout_txt_tilegaps                   = "[tg]" 
theme.layout_txt_fairvgaps                  = "[fvg]"
theme.layout_txt_spiralgaps                 = "[sg]"

theme.tasklist_floating                     = ""
theme.tasklist_maximized_horizontal         = ""
theme.tasklist_maximized_vertical           = "" 

return theme
