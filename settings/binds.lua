local awful = require("awful")
local drop = require("scratchdrop")

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

-- }}}
