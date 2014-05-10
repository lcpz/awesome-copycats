local widget = widget
local screen = screen
local image = image
local button = button
local table = table
local ipairs = ipairs
local awful = require("awful")
local utils = require("freedesktop.utils")
local wibox = require("wibox")
local capi = { screen = screen }

module("freedesktop.desktop")

local current_pos = {}
local iconsize = { width = 48, height = 48 }
local labelsize = { width = 130, height = 20 }
local margin = { x = 20, y = 20 }

function add_icon(settings)

    local s = settings.screen

    if not current_pos[s] then
        current_pos[s] = { x = (capi.screen[s].geometry.width - iconsize.width - margin.x), y = 40 }
    end

    local totheight = (settings.icon and iconsize.height or 0) + (settings.label and labelsize.height or 0)
    if totheight == 0 then return end

    if current_pos[s].y + totheight > capi.screen[s].geometry.height - 40 then
        current_pos[s].x = current_pos[s].x - labelsize.width - iconsize.width - margin.x
        current_pos[s].y = 40
    end

    if (settings.icon) then
        icon = awful.widget.button({ image = settings.icon })
        local newbuttons = icon:buttons({}, 1, nil, settings.click)
        table.insert(newbuttons, button({}, 1, nil, settings.click));
        icon:buttons(newbuttons)

        icon_container = wibox({ position = "floating", screen = s, bg = "#00000000" })
        icon_container.widgets = { icon }
        icon_container:geometry({
            width = iconsize.width,
            height = iconsize.height,
            y = current_pos[s].y,
            x = current_pos[s].x
        })
        icon_container.screen = s

        current_pos[s].y = current_pos[s].y + iconsize.height + 5
    end

    if (settings.label) then
        caption = wibox.widget.textbox()
        caption.ellipsize = "middle"
        caption.text = settings.label
        caption:buttons({
            button({ }, 1, settings.click)
        })

        caption_container = wibox({ position = "floating", screen = s, bg = "#00000000" })
        caption_container.widgets = { caption }
        caption_container:geometry({
            width = labelsize.width,
            height = labelsize.height,
            y = current_pos[s].y,
            x = current_pos[s].x - labelsize.width + iconsize.width
        })
        caption_container.screen = s
    end

    current_pos[s].y = current_pos[s].y + labelsize.height + margin.y
end

--- Adds subdirs and files icons to the desktop
-- @param dir The directory to parse, (default is ~/Desktop)
-- @param showlabels Shows icon captions (default is false)
function add_applications_icons(arg)
    for i, program in ipairs(utils.parse_desktop_files({
        dir = arg.dir or '~/Desktop/',
        icon_sizes = {
            iconsize.width .. "x" .. iconsize.height,
            "128x128", "96x96", "72x72", "64x64", "48x48",
            "36x36", "32x32", "24x24", "22x22", "16x6"
        }
    })) do
        if program.show then
            add_icon({
                label = arg.showlabels and program.Name or nil,
                icon = program.icon_path,
                screen = arg.screen,
                click = function () awful.util.spawn(program.cmdline) end
            })
        end
    end
end

--- Adds subdirs and files icons to the desktop
-- @param dir The directory to parse
-- @param showlabels Shows icon captions
-- @param open_with The program to use to open clicked files and dirs (i.e. xdg_open, thunar, etc.)
function add_dirs_and_files_icons(arg)
    arg.open_with = arg.open_width or 'thunar'
    for i, file in ipairs(utils.parse_dirs_and_files({
        dir = arg.dir or '~/Desktop/',
        icon_sizes = {
            iconsize.width .. "x" .. iconsize.height,
            "128x128", "96x96", "72x72", "64x64", "48x48",
            "36x36", "32x32", "24x24", "22x22", "16x6"
        }
    })) do
        if file.show then
            add_icon({
                label = arg.showlabels and file.filename or nil,
                icon = file.icon,
                screen = arg.screen,
                click = function () awful.util.spawn(arg.open_with .. ' ' .. file.path) end
            })
        end
    end
end

function add_desktop_icons(args)
    add_applications_icons(args)
    add_dirs_and_files_icons(args)
end
