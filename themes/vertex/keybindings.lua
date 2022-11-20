local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup")


local keybindings = {

}

function keybindings.get_global_keys(mytable, modkey, altkey, cycle_prev, browser, terminal, BLUESTATUS)
    local globalkeys = mytable.join(-- Destroy all notifications
        awful.key({ "Control", "Shift" }, "Escape", function()
            naughty.destroy_all_notifications()
        end, {
            description = "destroy all notifications",
            group = "hotkeys"
        }), -- Take a screenshot
        -- https://github.com/lcpz/dots/blob/master/bin/screenshot
        awful.key({ altkey }, "p", function()
            os.execute("screenshot")
        end, {
            description = "take a screenshot",
            group = "hotkeys"
        }), -- xlock screen locker
        awful.key({ altkey, "Control", "Shift" }, "l", function()
            os.execute("xlock")
        end, {
            description = "lock screen",
            group = "hotkeys"
        }), -- Show help
        awful.key({ modkey }, "s", hotkeys_popup.show_help, {
            description = "show help",
            group = "awesome"
        }), -- Tag browsing
        awful.key({ modkey, "Ctrl" }, "Left", awful.tag.viewprev, {
            description = "view previous",
            group = "tag"
        }), awful.key({ modkey, "Ctrl" }, "Right", awful.tag.viewnext, {
            description = "view next",
            group = "tag"
        }), awful.key({ modkey }, "Escape", awful.tag.history.restore, {
            description = "go back",
            group = "tag"
        }), -- Non-empty tag browsing
        awful.key({ altkey }, "Left", function()
            lain.util.tag_view_nonempty(-1)
        end, {
            description = "view  previous nonempty",
            group = "tag"
        }), awful.key({ altkey }, "Right", function()
            lain.util.tag_view_nonempty(1)
        end, {
            description = "view  previous nonempty",
            group = "tag"
        }), -- Default client focus
        awful.key({ altkey }, "j", function()
            awful.client.focus.byidx(1)
        end, {
            description = "focus next by index",
            group = "client"
        }), awful.key({ altkey }, "k", function()
            awful.client.focus.byidx(-1)
        end, {
            description = "focus previous by index",
            group = "client"
        }), -- By-direction client focus
        awful.key({ modkey }, "j", function()
            awful.client.focus.global_bydirection("down")
            if client.focus then
                client.focus:raise()
            end
        end, {
            description = "focus down",
            group = "client"
        }), awful.key({ modkey }, "k", function()
            awful.client.focus.global_bydirection("up")
            if client.focus then
                client.focus:raise()
            end
        end, {
            description = "focus up",
            group = "client"
        }), awful.key({ modkey }, "h", function()
            awful.client.focus.global_bydirection("left")
            if client.focus then
                client.focus:raise()
            end
        end, {
            description = "focus left",
            group = "client"
        }), awful.key({ modkey }, "l", function()
            awful.client.focus.global_bydirection("right")
            if client.focus then
                client.focus:raise()
            end
        end, {
            description = "focus right",
            group = "client"
        }), -- Menu
        -- awful.key({modkey}, "w", function()
        --     awful.util.mymainmenu:show()
        -- end, {
        --     description = "show main menu",
        --     group = "awesome"
        -- }), -- Layout manipulation
        awful.key({ modkey, "Shift" }, "j", function()
            awful.client.swap.byidx(1)
        end, {
            description = "swap with next client by index",
            group = "client"
        }), awful.key({ modkey, "Shift" }, "k", function()
            awful.client.swap.byidx(-1)
        end, {
            description = "swap with previous client by index",
            group = "client"
        }), awful.key({ modkey, "Control" }, "j", function()
            awful.screen.focus_relative(1)
        end, {
            description = "focus the next screen",
            group = "screen"
        }), awful.key({ modkey, "Control" }, "k", function()
            awful.screen.focus_relative(-1)
        end, {
            description = "focus the previous screen",
            group = "screen"
        }), awful.key({ modkey }, "u", awful.client.urgent.jumpto, {
            description = "jump to urgent client",
            group = "client"
        }), awful.key({ modkey }, "Tab", function()
            if cycle_prev then
                awful.client.focus.history.previous()
            else
                awful.client.focus.byidx(-1)
            end
            if client.focus then
                client.focus:raise()
            end
        end, {
            description = "cycle with previous/go back",
            group = "client"
        }), -- Show/hide wibox
        awful.key({ modkey }, "b", function()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end, {
            description = "toggle wibox",
            group = "awesome"
        }), -- On-the-fly useless gaps change
        -- awful.key({ altkey, "Control" }, "+", function()
        --     lain.util.useless_gaps_resize(1)
        -- end, {
        --     description = "increment useless gaps",
        --     group = "tag"
        -- }), awful.key({ altkey, "Control" }, "-", function()
        --     lain.util.useless_gaps_resize(-1)
        -- end, {
        --     description = "decrement useless gaps",
        --     group = "tag"
        -- }),
        -- Dynamic tagging
        -- awful.key({modkey, "Shift"}, "n", function()
        --     lain.util.add_tag()
        -- end, {
        --     description = "add new tag",
        --     group = "tag"
        -- }),
        -- awful.key({modkey, "Shift"}, "r", function()
        --     lain.util.rename_tag()
        -- end, {
        --     description = "rename tag",
        --     group = "tag"
        -- }),
        awful.key({ modkey, "Shift" }, "Left", function()
            lain.util.move_tag(-1)
        end, {
            description = "move tag to the left",
            group = "tag"
        }), awful.key({ modkey, "Shift" }, "Right", function()
            lain.util.move_tag(1)
        end, {
            description = "move tag to the right",
            group = "tag"
        }), -- awful.key({modkey, "Shift"}, "d", function()
        --     lain.util.delete_tag()
        -- end, {
        --     description = "delete tag",
        --     group = "tag"
        -- }),
        -- Standard program
        awful.key({ modkey }, "Return", function()
            awful.spawn(terminal)
        end, {
            description = "open a terminal",
            group = "launcher"
        }), awful.key({ modkey, "Control" }, "r", awesome.restart, {
            description = "reload awesome",
            group = "awesome"
        }), awful.key({ modkey, "Shift" }, "q", awesome.quit, {
            description = "quit awesome",
            group = "awesome"
        }), awful.key({ modkey, altkey }, "l", function()
            awful.tag.incmwfact(0.05)
        end, {
            description = "increase master width factor",
            group = "layout"
        }), awful.key({ modkey, altkey }, "h", function()
            awful.tag.incmwfact(-0.05)
        end, {
            description = "decrease master width factor",
            group = "layout"
        }), awful.key({ modkey, "Shift" }, "h", function()
            awful.tag.incnmaster(1, nil, true)
        end, {
            description = "increase the number of master clients",
            group = "layout"
        }), awful.key({ modkey, "Shift" }, "l", function()
            awful.tag.incnmaster(-1, nil, true)
        end, {
            description = "decrease the number of master clients",
            group = "layout"
        }), awful.key({ modkey, "Control" }, "h", function()
            awful.tag.incncol(1, nil, true)
        end, {
            description = "increase the number of columns",
            group = "layout"
        }), awful.key({ modkey, "Control" }, "l", function()
            awful.tag.incncol(-1, nil, true)
        end, {
            description = "decrease the number of columns",
            group = "layout"
        }), awful.key({ modkey }, "space", function()
            awful.layout.inc(1)
        end, {
            description = "select next",
            group = "layout"
        }), awful.key({ modkey, "Shift" }, "space", function()
            awful.layout.inc(-1)
        end, {
            description = "select previous",
            group = "layout"
        }), awful.key({ modkey, "Control" }, "n", function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize", {
                    raise = true
                })
            end
        end, {
            description = "restore minimized",
            group = "client"
        }), -- Dropdown application
        awful.key({ modkey }, "z", function()
            awful.screen.focused().quake:toggle()
        end, {
            description = "dropdown application",
            group = "launcher"
        }), -- Widgets popups
        -- awful.key({ altkey }, "c", function()
        --     if beautiful.cal then
        --         beautiful.cal.show(7)
        --     end
        -- end, {
        --     description = "show calendar",
        --     group = "widgets"
        -- }), awful.key({ altkey }, "h", function()
        --     if beautiful.fs then
        --         beautiful.fs.show(7)
        --     end
        -- end, {
        --     description = "show filesystem",
        --     group = "widgets"
        -- }), awful.key({ altkey }, "w", function()
        --     if beautiful.weather then
        --         beautiful.weather.show(7)
        --     end
        -- end, {
        --     description = "show weather",
        --     group = "widgets"
        -- }),
        -- User programs
        awful.key({ modkey }, "w", function()
            awful.spawn(browser)
        end, {
            description = "run browser",
            group = "launcher"
        }), -- Screen brightness
        awful.key({}, "#233", function()
            os.execute("light -A 10")
        end, {
            description = "Fn + f6 --- brightness +10%",
            group = "hotkeys"
        }), awful.key({}, "#232", function()
            os.execute("light -U 10")
        end, {
            description = "Fn + f5 --- brightness -10%",
            group = "hotkeys"
        }), -- Max/Min Brightness
        awful.key({ altkey, "Control", "Shift" }, "0", function()
            os.execute("light -S 0")
        end, {
            description = "Min screen brightness",
            group = "hotkeys"
        }), awful.key({ altkey, "Control", "Shift" }, "9", function()
            os.execute("light -S 100")
        end, {
            description = "Max screen brightness",
            group = "hotkeys"
        }), awful.key({ altkey, "Control", "Shift" }, "m", function()
            os.execute("light -S 50")
        end, {
            description = "Mid screen brightness",
            group = "hotkeys"
        }), -- Bluetooth toggle
        awful.key({ altkey, "Control", "Shift" }, "b", function()
            os.execute("rfkill toggle bluetooth")
            if BLUESTATUS == false then
                naughty.notify({
                    title = "Bluetooth",
                    text = "Bluetooth is ON"
                })
                BLUESTATUS = true
            else
                naughty.notify({
                    title = "Bluetooth",
                    text = "Bluetooth is OFF"
                })
                BLUESTATUS = false
            end
        end, {
            description = "Bluetooth toggle ON/OFF",
            group = "hotkeys"
        }), -- ALSA volume control
        awful.key({}, "#123", function()
            os.execute(string.format("amixer -q set %s 5%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end, {
            description = "Fn + f3 --- volume up",
            group = "hotkeys"
        }), awful.key({}, "#122", function()
            os.execute(string.format("amixer -q set %s 5%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end, {
            description = "Fn + f2 --- volume down",
            group = "hotkeys"
        }), awful.key({}, "#121", function()
            os.execute(string.format("amixer -q set %s toggle",
                beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end, {
            description = "Fn + f1 --- toggle mute",
            group = "hotkeys"
        }), awful.key({ altkey, "Control" }, "9", function()
            os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
            beautiful.volume.update()
        end, {
            description = "volume 100%",
            group = "hotkeys"
        }), awful.key({ altkey, "Control" }, "0", function()
            os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
            beautiful.volume.update()
        end, {
            description = "volume 0%",
            group = "hotkeys"
        }), -- Copy primary to clipboard (terminals to gtk)
        awful.key({ modkey }, "c", function()
            awful.spawn.with_shell("xsel | xsel -i -b")
        end, {
            description = "copy terminal to gtk",
            group = "hotkeys"
        }), -- Copy clipboard to primary (gtk to terminals)
        awful.key({ modkey }, "v", function()
            awful.spawn.with_shell("xsel -b | xsel")
        end, {
            description = "copy gtk to terminal",
            group = "hotkeys"
        }), awful.key({ modkey }, 'd', function()
            for _, cl in ipairs(mouse.screen.selected_tag:clients()) do
                local c = cl
                if c then
                    if _G.client.focus then
                        c.minimized = true
                    else
                        c.minimized = false
                    end
                end
            end
        end, {
            description = "min/max all windows",
            group = "client"
        }), awful.key({ altkey, "Control" }, "n", function()
            for _, cl in ipairs(mouse.screen.selected_tag:clients()) do
                local c = cl
                if c then
                    c.minimized = true
                end
            end
        end, {
            description = "minimize all windows in current tag",
            group = "client"
        }), awful.key({ altkey, "Control" }, "m", function()
            for _, cl in ipairs(mouse.screen.selected_tag:clients()) do
                local c = cl
                if c then
                    c.minimized = false
                end
            end
        end, {
            description = "maximize all windows in current tag",
            group = "client"
        }), -- Default
        --[[ Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    --]] --[[ dmenu
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("dmenu_run -i -fn 'Monospace' -nb '%s' -nf '%s' -sb '%s' -sf '%s'",
            beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "show dmenu", group = "launcher"}),
    --]] -- alternatively use rofi, a dmenu-like application with more features
        -- check https://github.com/DaveDavenport/rofi for more details
        --[[ rofi
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("rofi -show %s -theme %s",
            'run', 'dmenu'))
        end,
        {description = "show rofi", group = "launcher"}),
    --]] -- Prompt
        awful.key({ modkey }, "r", function()
            awful.util.spawn("rofi -show drun -matching fuzzy")
        end, {
            description = "run rofi",
            group = "launcher"
        }), awful.key({ modkey }, "g", function()
            awful.util.spawn("rofisearch")
        end, {
            description = "run rofi",
            group = "launcher"
        }), awful.key({ modkey }, "x", function()
            awful.prompt.run {
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end, {
            description = "lua execute prompt",
            group = "awesome"
        })
    )

    return globalkeys
end

function keybindings.get_user_keys(mytable, awful, lain, altkey, modkey)
    -- User hey bindings
    local clientkeys = mytable.join(awful.key({ altkey, "Shift" }, "m", lain.util.magnify_client, {
        description = "magnify client",
        group = "client"
    }), awful.key({ modkey }, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, {
        description = "toggle fullscreen",
        group = "client"
    }), awful.key({ modkey }, "q", function(c)
        c:kill()
    end, {
        description = "close",
        group = "client"
    }), awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle, {
        description = "toggle floating",
        group = "client"
    }), awful.key({ modkey, "Control" }, "Return", function(c)
        c:swap(awful.client.getmaster())
    end, {
        description = "move to master",
        group = "client"
    }), awful.key({ modkey }, "o", function(c)
        c:move_to_screen()
    end, {
        description = "move to screen",
        group = "client"
    }), awful.key({ modkey }, "t", function(c)
        c.ontop = not c.ontop
    end, {
        description = "toggle keep on top",
        group = "client"
    }), awful.key({ modkey }, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, {
        description = "minimize",
        group = "client"
    }), awful.key({ modkey }, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end, {
        description = "(un)maximize",
        group = "client"
    }), awful.key({ modkey, "Control" }, "m", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end, {
        description = "(un)maximize vertically",
        group = "client"
    }), awful.key({ modkey, "Shift" }, "m", function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end, {
        description = "(un)maximize horizontally",
        group = "client"
    }))

    return clientkeys

end

return keybindings
