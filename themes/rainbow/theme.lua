--[[                                  ]]--
--                                      -
--    Rainbow Awesome WM 3.5.+ theme    --
--      github.com/copycat-killer       --
--                                      -
--[[                                  ]]--


theme                               = {}

theme.dir                           = os.getenv("HOME") .. "/.config/awesome/themes/rainbow"
theme.wallpaper                     = theme.dir .. "/wall.png"

theme.font                          = "Tamsyn 10"
theme.fg_normal                     = "#9E9E9E"
theme.fg_focus                      = "#EBEBFF"
theme.bg_normal                     = "#242424"
theme.bg_focus                      = "#242424"
theme.fg_urgent                     = "#000000"
theme.bg_urgent                     = "#FFFFFF"
theme.border_width                  = "1"
theme.border_normal                 = "#242424"
theme.border_focus                  = "#EBEBFF"
theme.taglist_fg_focus              = "#EBEBFF"
theme.taglist_bg_focus              = "#3D3D3D"
theme.menu_height                   = "16"
theme.menu_width                    = "140"

theme.ocol                          = "<span color='" .. theme.fg_normal .. "'>"
theme.ccol                          = "</span>"
theme.tasklist_sticky               = theme.ocol .. "[S]" .. theme.ccol
theme.tasklist_ontop                = theme.ocol .. "[T]" .. theme.ccol
theme.tasklist_floating             = theme.ocol .. "[F]" .. theme.ccol
theme.tasklist_maximized_horizontal = theme.ocol .. "[M] " .. theme.ccol
theme.tasklist_maximized_vertical   = ""
theme.tasklist_disable_icon         = true

theme.awesome_icon                  = theme.dir .. "/icons/awesome_icon.png"
theme.menu_submenu_icon             = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = theme.dir .. "/icons/square_sel2.png"
theme.taglist_squares_unsel         = theme.dir .. "/icons/square_unsel.png"
theme.widget_mail_notify            = theme.dir .. "/icons/mail_notify.png"
theme.widget_no_net_notify          = theme.dir .. "/icons/no_net_notify.png"

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
theme.layout_txt_floating           = "[*]"

-- vain related
theme.border_focus_highprio         = "#FF0000"
theme.border_normal_highprio        = "#A03333"
theme.border_focus_lowprio          = "#3333FF"
theme.border_normal_lowprio         = "#333366"
theme.useless_gap_width             = "6"
theme.layout_txt_uselesstile        = "[ut]"
theme.layout_txt_uselessfairv       = "[ufv]"
theme.layout_txt_uselessfairh       = "[ufh]"
theme.layout_txt_termfair           = "[termfair]"
theme.layout_txt_uselessdwindle     = "[ud]"

return theme
