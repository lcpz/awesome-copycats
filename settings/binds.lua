local awful = require("awful")
local drop  = require("third-party/scratchdrop")
local lain  = require("lain")

-- {{{ Mouse bindings

root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- }}}

-- {{{ Key bindings

globalkeys = awful.util.table.join(globalkeys,
  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey,           }, "Tab",
      function ()
          awful.client.focus.history.previous()
          if client.focus then
              client.focus:raise()
          end
      end),
  awful.key({ altkey, "Shift"   }, "l",      function () awful.tag.incmwfact( 0.05)     end),
  awful.key({ altkey, "Shift"   }, "h",      function () awful.tag.incmwfact(-0.05)     end),
  awful.key({ modkey, "Shift"   }, "l",      function () awful.tag.incnmaster(-1)       end),
  awful.key({ modkey, "Shift"   }, "h",      function () awful.tag.incnmaster( 1)       end),
  awful.key({ modkey, "Control" }, "l",      function () awful.tag.incncol(-1)          end),
  awful.key({ modkey, "Control" }, "h",      function () awful.tag.incncol( 1)          end),
  awful.key({ modkey,           }, "space",  function () awful.layout.inc(layouts,  1)  end),
  awful.key({ modkey, "Shift"   }, "space",  function () awful.layout.inc(layouts, -1)  end),
  awful.key({ modkey, "Control" }, "n",      awful.client.restore),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
  awful.key({ modkey, "Control" }, "r",      awesome.restart),
  awful.key({ modkey, "Shift"   }, "q",      awesome.quit),

  -- Dropdown terminal
  awful.key({ modkey,	          }, "z",      function () drop(terminal) end),

  -- Take a screenshot
  -- https://github.com/copycat-killer/dots/blob/master/bin/screenshot
  awful.key({ altkey }, "p", function() os.execute("screenshot") end),

  -- Tag browsing
  awful.key({ modkey }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey }, "Escape", awful.tag.history.restore),

  -- Non-empty tag browsing
  awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end),
  awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end),

  -- Default client focus
  awful.key({ altkey }, "k",
      function ()
          awful.client.focus.byidx( 1)
          if client.focus then client.focus:raise() end
      end),
  awful.key({ altkey }, "j",
      function ()
          awful.client.focus.byidx(-1)
          if client.focus then client.focus:raise() end
      end),

  -- By direction client focus
  awful.key({ modkey }, "j",
      function()
          awful.client.focus.bydirection("down")
          if client.focus then client.focus:raise() end
      end),
  awful.key({ modkey }, "k",
      function()
          awful.client.focus.bydirection("up")
          if client.focus then client.focus:raise() end
      end),
  awful.key({ modkey }, "h",
      function()
          awful.client.focus.bydirection("left")
          if client.focus then client.focus:raise() end
      end),
  awful.key({ modkey }, "l",
      function()
          awful.client.focus.bydirection("right")
          if client.focus then client.focus:raise() end
      end),

  -- Show Menu
  awful.key({ modkey }, "w",
      function ()
          mymainmenu:show({ keygrabber = true })
      end),

  -- MPD control
  awful.key({ altkey, "Control" }, "Up",
      function ()
          awful.util.spawn_with_shell("mpc toggle || ncmpcpp toggle || ncmpc toggle || pms toggle")
          mpdwidget.update()
      end),
  awful.key({ altkey, "Control" }, "Down",
      function ()
          awful.util.spawn_with_shell("mpc stop || ncmpcpp stop || ncmpc stop || pms stop")
          mpdwidget.update()
      end),
  awful.key({ altkey, "Control" }, "Left",
      function ()
          awful.util.spawn_with_shell("mpc prev || ncmpcpp prev || ncmpc prev || pms prev")
          mpdwidget.update()
      end),
  awful.key({ altkey, "Control" }, "Right",
      function ()
          awful.util.spawn_with_shell("mpc next || ncmpcpp next || ncmpc next || pms next")
          mpdwidget.update()
      end),

  -- Copy to clipboard
  awful.key({ modkey }, "c", function () os.execute("xsel -p -o | xsel -i -b") end),

  -- User programs
  awful.key({ modkey }, "q", function () awful.util.spawn(browser) end),
  awful.key({ modkey }, "i", function () awful.util.spawn(browser2) end),
  awful.key({ modkey }, "s", function () awful.util.spawn(gui_editor) end),
  awful.key({ modkey }, "g", function () awful.util.spawn(graphics) end),

  -- Prompt
  awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),
  awful.key({ modkey }, "x",
            function ()
                awful.prompt.run({ prompt = "Run Lua code: " },
                mypromptbox[mouse.screen].widget,
                awful.util.eval, nil,
                awful.util.getdir("cache") .. "/history_eval")
            end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- }}}
