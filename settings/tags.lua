local awful = require("awful")

layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}


tags = {
   names = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
   layout = {
     layouts[1],
     layouts[1],
     layouts[1],
     layouts[1],
     layouts[1],
     layouts[1],
     layouts[1],
     layouts[1],
     layouts[1],
   }
}

for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
