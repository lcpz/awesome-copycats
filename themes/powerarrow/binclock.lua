--[[

     Licensed under GNU General Public License v2
      * (c) 2017, Luca CPZ
      * (c) 2013, romockee

--]]

local gears  = require("gears")
local wibox  = require("wibox")
local date   = os.date
local ipairs = ipairs
local math   = math
local select = select
local string = string

local binclock = {}

function binclock.dec2bin(num, bits)
    local bits, t = bits or select(2, math.frexp(num)), {}
    for b = bits, 1, -1 do
        t[b] = math.fmod(num, 2)
        num = (num - t[b]) / 2
    end
    return t
end

function binclock.paintdot(cr, val, shift)
    local height = 0
    for _, bit in ipairs(binclock.dec2bin(val, 4)) do
        if bit >= 1 then
            cr:set_source(gears.color(binclock.color_active))
        else
            cr:set_source(gears.color(binclock.color_inactive))
        end
        cr:rectangle(shift, height, binclock.dotsize, binclock.dotsize)
        cr:fill()
        height = height + binclock.dotsize + binclock.step
    end
end

local function factory(args)
    local args = args or {}

    binclock.width          = args.width or 42
    binclock.height         = args.height or 18
    binclock.show_seconds   = args.show_seconds or false
    binclock.color_active   = args.color_active or "#CCCCCC"
    binclock.color_inactive = args.color_inactive or "#444444"
    binclock.dotsize        = math.floor(binclock.height / 5)
    binclock.step           = math.floor(binclock.dotsize / 3)

    binclock.widget = wibox.widget {
        fit = function(self, context, width, height)
            return binclock.width, binclock.height
        end,
        draw = function(self, context, cr, width, height)
            local t = date("*t")

            local hour = string.format("%02d", t.hour)
            local min  = string.format("%02d", t.min)
            local sec  = string.format("%02d", t.sec)

            local col_count = 4
            if binclock.show_seconds then
                col_count = 6
            end
            local step = math.floor((binclock.width - col_count * binclock.dotsize) / 8)

            binclock.paintdot(cr, string.sub(hour, 1, 1), step, 2)
            binclock.paintdot(cr, string.sub(hour, 2, 2), binclock.dotsize + 2 * step)

            binclock.paintdot(cr, string.sub(min, 1, 1), binclock.dotsize * 2 + 4 * step)
            binclock.paintdot(cr, string.sub(min, 2, 2), binclock.dotsize * 3 + 5 * step)

            if binclock.show_seconds then
                binclock.paintdot(cr, string.sub(sec, 1, 1), binclock.dotsize * 4 + 7 * step)
                binclock.paintdot(cr, string.sub(sec, 2, 2), binclock.dotsize * 5 + 8 * step)
            end
        end,
        layout = wibox.widget.base.make_widget
    }

    binclock.timer = gears.timer {
        autostart  = true,
        timeout    = binclock.show_seconds and 1 or 60,
        callback   = function()
            binclock.widget:emit_signal("widget::redraw_needed")
        end
    }

    return binclock
end

return factory
