local awful = require("awful")

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
     awful.button({ }, 1, function (c)
                              if c == client.focus then
                                  c.minimized = true
                              else
                                  -- Without this, the following
                                  -- :isvisible() makes no sense
                                  c.minimized = false
                                  if not c:isvisible() then
                                      awful.tag.viewonly(c:tags()[1])
                                  end
                                  -- This will also un-minimize
                                  -- the client, if needed
                                  client.focus = c
                                  c:raise()
                              end
                          end),
     awful.button({ }, 3, function ()
                              if instance then
                                  instance:hide()
                                  instance = nil
                              else
                                  instance = awful.menu.clients({ width=250 })
                              end
                          end),
     awful.button({ }, 4, function ()
                              awful.client.focus.byidx(1)
                              if client.focus then client.focus:raise() end
                          end),
     awful.button({ }, 5, function ()
                              awful.client.focus.byidx(-1)
                              if client.focus then client.focus:raise() end
                          end)
)
