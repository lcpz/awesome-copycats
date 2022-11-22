local awful = require("awful")
local beautiful = require("beautiful")

local startup =
{
    awful.spawn.with_shell("nitrogen --set-zoom-fill --no-recurse --random --head=0 ~/Pictures/SFW/Nature"),
    awful.spawn.with_shell("optimus-manager-qt"),
    awful.spawn.with_shell("picom -b"),

    -- Mute volume on startup
    os.execute(string.format("amixer set Master 0%%")),
    beautiful.volume.update(),
}

return startup
