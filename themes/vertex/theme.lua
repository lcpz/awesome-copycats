--[[

     Vertex Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local math, string, tag, tonumber, type, os = math, string, tag, tonumber, type, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/vertex/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/vertex/wall.png"
theme.font                                      = "Roboto Bold 10"
theme.taglist_font                              = "FontAwesome 17"
theme.fg_normal                                 = "#FFFFFF"
theme.fg_focus                                  = "#6A95EB"
theme.bg_focus                                  = "#303030"
theme.bg_focus2                                 = "#3762B8"
theme.bg_normal                                 = "#242424"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(4)
theme.border_normal                             = "#252525"
theme.border_focus                              = "#7CA2EE"
theme.tooltip_border_color                      = theme.fg_focus
theme.tooltip_border_width                      = theme.border_width
theme.menu_height                               = dpi(24)
theme.menu_width                                = dpi(140)
theme.awesome_icon                              = theme.icon_dir .. "/awesome.png"
theme.taglist_squares_sel                       = gears.surface.load_from_shape(dpi(3), dpi(30), gears.shape.rectangle, theme.fg_focus)
theme.taglist_squares_unsel                     = gears.surface.load_from_shape(dpi(3), dpi(30), gears.shape.rectangle, theme.bg_focus2)
theme.panelbg                                   = theme.icon_dir .. "/panel.png"
theme.bat000charging                            = theme.icon_dir .. "/bat-000-charging.png"
theme.bat000                                    = theme.icon_dir .. "/bat-000.png"
theme.bat020charging                            = theme.icon_dir .. "/bat-020-charging.png"
theme.bat020                                    = theme.icon_dir .. "/bat-020.png"
theme.bat040charging                            = theme.icon_dir .. "/bat-040-charging.png"
theme.bat040                                    = theme.icon_dir .. "/bat-040.png"
theme.bat060charging                            = theme.icon_dir .. "/bat-060-charging.png"
theme.bat060                                    = theme.icon_dir .. "/bat-060.png"
theme.bat080charging                            = theme.icon_dir .. "/bat-080-charging.png"
theme.bat080                                    = theme.icon_dir .. "/bat-080.png"
theme.bat100charging                            = theme.icon_dir .. "/bat-100-charging.png"
theme.bat100                                    = theme.icon_dir .. "/bat-100.png"
theme.batcharged                                = theme.icon_dir .. "/bat-charged.png"
theme.ethon                                     = theme.icon_dir .. "/ethernet-connected.png"
theme.ethoff                                    = theme.icon_dir .. "/ethernet-disconnected.png"
theme.volhigh                                   = theme.icon_dir .. "/volume-high.png"
theme.vollow                                    = theme.icon_dir .. "/volume-low.png"
theme.volmed                                    = theme.icon_dir .. "/volume-medium.png"
theme.volmutedblocked                           = theme.icon_dir .. "/volume-muted-blocked.png"
theme.volmuted                                  = theme.icon_dir .. "/volume-muted.png"
theme.voloff                                    = theme.icon_dir .. "/volume-off.png"
theme.wifidisc                                  = theme.icon_dir .. "/wireless-disconnected.png"
theme.wififull                                  = theme.icon_dir .. "/wireless-full.png"
theme.wifihigh                                  = theme.icon_dir .. "/wireless-high.png"
theme.wifilow                                   = theme.icon_dir .. "/wireless-low.png"
theme.wifimed                                   = theme.icon_dir .. "/wireless-medium.png"
theme.wifinone                                  = theme.icon_dir .. "/wireless-none.png"
theme.layout_fairh                              = theme.default_dir.."/layouts/fairhw.png"
theme.layout_fairv                              = theme.default_dir.."/layouts/fairvw.png"
theme.layout_floating                           = theme.default_dir.."/layouts/floatingw.png"
theme.layout_magnifier                          = theme.default_dir.."/layouts/magnifierw.png"
theme.layout_max                                = theme.default_dir.."/layouts/maxw.png"
theme.layout_fullscreen                         = theme.default_dir.."/layouts/fullscreenw.png"
theme.layout_tilebottom                         = theme.default_dir.."/layouts/tilebottomw.png"
theme.layout_tileleft                           = theme.default_dir.."/layouts/tileleftw.png"
theme.layout_tile                               = theme.default_dir.."/layouts/tilew.png"
theme.layout_tiletop                            = theme.default_dir.."/layouts/tiletopw.png"
theme.layout_spiral                             = theme.default_dir.."/layouts/spiralw.png"
theme.layout_dwindle                            = theme.default_dir.."/layouts/dwindlew.png"
theme.layout_cornernw                           = theme.default_dir.."/layouts/cornernww.png"
theme.layout_cornerne                           = theme.default_dir.."/layouts/cornernew.png"
theme.layout_cornersw                           = theme.default_dir.."/layouts/cornersww.png"
theme.layout_cornerse                           = theme.default_dir.."/layouts/cornersew.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(10)
theme.titlebar_close_button_normal              = theme.default_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.default_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.default_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.default_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.default_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.default_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.default_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.default_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.default_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.default_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.default_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.default_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.default_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.default_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.default_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.default_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.default_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.default_dir.."/titlebar/maximized_focus_active.png"

-- http://fontawesome.io/cheatsheet
awful.util.tagnames = { "", "", "", "", "", "", "", "" }

local markup = lain.util.markup

-- Clock
--os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup("#FFFFFF", "%a %d %b, %H:%M"))
mytextclock.font = theme.font
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        fg = "#FFFFFF",
        bg = theme.bg_normal,
        position = "top_middle",
        font = "Monospace 10"
    }
})

-- Battery
local baticon = wibox.widget.imagebox(theme.bat000)
local battooltip = awful.tooltip({
    objects = { baticon },
    margin_leftright = dpi(15),
    margin_topbottom = dpi(12)
})
battooltip.wibox.fg = theme.fg_normal
battooltip.textbox.font = theme.font
battooltip.timeout = 0
battooltip:set_shape(function(cr, width, height)
    gears.shape.infobubble(cr, width, height, corner_radius, arrow_size, width - dpi(35))
end)
local bat = lain.widget.bat({
    settings = function()
        local index, perc = "bat", tonumber(bat_now.perc) or 0

        if perc <= 7 then
            index = index .. "000"
        elseif perc <= 20 then
            index = index .. "020"
        elseif perc <= 40 then
            index = index .. "040"
        elseif perc <= 60 then
            index = index .. "060"
        elseif perc <= 80 then
            index = index .. "080"
        elseif perc <= 100 then
            index = index .. "100"
        end

        if bat_now.ac_status == 1 then
            index = index .. "charging"
        end

        baticon:set_image(theme[index])
        battooltip:set_markup(string.format("\n%s%%, %s", perc, bat_now.time))
    end
})

-- MPD
theme.mpd = lain.widget.mpd({
    music_dir = "/mnt/storage/Downloads/Music",
    settings = function()
        if mpd_now.state == "play" then
            title = mpd_now.title
            artist  = "  " .. mpd_now.artist  .. " "
        elseif mpd_now.state == "pause" then
            title = "mpd "
            artist  = "paused "
        else
            title  = ""
            artist = ""
        end

        widget:set_markup(markup.font(theme.font, title .. markup(theme.fg_focus, artist)))
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox()
theme.volume = lain.widget.alsabar({
    --togglechannel = "IEC958,3",
    notification_preset = { font = "Monospace 12", fg = theme.fg_normal },
    settings = function()
        local index, perc = "", tonumber(volume_now.level) or 0

        if volume_now.status == "off" then
            index = "volmutedblocked"
        else
            if perc <= 5 then
                index = "volmuted"
            elseif perc <= 25 then
                index = "vollow"
            elseif perc <= 75 then
                index = "volmed"
            else
                index = "volhigh"
            end
        end

        volicon:set_image(theme[index])
    end
})
volicon:buttons(my_table.join (
          awful.button({}, 1, function()
            awful.spawn(string.format("%s -e alsamixer", awful.util.terminal))
          end),
          awful.button({}, 2, function()
            os.execute(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
            theme.volume.notify()
          end),
          awful.button({}, 3, function()
            os.execute(string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
            theme.volume.notify()
          end),
          awful.button({}, 4, function()
            os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
            theme.volume.notify()
          end),
          awful.button({}, 5, function()
            os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
            theme.volume.notify()
          end)
))

-- Wifi carrier and signal strength
local wificon = wibox.widget.imagebox(theme.wifidisc)
local wifitooltip = awful.tooltip({
    objects = { wificon },
    margin_leftright = dpi(15),
    margin_topbottom = dpi(15)
})
wifitooltip.wibox.fg = theme.fg_normal
wifitooltip.textbox.font = theme.font
wifitooltip.timeout = 0
wifitooltip:set_shape(function(cr, width, height)
    gears.shape.infobubble(cr, width, height, corner_radius, arrow_size, width - dpi(120))
end)
local mywifisig = awful.widget.watch(
    { awful.util.shell, "-c", "awk 'NR==3 {printf(\"%d-%.0f\\n\",$2, $3*10/7)}' /proc/net/wireless; iw dev wlan0 link" },
    2,
    function(widget, stdout)
        local carrier, perc = stdout:match("(%d)-(%d+)")
        local tiptext = stdout:gsub("(%d)-(%d+)", ""):gsub("%s+$", "")
        perc = tonumber(perc)

        if carrier == "1" or not perc then
            wificon:set_image(theme.wifidisc)
            wifitooltip:set_markup("No carrier")
        else
            if perc <= 5 then
                wificon:set_image(theme.wifinone)
            elseif perc <= 25 then
                wificon:set_image(theme.wifilow)
            elseif perc <= 50 then
                wificon:set_image(theme.wifimed)
            elseif perc <= 75 then
                wificon:set_image(theme.wifihigh)
            else
                wificon:set_image(theme.wififull)
            end
            wifitooltip:set_markup(tiptext)
        end
    end
)
wificon:connect_signal("button::press", function() awful.spawn(string.format("%s -e wavemon", awful.util.terminal)) end)

-- Weather
theme.weather = lain.widget.weather({
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = "Monospace 10" },
    settings = function()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(" " .. markup.font(theme.font, units .. "°C") .. " ")
    end
})

-- Launcher
local mylauncher = awful.widget.button({image = theme.awesome_icon})
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

-- Separators
local space = wibox.widget.textbox(" ")
local rspace1 = wibox.widget.textbox()
local rspace0 = wibox.widget.textbox()
local rspace2 = wibox.widget.textbox()
local rspace3 = wibox.widget.textbox()
local tspace1 = wibox.widget.textbox()
tspace1.forced_width = dpi(18)
rspace1.forced_width = dpi(16)
rspace0.forced_width = dpi(18)
rspace2.forced_width = dpi(19)
rspace3.forced_width = dpi(21)

local lspace1 = wibox.widget.textbox()
local lspace2 = wibox.widget.textbox()
local lspace3 = wibox.widget.textbox()
lspace1.forced_height = dpi(18)
lspace2.forced_height = dpi(10)
lspace3.forced_height = dpi(16)

local barcolor = gears.color({
    type  = "linear",
    from  = { 0, dpi(46) },
    to    = { dpi(46), dpi(46) },
    stops = { {0, theme.bg_focus}, {0.9, theme.bg_focus2} }
})

local barcolor2 = gears.color({
    type  = "linear",
    from  = { 0, dpi(46) },
    to    = { dpi(46), dpi(46) },
    stops = { {0, "#323232"}, {1, theme.bg_normal} }
})

local dockshape = function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 6)
end

function theme.vertical_wibox(s)
    -- Create the vertical wibox
    s.dockheight = (35 *  s.workarea.height)/100

    s.myleftwibox = wibox({ screen = s, x=0, y=s.workarea.height/2 - s.dockheight/2, width = dpi(6), height = s.dockheight, fg = theme.fg_normal, bg = barcolor2, ontop = true, visible = true, type = "dock" })

    if s.index > 1 and s.myleftwibox.y == 0 then
        s.myleftwibox.y = screen[1].myleftwibox.y
    end

    -- Add widgets to the vertical wibox
    s.myleftwibox:setup {
        layout = wibox.layout.align.vertical,
        {
            layout = wibox.layout.fixed.vertical,
            lspace1,
            s.mytaglist,
            lspace2,
            s.layoutb,
            wibox.container.margin(mylauncher, dpi(5), dpi(8), dpi(13), dpi(0)),
        },
    }

    -- Add toggling functionalities
    s.docktimer = gears.timer{ timeout = 2 }
    s.docktimer:connect_signal("timeout", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = dpi(9)
        s.layoutb.visible = false
        mylauncher.visible = false
        if s.docktimer.started then
            s.docktimer:stop()
        end
    end)
    tag.connect_signal("property::selected", function(t)
        local s = t.screen or awful.screen.focused()
        s.myleftwibox.width = dpi(38)
        s.layoutb.visible = true
        mylauncher.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
        if not s.docktimer.started then
            s.docktimer:start()
        end
    end)

    s.myleftwibox:connect_signal("mouse::leave", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = dpi(9)
        s.layoutb.visible = false
        mylauncher.visible = false
    end)

    s.myleftwibox:connect_signal("mouse::enter", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = dpi(38)
        s.layoutb.visible = true
        mylauncher.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
    end)
end


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal, border = theme.border_width })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    s.mypromptbox.bg = "#00000000"

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    s.layoutb = wibox.container.margin(s.mylayoutbox, dpi(8), dpi(11), dpi(3), dpi(3))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, {
        font = theme.taglist_font,
        shape = gears.shape.rectangle,
        spacing = dpi(10),
        square_unsel = theme.square_unsel,
        bg_focus = barcolor
    }, nil, wibox.layout.fixed.vertical())

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused, awful.util.tasklist_buttons, { bg_focus = "#00000000" })

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(25), bg = gears.color.create_png_pattern(theme.panelbg) })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mypromptbox,
            tspace1,
            s.mytasklist,
        },
        { -- Middle widgets
            layout = wibox.layout.flex.horizontal,
            max_widget_size = 1500,
            mytextclock
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget { nil, nil, theme.mpd.widget, layout = wibox.layout.align.horizontal },
            rspace0,
            theme.weather.icon,
            theme.weather.widget,
            rspace1,
            wificon,
            rspace0,
            volicon,
            rspace2,
            baticon,
            rspace3,
            wibox.widget.systray(),
        },
    }

    gears.timer.delayed_call(theme.vertical_wibox, s)
end

return theme
