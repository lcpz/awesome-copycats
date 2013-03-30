--[[                                        ]]--
----                                          -
----    Blackburn Awesome WM 3.5.+ theme      --
----       github.com/copycat-killer          --
----                                          -
----[[                                      ]]--


theme = {}

themes_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
theme.wallpaper                             = themes_dir .. "/wall.png"

theme.font                                  = "Tamsyn 10"
theme.fg_normal                             = "#aaaaaa"
theme.fg_focus                              = "#d79d38"
theme.fg_urgent                             = "#CC9393"
theme.bg_normal                             = "#000000"
theme.bg_focus                              = "#000000"
theme.bg_urgent                             = "#2a1f1e"
theme.border_width                          = "1"
theme.border_normal                         = "#101010"
theme.border_focus                          = "#606060"
theme.border_marked                         = "#CC9393"
theme.titlebar_bg_focus                     = "#FFFFFF"
theme.titlebar_bg_normal                    = "#FFFFFF"
theme.taglist_fg_focus                      = "#f6784f"
theme.tasklist_bg_focus                     = "#000000"
theme.tasklist_fg_focus                     = "#f6784f"
theme.textbox_widget_margin_top             = 1
theme.notify_fg                             = theme.fg_normal
theme.notify_bg                             = theme.bg_normal
theme.notify_border                         = theme.border_focus
theme.awful_widget_height                   = 14
theme.awful_widget_margin_top               = 2
theme.mouse_finder_color                    = "#CC9393"
theme.menu_height                           = "16"
theme.menu_width                            = "140"

theme.menu_submenu_icon                     = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel                   = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                 = themes_dir .. "/icons/square_unsel.png"

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

theme.widget_weather_na                      = themes_dir .. "/icons/weather/na.png"
theme.widget_weather_00                      = themes_dir .. "/icons/weather/00.png"
theme.widget_weather_01                      = themes_dir .. "/icons/weather/01.png"
theme.widget_weather_02                      = themes_dir .. "/icons/weather/02.png"
theme.widget_weather_03                      = themes_dir .. "/icons/weather/03.png"
theme.widget_weather_04                      = themes_dir .. "/icons/weather/04.png"
theme.widget_weather_05                      = themes_dir .. "/icons/weather/05.png"
theme.widget_weather_06                      = themes_dir .. "/icons/weather/06.png"
theme.widget_weather_07                      = themes_dir .. "/icons/weather/07.png"
theme.widget_weather_08                      = themes_dir .. "/icons/weather/08.png"
theme.widget_weather_09                      = themes_dir .. "/icons/weather/09.png"
theme.widget_weather_10                      = themes_dir .. "/icons/weather/10.png"
theme.widget_weather_11                      = themes_dir .. "/icons/weather/11.png"
theme.widget_weather_12                      = themes_dir .. "/icons/weather/12.png"
theme.widget_weather_13                      = themes_dir .. "/icons/weather/13.png"
theme.widget_weather_14                      = themes_dir .. "/icons/weather/14.png"
theme.widget_weather_15                      = themes_dir .. "/icons/weather/15.png"
theme.widget_weather_16                      = themes_dir .. "/icons/weather/16.png"
theme.widget_weather_17                      = themes_dir .. "/icons/weather/17.png"
theme.widget_weather_18                      = themes_dir .. "/icons/weather/18.png"
theme.widget_weather_19                      = themes_dir .. "/icons/weather/19.png"
theme.widget_weather_20                      = themes_dir .. "/icons/weather/20.png"
theme.widget_weather_21                      = themes_dir .. "/icons/weather/21.png"
theme.widget_weather_22                      = themes_dir .. "/icons/weather/22.png"
theme.widget_weather_23                      = themes_dir .. "/icons/weather/23.png"
theme.widget_weather_24                      = themes_dir .. "/icons/weather/24.png"
theme.widget_weather_25                      = themes_dir .. "/icons/weather/25.png"
theme.widget_weather_26                      = themes_dir .. "/icons/weather/26.png"
theme.widget_weather_27                      = themes_dir .. "/icons/weather/27.png"
theme.widget_weather_28                      = themes_dir .. "/icons/weather/28.png"
theme.widget_weather_29                      = themes_dir .. "/icons/weather/29.png"
theme.widget_weather_30                      = themes_dir .. "/icons/weather/30.png"
theme.widget_weather_31                      = themes_dir .. "/icons/weather/31.png"
theme.widget_weather_32                      = themes_dir .. "/icons/weather/32.png"
theme.widget_weather_33                      = themes_dir .. "/icons/weather/33.png"
theme.widget_weather_34                      = themes_dir .. "/icons/weather/34.png"
theme.widget_weather_35                      = themes_dir .. "/icons/weather/35.png"
theme.widget_weather_36                      = themes_dir .. "/icons/weather/36.png"
theme.widget_weather_37                      = themes_dir .. "/icons/weather/37.png"
theme.widget_weather_38                      = themes_dir .. "/icons/weather/38.png"
theme.widget_weather_39                      = themes_dir .. "/icons/weather/39.png"
theme.widget_weather_40                      = themes_dir .. "/icons/weather/40.png"
theme.widget_weather_41                      = themes_dir .. "/icons/weather/41.png"
theme.widget_weather_42                      = themes_dir .. "/icons/weather/42.png"
theme.widget_weather_43                      = themes_dir .. "/icons/weather/43.png"
theme.widget_weather_44                      = themes_dir .. "/icons/weather/44.png"
theme.widget_weather_45                      = themes_dir .. "/icons/weather/45.png"
theme.widget_weather_46                      = themes_dir .. "/icons/weather/46.png"
theme.widget_weather_47                      = themes_dir .. "/icons/weather/47.png"

return theme
