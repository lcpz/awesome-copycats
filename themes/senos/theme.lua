
--[[

     Senos Awesome WM theme
     github.com/copycat-killer

--]]


local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os    = { getenv = os.getenv, setlocale = os.setlocale, execute = os.execute }

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/senos"
theme.wallpaper                                 = theme.confdir .. "/wall.jpg"
theme.font                                      = "Bariol 12"
-- special
theme.foreground                                = "#f8f8f2"
theme.background                                = "#282a36"
theme.cursorColor                               = "#D3C3EA"
theme.selection                                 = "#44475A"
theme.comment                                   = "#6272A4"
-- black
theme.color0                                    = "#000000"
theme.color8                                    = "#4d4d4d"
-- red
theme.color1                                    = "#ff5555"
theme.color9                                    = "#ff6e67"
-- green
theme.color2                                    = "#50fa7b"
theme.color10                                   = "#5af78e"
-- yellow
theme.color3                                    = "#f1fa8c"
theme.color11                                   = "#f4f99d"
-- blue / purple
theme.color4                                    = "#bd93f9"
theme.color12                                   = "#caa9fa"
-- magenta / pink
theme.color5                                    = "#ff79c6"
theme.color13                                   = "#ff92d0"
-- cyan
theme.color6                                    = "#8be9fd"
theme.color14                                   = "#9aedfe"
-- white
theme.color7                                    = "#bfbfbf"
theme.color15                                   = "#e6e6e6"
-- orange
theme.orange                                    = "#FFB86C"
--[[
# UI Variants
- &BGLighter     "#424450"
- &BGLight       "#343746" # HSV (230   , 25.71, 27.45)
- &BGDark        "#21222C" # HSV (234.55, 25   , 17.25)
- &BGDarker      "#191A21" # HSV (234.55, 25   , 13   )
--]]
-- awesome colors
theme.bg_normal                                 = theme.background
theme.fg_normal                                 = theme.color7
theme.bg_urgent                                 = theme.color9 -- red light
theme.fg_urgent                                 = theme.background
theme.bg_focus                                  = theme.selection
theme.fg_focus                                  = theme.foreground
theme.fg_minimize                               = theme.comment
theme.border_normal                             = theme.color8 -- black light
theme.border_focus                              = theme.color4 -- purple light
theme.border_marked                             = theme.color5 -- magenta
theme.menu_bg_normal                            = theme.background
theme.menu_fg_normal                            = theme.color15
theme.menu_bg_focus                             = theme.selection
theme.menu_fg_focus                             = theme.orange
theme.wg_fg_color                               = theme.color5 -- magenta
theme.border_width                              = 4
theme.menu_border_width                         = 1
theme.tooltip_border_color                      = theme.border_focus
theme.tooltip_border_width                      = theme.border_width
theme.menu_height                               = 24
theme.menu_width                                = 140
theme.bar_width                                 = 3
theme.spacing                                   = 16
theme.net_max                                   = 250
theme.max_temp                                  = 60
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/taglist/squarefw.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/taglist/squarew.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 8
-- layout icons
theme.layout_tile                               = theme.confdir .. "/icons/layouts/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/layouts/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/layouts/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/layouts/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/layouts/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/layouts/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/layouts/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/layouts/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/layouts/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/layouts/floating.png"
theme.layout_cornernw                           = theme.confdir .. "/icons/layouts/cornernw.png"
theme.layout_cornerne                           = theme.confdir .. "/icons/layouts/cornerne.png"
theme.layout_cornerse                           = theme.confdir .. "/icons/layouts/cornerse.png"
theme.layout_cornersw                           = theme.confdir .. "/icons/layouts/cornersw.png"
theme.layout_termfair                           = theme.confdir .. "/icons/layouts/termfair.png"
theme.layout_termfair                           = theme.confdir .. "/icons/layouts/termfair.png"
theme.layout_centerwork                         = theme.confdir .. "/icons/layouts/centerwork.png"

local markup = lain.util.markup
-- Separators
local space = wibox.widget.textbox(" ")
local rspace = wibox.widget.textbox()
rspace.forced_width = theme.spacing

-- helpers
local create_bar = function()
    local bar = wibox.widget {
        forced_height    = theme.bar_width,
        forced_width     = 10,
        color            = theme.fg_normal,
        background_color = theme.bg_normal,
        margins          = 0,
        paddings         = 0,
        ticks            = true,
        ticks_size       = 1,
        widget           = wibox.widget.progressbar,
    }
    function rotate()
        local barr = wibox.container.rotate(bar, "east")
        return wibox.container.margin(barr, 1, 1, 4, 4)
    end
    bar.display = rotate()
    return bar
end

local create_tooltip = function(arg)
    tooltip = awful.tooltip(arg)
    tooltip.wibox.fg = theme.fg_normal
    tooltip.textbox.font = theme.font
    tooltip.timeout = 1
    tooltip:set_shape(function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, rad)
    end)
    return tooltip
end

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup(theme.wg_fg_color, "%A %d %B ") ..  markup(theme.wg_fg_color, " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.calendar({
    attach_to = { mytextclock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- -- Weather
-- local weathericon = wibox.widget.imagebox(theme.widget_weather)
-- theme.weather = lain.widget.weather({
--     city_id = 360630, -- placeholder (London)
--     notification_preset = { font = "Bariol 11", fg = theme.fg_normal },
--     weather_na_markup = markup.fontfg(theme.font, theme.wg_fg_color, "N/A "),
--     settings = function()
--         descr = weather_now["weather"][1]["description"]:lower()
--         units = math.floor(weather_now["main"]["temp"])
--         widget:set_markup(markup.fontfg(theme.font, theme.wg_fg_color, descr .. " @ " .. units .. "°C "))
--     end
-- })

-- / fs
theme.fs = lain.widget.fs({
    options = "--exclude-type=tmpfs",
    notification_preset = { font = "xos4 Terminus 10", fg = theme.fg_normal },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal,"Hdd")..markup.fontfg(theme.font, theme.wg_fg_color, fs_now.used .. "%"))
    end
})

--[[ Mail IMAP check
-- commented because it needs to be set before use
local mailicon = wibox.widget.imagebox()
local mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, theme.wg_fg_color, mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

-- CPU
local cpubar = create_bar()
local cpu = lain.widget.cpu({
    settings = function()
        local color, perc = theme.wg_fg_color, tonumber(cpu_now.usage) or 0

        if perc <= 40 then
            color = theme.wg_fg_color
        elseif perc <= 60 then
            color = theme.color3
        elseif perc <= 80 then
            color = theme.color5
        elseif perc <= 100 then
            color = theme.color1
        else
            color = theme.color0
        end
        cpubar:set_color(color)
        cpubar:set_value(perc / 100)
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Cpu")..markup.fontfg(theme.font, theme.wg_fg_color, perc .. "%"))
    end
})
cpu.letter = wibox.widget.textbox(markup.fontfg(theme.font, theme.fg_normal, "Cpu"))

-- MEM
local membar = create_bar()
local memory = lain.widget.mem({
    settings = function()
        local color, perc = theme.wg_fg_color, tonumber(mem_now.perc) or 0

        if perc <= 40 then
            color = theme.wg_fg_color
        elseif perc <= 60 then
            color = theme.color3
        elseif perc <= 80 then
            color = theme.color5
        elseif perc <= 100 then
            color = theme.color1
        else
            color = theme.color0
        end
        membar:set_color(color)
        membar:set_value(perc / 100)
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Mem").. markup.fontfg(theme.font, theme.wg_fg_color, mem_now.used.."M"))
    end
})
memory.letter = wibox.widget.textbox(markup.fontfg(theme.font, theme.fg_normal, "Mem"))

-- Coretemp
local tempbar = create_bar()
local temp = lain.widget.temp({
    settings = function()
        local color, perc = theme.wg_fg_color, tonumber(coretemp_now) or 0

        if perc <= theme.max_temp / 1.5 then
            color = theme.wg_fg_color
        elseif perc <= theme.max_temp - 15 then
            color = theme.color3
        elseif perc <= theme.max_temp - 10 then
            color = theme.color5
        elseif perc <= theme.max_temp then
            color = theme.color1
        else
            color = theme.color0
        end
        tempbar:set_color(color)
        tempbar:set_value(perc / theme.max_temp)
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Temp")..markup.fontfg(theme.font, theme.wg_fg_color, coretemp_now .. "°C "))
    end
})
temp.letter = wibox.widget.textbox(markup.fontfg(theme.font, theme.fg_normal, "Temp"))

-- System
local sysinfo = wibox.widget {
    cpu.letter, cpubar.display, space, memory.letter, membar.display, space, temp.letter, tempbar.display,
    layout  = wibox.layout.fixed.horizontal
}
sysinfo:buttons(
    gears.table.join(
        awful.button({ }, 1,
        function ()
            awful.spawn(awful.util.terminal.." -e htop")
        end)
    )
)
local systooltip = create_tooltip({
    objects = { sysinfo },
    margin_leftright = 15,
    margin_topbottom = 12,
    timer_function = function()
            return (cpu.widget.markup.."\n"..memory.widget.markup.."\n"..temp.widget.markup)
        end,
})

-- Battery
local bat = lain.widget.bat({
    settings = function()
        local perc, percent = bat_now.perc ~= "N/A" and bat_now.perc, "%" or bat_now.perc, ""

        color = theme.wg_fg_color
        if bat_now.status == "Charging" then
            color = theme.color10
        elseif bat_now.status == "Discharging" then
            color = theme.wg_fg_color
        end

        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Bat")..markup.fontfg(theme.font, color, perc .. percent))
    end
})

-- Battery
-- local batbar = wibox.widget {
--     forced_height    = theme.bar_width,
--     forced_width     = 10,
--     color            = theme.fg_normal,
--     background_color = theme.bg_normal,
--     margins          = 0,
--     paddings         = 0,
--     ticks            = true,
--     ticks_size       = 1,
--     widget           = wibox.widget.progressbar,
-- }
-- local batupd = lain.widget.bat({
--     settings = function()
--         if bat_now.status == "N/A" or type(bat_now.perc) ~= "number" then return end

--         if bat_now.status == "Charging" then
--             if bat_now.perc >= 98 then
--                 batbar:set_color(green)
--             elseif bat_now.perc > 50 then
--                 batbar:set_color(theme.fg_normal)
--             elseif bat_now.perc > 15 then
--                 batbar:set_color(theme.fg_normal)
--             else
--                 batbar:set_color(red)
--             end
--         else
--             if bat_now.perc >= 98 then
--                 batbar:set_color(green)
--             elseif bat_now.perc > 50 then
--                 batbar:set_color(theme.fg_normal)
--             elseif bat_now.perc > 15 then
--                 batbar:set_color(theme.fg_normal)
--             else
--                 batbar:set_color(red)
--             end
--         end
--         batbar:set_value(bat_now.perc / 100)
--     end
-- })
-- local batbarr = wibox.container.rotate(batbar, "east")
-- local batwidget = wibox.container.margin(batbarr, 2, 2, 2, 2)

-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Vol")..markup.fontfg(theme.font, theme.wg_fg_color, volume_now.level.."%"))
    end
})


-- Mouse bindings
theme.volume.widget:buttons(
  gears.table.join(
        awful.button({ }, 1,
        function ()
            os.execute(string.format("amixer -q set %s toggle", theme.volume.togglechannel or theme.volume.channel))
            theme.volume.update()
        end),
        awful.button({ }, 3,
        function ()
            awful.util.spawn_with_shell( 'pavucontrol' )
        end),
        awful.button({ }, 4,
        function ()
            os.execute(string.format("amixer -q set %s 1%%+", theme.volume.channel))
            theme.volume.update()
        end),
        awful.button({ }, 5,
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", theme.volume.channel))
            theme.volume.update()
        end)
    )
)

-- Net
local netbar = create_bar()
local net = lain.widget.net({
    settings = function()
        local color, perc = theme.wg_fg_color, tonumber(net_now.received) or 0

        if perc <= 1 then
            color = theme.color0
        elseif perc <= theme.net_max / 2 then
            color = theme.wg_fg_color
        else
            color = theme.color10
        end

        netbar:set_color(color)
        netbar:set_value(perc / theme.net_max)
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Dwn").. markup.fontfg(theme.font, theme.wg_fg_color, net_now.received) .. "\n" .. markup.fontfg(theme.font, theme.fg_normal, "Upl") .. markup.fontfg(theme.font, theme.wg_fg_color, net_now.sent))
    end
})
net.letter = wibox.widget.textbox(markup.fontfg(theme.font, theme.fg_normal, "Net"))
local netinfo = wibox.widget {
    net.letter, netbar.display, layout = wibox.layout.fixed.horizontal
}
local nettooltip = create_tooltip({
    objects = { netinfo },
    margin_leftright = 15,
    margin_topbottom = 12,
    timer_function = function()
        return (net.widget.markup)
        end,
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        if mpd_now.state == "play" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            mpdicon:set_image(theme.widget_note_on)
        elseif mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            --mpdicon:set_image() -- not working in 4.0
            mpdicon._private.image = nil
            mpdicon:emit_signal("widget::redraw_needed")
            mpdicon:emit_signal("widget::layout_changed")
        end
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, artist) .. markup.fontfg(theme.font, theme.fg_focus, title))
    end
})

-- Switch between EN and AR layouts.
theme.kbd = lain.widget.contrib.kbdlayout({
    layouts = { { layout = "us" },
                { layout = "ar" } },
    settings = function()
        if kbdlayout_now.variant then
            widget:set_markup(markup.fontfg(theme.font, theme.wg_fg_color, kbdlayout_now.layout .. "/" .. kbdlayout_now.variant))
        else
            widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "Lang")..markup.fontfg(theme.font, theme.wg_fg_color, kbdlayout_now.layout))
        end
    end
})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({border = theme.border_width, followtag = true,
                               settings = function(c) c.sticky = true end})

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, false)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[2])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    if s.index == 1 then
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                --s.mylayoutbox,
                s.mytaglist,
                s.mypromptbox,
                mpdicon,
                theme.mpd.widget,
            },
            --s.mytasklist, -- Middle widget
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                rspace,
                theme.kbd,
                rspace,
                --mailicon,
                --mail.widget,
                netinfo,
                rspace,
                theme.volume.widget,
                rspace,
                sysinfo,
                rspace,
                theme.fs.widget,
                rspace,
                -- weathericon,
                -- theme.weather.widget,
                bat.widget,
                -- batwidget,
                rspace,
                mytextclock,
                s.mylayoutbox,
            },
        }
    else
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                s.mypromptbox,
                mpdicon,
                theme.mpd.widget,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                rspace,
                theme.volume.widget,
                rspace,
                bat.widget,
                rspace,
                mytextclock,
                s.mylayoutbox,
            },
        }
    end
    -- Create the bottom wibox
    -- s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = 20, bg = theme.bg_normal, fg = theme.fg_normal })

    -- -- Add widgets to the bottom wibox
    -- s.mybottomwibox:setup {
    --     layout = wibox.layout.align.horizontal,
    --     { -- Left widgets
    --         layout = wibox.layout.fixed.horizontal,
    --     },
    --     s.mytasklist, -- Middle widget
    --     { -- Right widgets
    --         layout = wibox.layout.fixed.horizontal,
    --         s.mylayoutbox,
    --     },
    -- }
end

return theme
