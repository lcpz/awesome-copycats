--[[

     Holo Awesome WM config 3.0
     github.com/copycat-killer

--]]

-- {{{ Required libraries
local gears     = require("gears")
local awful     = require("awful")
awful.rules     = require("awful.rules")
require("awful.autofocus")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty   = require("naughty")
local lain      = require("lain")
-- }}}

-- Error handling
require("stock.errors")

-- STARTUP apps
require("settings.startup")

-- {{{ Variable definitions
-- beautiful init
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/holo/theme.lua")

-- variables
require("settings.variables")

musiplr   = terminal .. " -e ncmpcpp "

-- Tags and layouts
require("settings.tags")
-- }}}

-- {{{ Wallpaper
require("stock.wallpaper")
-- }}}

-- {{{ Menu
require("third-party/freedesktop/freedesktop")
-- }}}

-- {{{ Wibox
markup = lain.util.markup
blue   = "#80CCE6"
space3 = markup.font("Tamsyn 3", " ")
space2 = markup.font("Tamsyn 2", " ")

-- Menu icon
awesome_icon = wibox.widget.imagebox()
awesome_icon:set_image(beautiful.awesome_icon)
awesome_icon:buttons(awful.util.table.join( awful.button({ }, 1, function() mymainmenu:toggle() end)))

-- Clock
mytextclock = awful.widget.textclock(markup("#FFFFFF", space3 .. "%H:%M" .. space2))
clock_icon = wibox.widget.imagebox()
clock_icon:set_image(beautiful.clock)
clockwidget = wibox.widget.background()
clockwidget:set_widget(mytextclock)
clockwidget:set_bgimage(beautiful.widget_bg)

-- Calendar
mytextcalendar = awful.widget.textclock(markup("#FFFFFF", space3 .. "%d %b<span font='Tamsyn 5'> </span>"))
calendar_icon = wibox.widget.imagebox()
calendar_icon:set_image(beautiful.calendar)
calendarwidget = wibox.widget.background()
calendarwidget:set_widget(mytextcalendar)
calendarwidget:set_bgimage(beautiful.widget_bg)
lain.widgets.calendar:attach(calendarwidget, { fg = "#FFFFFF", position = "bottom_right" })

--[[ Mail IMAP check
-- commented because it needs to be set before use
mailwidget = lain.widgets.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail_notification_preset.fg = "#FFFFFF"
        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup(blue, mail) .. markup("#FFFFFF", count))
    end
})
]]

-- MPD
mpd_icon = wibox.widget.imagebox()
mpd_icon:set_image(beautiful.mpd)
prev_icon = wibox.widget.imagebox()
prev_icon:set_image(beautiful.prev)
next_icon = wibox.widget.imagebox()
next_icon:set_image(beautiful.nex)
stop_icon = wibox.widget.imagebox()
stop_icon:set_image(beautiful.stop)
pause_icon = wibox.widget.imagebox()
pause_icon:set_image(beautiful.pause)
play_pause_icon = wibox.widget.imagebox()
play_pause_icon:set_image(beautiful.play)

mpdwidget = lain.widgets.mpd({
    settings = function ()
        if mpd_now.state == "play" then
            mpd_now.artist = mpd_now.artist:upper():gsub("&.-;", string.lower)
            mpd_now.title = mpd_now.title:upper():gsub("&.-;", string.lower)
            widget:set_markup(markup.font("Tamsyn 4", " ")
                              .. markup.font("Tamsyn 8",
                              mpd_now.artist
                              .. " - " ..
                              mpd_now.title
                              .. markup.font("Tamsyn 10", " ")))
            play_pause_icon:set_image(beautiful.pause)
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font("Tamsyn 4", " ") ..
                              markup.font("Tamsyn 8", "MPD PAUSED") ..
                              markup.font("Tamsyn 10", " "))
            play_pause_icon:set_image(beautiful.play)
        else
            widget:set_markup("")
            play_pause_icon:set_image(beautiful.play)
        end
    end
})

musicwidget = wibox.widget.background()
musicwidget:set_widget(mpdwidget)
musicwidget:set_bgimage(beautiful.widget_bg)
musicwidget:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(musicplr) end)))
mpd_icon:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(musicplr) end)))
prev_icon:buttons(awful.util.table.join(awful.button({}, 1,
function ()
    awful.util.spawn_with_shell("mpc prev || ncmpcpp prev || ncmpc prev || pms prev")
    mpdwidget.update()
end)))
next_icon:buttons(awful.util.table.join(awful.button({}, 1,
function ()
    awful.util.spawn_with_shell("mpc next || ncmpcpp next || ncmpc next || pms next")
    mpdwidget.update()
end)))
stop_icon:buttons(awful.util.table.join(awful.button({}, 1,
function ()
    play_pause_icon:set_image(beautiful.play)
    awful.util.spawn_with_shell("mpc stop || ncmpcpp stop || ncmpc stop || pms stop")
    mpdwidget.update()
end)))
play_pause_icon:buttons(awful.util.table.join(awful.button({}, 1,
function ()
    awful.util.spawn_with_shell("mpc toggle || ncmpcpp toggle || ncmpc toggle || pms toggle")
    mpdwidget.update()
end)))

-- Battery
batwidget = lain.widgets.bat({
    settings = function()
        bat_header = " Bat "
        bat_p      = bat_now.perc .. " "

        if bat_now.status == "Not present" then
            bat_header = ""
            bat_p      = ""
        end

        widget:set_markup(markup(blue, bat_header) .. bat_p)
    end
})

-- ALSA volume bar
myvolumebar = lain.widgets.alsabar({
    ticks  = true,
    width  = 80,
    height = 10,
    colors = {
        background = "#383838",
        unmute     = "#80CCE6",
        mute       = "#FF9F9F"
    },
    notifications = {
        font      = "Tamsyn",
        font_size = "12",
        bar_size  = 32
    }
})
alsamargin = wibox.layout.margin(myvolumebar.bar, 5, 8, 80)
wibox.layout.margin.set_top(alsamargin, 12)
wibox.layout.margin.set_bottom(alsamargin, 12)
volumewidget = wibox.widget.background()
volumewidget:set_widget(alsamargin)
volumewidget:set_bgimage(beautiful.widget_bg)

-- CPU
cpu_widget = lain.widgets.cpu({
    settings = function()
        widget:set_markup(space3 .. "CPU " .. cpu_now.usage
                          .. "%" .. markup.font("Tamsyn 5", " "))
    end
})
cpuwidget = wibox.widget.background()
cpuwidget:set_widget(cpu_widget)
cpuwidget:set_bgimage(beautiful.widget_bg)
cpu_icon = wibox.widget.imagebox()
cpu_icon:set_image(beautiful.cpu)

-- Net
netdown_icon = wibox.widget.imagebox()
netdown_icon:set_image(beautiful.net_down)
netup_icon = wibox.widget.imagebox()
netup_icon:set_image(beautiful.net_up)
netwidget = lain.widgets.net({
    settings = function()
        widget:set_markup(markup.font("Tamsyn 1", " ") .. net_now.received .. " - "
                          .. net_now.sent .. space2)
    end
})
networkwidget = wibox.widget.background()
networkwidget:set_widget(netwidget)
networkwidget:set_bgimage(beautiful.widget_bg)

-- Weather
yawn = lain.widgets.yawn(123456)

-- Separators
first = wibox.widget.textbox('<span font="Tamsyn 4"> </span>')
last = wibox.widget.imagebox()
last:set_image(beautiful.last)
spr = wibox.widget.imagebox()
spr:set_image(beautiful.spr)
spr_small = wibox.widget.imagebox()
spr_small:set_image(beautiful.spr_small)
spr_very_small = wibox.widget.imagebox()
spr_very_small:set_image(beautiful.spr_very_small)
spr_right = wibox.widget.imagebox()
spr_right:set_image(beautiful.spr_right)
spr_bottom_right = wibox.widget.imagebox()
spr_bottom_right:set_image(beautiful.spr_bottom_right)
spr_left = wibox.widget.imagebox()
spr_left:set_image(beautiful.spr_left)
bar = wibox.widget.imagebox()
bar:set_image(beautiful.bar)
bottom_bar = wibox.widget.imagebox()
bottom_bar:set_image(beautiful.bottom_bar)

-- Create a wibox for each screen and add it
mywibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
require("stock.taglist")
require("stock.tasklist")

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 32 })

    -- Widgets that are aligned to the upper left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(first)
    left_layout:add(mytaglist[s])
    left_layout:add(spr_small)
    left_layout:add(mylayoutbox[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the upper right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    --right_layout:add(mailwidget)
    right_layout:add(batwidget)
    right_layout:add(spr_right)
    right_layout:add(prev_icon)
    right_layout:add(next_icon)
    right_layout:add(stop_icon)
    right_layout:add(play_pause_icon)
    right_layout:add(bar)
    right_layout:add(mpd_icon)
    right_layout:add(musicwidget)
    right_layout:add(bar)
    right_layout:add(spr_very_small)
    right_layout:add(volumewidget)
    right_layout:add(spr_left)

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

    -- Create the bottom wibox
    mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s, border_width = 0, height = 32 })

    -- Widgets that are aligned to the bottom left
    bottom_left_layout = wibox.layout.fixed.horizontal()
    bottom_left_layout:add(awesome_icon)

    -- Widgets that are aligned to the bottom right
    bottom_right_layout = wibox.layout.fixed.horizontal()
    bottom_right_layout:add(spr_bottom_right)
    bottom_right_layout:add(netdown_icon)
    bottom_right_layout:add(networkwidget)
    bottom_right_layout:add(netup_icon)
    bottom_right_layout:add(bottom_bar)
    bottom_right_layout:add(cpu_icon)
    bottom_right_layout:add(cpuwidget)
    bottom_right_layout:add(bottom_bar)
    bottom_right_layout:add(calendar_icon)
    bottom_right_layout:add(calendarwidget)
    bottom_right_layout:add(bottom_bar)
    bottom_right_layout:add(clock_icon)
    bottom_right_layout:add(clockwidget)
    bottom_right_layout:add(last)

    -- Now bring it all together (with the tasklist in the middle)
    bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_left(bottom_left_layout)
    bottom_layout:set_middle(mytasklist[s])
    bottom_layout:set_right(bottom_right_layout)
    mybottomwibox[s]:set_widget(bottom_layout)

    -- Set proper backgrounds, instead of beautiful.bg_normal
    mywibox[s]:set_bg(beautiful.topbar_path .. screen[mouse.screen].workarea.width .. ".png")
    mybottomwibox[s]:set_bg("#242424")

    -- Create a borderbox above the bottomwibox
    lain.widgets.borderbox(mybottomwibox[s], s, { position = "top", color = "#0099CC" } )
end
-- }}}

-- Bindings
require("settings.binds")

-- {{{ Key bindings
globalkeys = awful.util.table.join(globalkeys,
    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
        mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
        mybottomwibox[mouse.screen].visible = not mybottomwibox[mouse.screen].visible
    end),

    -- On the fly useless gaps change
    awful.key({ altkey, "Control" }, "+", function () lain.util.useless_gaps_resize(1) end),
    awful.key({ altkey, "Control" }, "-", function () lain.util.useless_gaps_resize(-1) end),

    -- Widgets popups
    awful.key({ altkey,           }, "c",      function () lain.widgets.calendar:show(7) end),
    awful.key({ altkey,           }, "w",      function () yawn.show(7) end),

    -- ALSA volume control
    awful.key({ altkey }, "Up",
        function ()
            awful.util.spawn("amixer -q set " .. myvolumebar.channel .. " " .. myvolumebar.step .. "+")
            myvolumebar.notify()
        end),
    awful.key({ altkey }, "Down",
        function ()
            awful.util.spawn("amixer -q set " .. myvolumebar.channel .. " " .. myvolumebar.step .. "-")
            myvolumebar.notify()
        end),
    awful.key({ altkey }, "m",
        function ()
            awful.util.spawn("amixer -q set " .. myvolumebar.channel .. " playback toggle")
            myvolumebar.notify()
        end),
    awful.key({ altkey, "Control" }, "m",
        function ()
            awful.util.spawn("amixer -q set " .. myvolumebar.channel .. " playback 100%")
            myvolumebar.notify()
        end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- Rules
require("settings.rules")

-- Signals
require("stock.signals")
