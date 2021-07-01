
--[[
                                                  
     Licensed under GNU General Public License v2 
      * (c) 2017, Luke Bonham                     
      * (c) 2013, maisvendoo                      
                                                  
--]]

local timer = require("gears.timer")
local wibox = require("wibox")
local date  = os.date
local math  = math

local clock = {}

function clock.new(args)
    local args    = args or {}
    local screen  = args.screen or 1
    local font    = args.font or "Times"
    local width   = args.width or 300
    local height  = args.weight or 300
    local x       = args.x or 20
    local y       = args.y or 20
    local bg      = args.bg or "#00000000" -- transparent

    clock.wibox = wibox {
        bg       = bg,
        width    = width,
        height   = height,
        ontop    = false,
        visible  = true,
        screen   = screen
    }

    clock.wibox : geometry { x = x, y = y }

    clock.wibox : setup {
        fit = function(self, context, width, height)
            return width, height
        end,
        draw = function(self, context, cr, width, height)
            -- Any params calculation
            local radius   = width/2 - 5
            local cx       = width/2
            local cy       = height/2
            local hour_len = 15
            local min_len  = 7

            -- Draw dial

            -- Draw hour divisions
            cr:set_line_width(2)
            cr:set_source_rgba(0.7, 0.7, 0.7, 1)

            local kx = 1.0
            local ky = 1.0

            for i = 0,11 do
                cr:move_to(cx + kx*(radius - hour_len)*math.sin(i*math.rad(30)), cy - kx*(radius - hour_len)*math.cos(i*math.rad(30)))
                cr:line_to(cx + ky*radius*math.sin(i*math.rad(30)), cy - ky*radius*math.cos(i*math.rad(30)))
                cr:stroke()
            end

            -- Draw minute divisions
            cr:set_line_width(1)
            cr:set_source_rgba(0.7, 0.7, 0.7, 1)

            for i = 0,59 do
                cr:move_to(cx + kx*(radius - min_len)*math.sin(i*math.rad(6)), cy - ky*(radius - min_len)*math.cos(i*math.rad(6)))
                cr:line_to(cx + kx*radius*math.sin(i*math.rad(6)), cy - ky*radius*math.cos(i*math.rad(6)))
                cr:stroke()
            end

            -- Draw digits on dial
            local dig_size   = 50
            local dig_radius = radius/1.3
            local n_hours    = 12

            cr:select_font_face(font, 0, 0)
            cr:set_font_size(dig_size)

            for i = 1,n_hours do
                local dig     = math.floor(i*12/n_hours)
                local extents = cr:text_extents(dig)

                local dx = cx + kx*dig_radius*math.sin(i*math.rad(360/n_hours))
                local dy = cy - ky*dig_radius*math.cos(i*math.rad(360/n_hours))

                local tx = dx - extents.width/2
                local ty = dy + extents.height/2

                cr:move_to(tx, ty)
                cr:show_text(dig)
            end

            -- Draw arrows

            -- Get local time
            local sec  = date("%S")
            local min  = date("%M")
            local hour = date("%H")

            -- Set arrow length
            local hour_arrow_len = radius/1.8
            local min_arrow_len  = radius - min_len - 8
            local sec_arrow_len  = radius - min_len - 6

            -- Draw hours arrow
            cr:set_line_width(9)
            cr:set_source_rgba(1, 1, 1, 1)

            cr:move_to(cx, cy)
            cr:line_to(cx + hour_arrow_len*math.sin(math.rad((hour + min/60 + sec/3600)*30)), cy - hour_arrow_len*math.cos(math.rad((hour + min/60 + sec/3600)*30)))
            cr:stroke()

            -- Draw minutes arrow
            cr:set_line_width(4)
            cr:set_source_rgba(1, 1, 1, 1)

            cr:move_to(cx, cy)
            cr:line_to(cx + min_arrow_len*math.sin(math.rad((min + sec/60)*6)), cy - sec_arrow_len*math.cos(math.rad((min + sec/60)*6)))
            cr:stroke()

            -- Draw seconds arrow
            cr:set_line_width(2)
            cr:set_source_rgba(1, 0.5, 0, 1)

            cr:move_to(cx, cy)
            cr:line_to(cx + sec_arrow_len*math.sin(sec*math.rad(6)), cy - sec_arrow_len*math.cos(sec*math.rad(6)))
            cr:stroke()
        end,
        layout = wibox.widget.base.make_widget
    }

    -- Create timer
    clock.timer = timer { timeout = 1 }

    -- Set timer callback
    clock.timer:connect_signal("timeout", function()
        clock.wibox.widget:emit_signal("widget::redraw_needed")
    end)

    -- Start timer
    clock.timer:start()
end

return clock
