local awful = require("awful")

local startup =
{
    awful.spawn.with_shell("nitrogen --set-zoom-fill --no-recurse --random --head=0 ~/Pictures/SFW/Nature"),
    awful.spawn.with_shell("optimus-manager-qt"),
    os.execute("picom -b"),
}

return startup
