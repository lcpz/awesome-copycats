---------------------------------------------------------------------------
-- @author Uli Schlachter &lt;psychon@znc.in&gt;
-- @copyright 2009 Uli Schlachter
-- @copyright 2008 Julien Danjou
-- @release v3.4.11
---------------------------------------------------------------------------

-- Grab environment we need
local ipairs = ipairs

module("layouts.spiralgaps")

local function spiral(p, spiral)
    local wa = p.workarea
    local cls = p.clients
    local n = #cls

    local static_wa = wa

    for k, c in ipairs(cls) do
        if k < n then
            if k % 2 == 0 then
                wa.height = wa.height / 2
            else
                wa.width = wa.width / 2
            end
        end

        if k % 4 == 0 and spiral then
            wa.x = wa.x - wa.width
        elseif k % 2 == 0 or
            (k % 4 == 3 and k < n and spiral) then
            wa.x = wa.x + wa.width
        end

        if k % 4 == 1 and k ~= 1 and spiral then
            wa.y = wa.y - wa.height
        elseif k % 2 == 1 and k ~= 1 or
            (k % 4 == 0 and k < n and spiral) then
            wa.y = wa.y + wa.height
        end

            local wa2 = {}
            wa2.x = wa.x
            wa2.y = wa.y
            wa2.height = wa.height
            wa2.width = wa.width


            -- Useless gap.
            useless_gap = 25
            if useless_gap > 0
            then
                -- Top and left clients are shrinked by two steps and
                -- get moved away from the border. Other clients just
                -- get shrinked in one direction.

                top = false
		left = false

                if wa2.y == static_wa.y then
                    top = true
                end

		if wa2.x == static_wa.x then
		    left = true
		end

		if top then
	                wa2.height = wa2.height - 2 * useless_gap
        	        wa2.y = wa2.y + useless_gap
		else
			wa2.height = wa2.height - useless_gap
		end

		if left then
                	wa2.width = wa2.width - 2 * useless_gap
                	wa2.x = wa2.x + useless_gap
		else
			wa2.width = wa2.width - useless_gap
		end
            end
            -- End of useless gap.

        c:geometry(wa2)
    end
end

--- Dwindle layout
dwindle = {}
dwindle.name = "dwindlegaps"
function dwindle.arrange(p)
    return spiral(p, false)
end

--- Spiral layout
name = "spiralgaps"
function arrange(p)
    return spiral(p, true)
end

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
