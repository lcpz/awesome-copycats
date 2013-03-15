---------------------------------------------------------------
-- Basic scratchpad manager for the awesome window manager
---------------------------------------------------------------
-- Coded by: * Adrian C. (anrxc) <anrxc@sysphere.org>
-- Licensed under the WTFPL version 2
--   * http://sam.zoy.org/wtfpl/COPYING
---------------------------------------------------------------
-- To use this module add:
--     local scratch = require("scratch")
-- to the top of your rc.lua, and call:
--     scratch.pad.set(c, width, height, sticky, screen)
-- from a clientkeys binding, and:
--     scratch.pad.toggle(screen)
-- from a globalkeys binding.
--
-- Parameters:
--     c      - Client to scratch or un-scratch
--     width  - Width in absolute pixels, or width percentage
--              when <= 1 (0.50 (50% of the screen) by default)
--     height - Height in absolute pixels, or height percentage
--              when <= 1 (0.50 (50% of the screen) by default)
--     sticky - Visible on all tags, false by default
--     screen - Screen (optional), mouse.screen by default
---------------------------------------------------------------

-- Grab environment
local pairs = pairs
local awful = require("awful")
local capi = {
    mouse = mouse,
    client = client,
    screen = screen
}

-- Scratchpad: basic scratchpad manager for the awesome window manager
local pad = {} -- module scratch.pad


local scratchpad = {}

-- Toggle a set of properties on a client.
local function toggleprop(c, prop)
    c.ontop  = prop.ontop  or false
    c.above  = prop.above  or false
    c.hidden = prop.hidden or false
    c.sticky = prop.stick  or false
    c.skip_taskbar = prop.task or false
end

-- Scratch the focused client, or un-scratch and tile it. If another
-- client is already scratched, replace it with the focused client.
function pad.set(c, width, height, sticky, screen)
    width  = width  or 0.50
    height = height or 0.50
    sticky = sticky or false
    screen = screen or capi.mouse.screen

    -- Determine signal usage in this version of awesome
    local attach_signal = capi.client.connect_signal    or capi.client.add_signal
    local detach_signal = capi.client.disconnect_signal or capi.client.remove_signal

    local function setscratch(c)
        -- Scratchpad is floating and has no titlebar
        awful.client.floating.set(c, true); awful.titlebar.remove(c)

        -- Scratchpad client properties
        toggleprop(c, {ontop=true, above=true, task=true, stick=sticky})

        -- Scratchpad geometry and placement
        local screengeom = capi.screen[screen].workarea
        if width  <= 1 then width  = screengeom.width  * width  end
        if height <= 1 then height = screengeom.height * height end

        c:geometry({ -- Scratchpad is always centered on screen
            x = screengeom.x + (screengeom.width  - width)  / 2,
            y = screengeom.y + (screengeom.height - height) / 2,
            width = width,      height = height
        })

        -- Scratchpad should not loose focus
        c:raise(); capi.client.focus = c
    end

    -- Prepare a table for storing clients,
    if not scratchpad.pad then scratchpad.pad = {}
        -- add unmanage signal for scratchpad clients
        attach_signal("unmanage", function (c)
            for scr, cl in pairs(scratchpad.pad) do
                if cl == c then scratchpad.pad[scr] = nil end
            end
        end)
    end

    -- If the scratcphad is emtpy, store the client,
    if not scratchpad.pad[screen] then
        scratchpad.pad[screen] = c
        -- then apply geometry and properties
        setscratch(c)
    else -- If a client is already scratched,
        local oc = scratchpad.pad[screen]
        -- unscratch, and compare it with the focused client
        awful.client.floating.toggle(oc); toggleprop(oc, {})
        -- If it matches clear the table, if not replace it
        if   oc == c then scratchpad.pad[screen] =     nil
        else scratchpad.pad[screen] = c; setscratch(c) end
    end
end

-- Move the scratchpad to the current workspace, focus and raise it
-- when it's hidden, or hide it when it's visible.
function pad.toggle(screen)
    screen = screen or capi.mouse.screen

    -- Check if we have a client on storage,
    if scratchpad.pad and
       scratchpad.pad[screen] ~= nil
    then -- and get it out, to play
        local c = scratchpad.pad[screen]

        -- If it's visible on another tag hide it,
        if c:isvisible() == false then c.hidden = true
            -- and move it to the current worskpace
            awful.client.movetotag(awful.tag.selected(screen), c)
        end

        -- Focus and raise if it's hidden,
        if c.hidden then
            awful.placement.centered(c)
            c.hidden = false
            c:raise(); capi.client.focus = c
        else -- hide it if it's not
            c.hidden = true
        end
    end
end

return pad
