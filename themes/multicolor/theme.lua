--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require "gears"
local lain = require "lain"
local awful = require "awful"
local wibox = require "wibox"
local dpi = require("beautiful.xresources").apply_dpi

local os = os
-- local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.confdir = os.getenv "HOME" .. "/.config/awesome/themes/multicolor"
theme.wallpaper = string.format("%s/Pictures/1308322.jpeg", os.getenv "HOME")
theme.font = "Monospace 11"

-- Menu
theme.menu_bg_normal = "#000000AA"
theme.menu_bg_focus = "#000000AA"
theme.menu_border_width = 0
theme.menu_width = dpi(130)
theme.menu_fg_normal = "#aaaaaa"
theme.menu_fg_focus = "#59e269"
theme.menu_bg_normal = "#050505dd"
theme.menu_bg_focus = "#050505dd"

-- Background
theme.bg_normal = "#1f2430"
theme.bg_dark = "#000000"
theme.bg_focus = "#151821"
theme.bg_urgent = "#ed8274"
theme.bg_minimize = "#444444"

-- Foreground
theme.fg_normal = "#ffffff"
theme.fg_focus = "#59e269"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

-- Window Gap Distance
theme.useless_gap = dpi(15)

-- Show Gaps if Only One Client is Visible
theme.gap_single_client = true

-- Window Borders
theme.border_width = dpi(2)
theme.border_normal = "#1c2022"
theme.border_focus = "#59e269"
theme.border_marked = "#3ca4d8"

-- Taglist
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_bg_occupied = "#ffffff1a"
theme.taglist_bg_urgent = "#e91e6399"
theme.taglist_bg_focus = theme.bg_focus

-- Tasklist
theme.tasklist_font = theme.font

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus = theme.bg_focus
theme.tasklist_bg_urgent = theme.bg_urgent

theme.tasklist_fg_focus = theme.fg_focus
theme.tasklist_fg_urgent = theme.fg_urgent
theme.tasklist_fg_normal = theme.fg_normal

-- Panel Sizing
theme.left_panel_width = dpi(55)
theme.top_panel_height = dpi(26)

-- Notification Sizing
-- theme.notification_max_width = dpi(350)

-- System Tray
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = dpi(5)

-- theme.tasklist_plain_task_name = false
-- theme.tasklist_disable_icon = false

theme.useless_gap = dpi(17)
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv "LANG") -- to localize the clock
local mytextclock = wibox.widget.textclock(markup("#a7aaff", "%A %d %B ") .. markup("#de6eae", "%H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal {
  attach_to = { mytextclock },
  notification_preset = {
    font = theme.font,
    fg = theme.fg_normal,
    bg = theme.bg_normal,
  },
}

-- CPU
local cpu = lain.widget.cpu {
  settings = function()
    widget:set_markup(markup.fontfg(theme.font, "#f36a6e", "CPU " .. cpu_now.usage .. "% "))
  end,
}

-- MEM
local memory = lain.widget.mem {
  settings = function()
    widget:set_markup(markup.fontfg(theme.font, "#e0da37", "RAM " .. mem_now.perc .. "% "))
  end,
}

-- Utils
local function lr_margin_box(widget, margin)
  if not margin then
    margin = 10
  end
  return wibox.widget {
    widget,
    left = dpi(margin),
    right = dpi(margin),
    widget = wibox.container.margin,
  }
end

local function margin_box(widget, margin)
  if not margin then
    margin = 2
  end
  return wibox.widget {
    widget,
    margins = dpi(margin),
    widget = wibox.container.margin,
  }
end

function theme.at_screen_connect(s)
  -- Quake application
  s.quake = lain.util.quake { app = awful.util.terminal }

  -- If wallpaper is a function, call it with the screen
  local wallpaper = theme.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Tags
  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

  -- Create the wibox
  s.mywibox = awful.wibar { position = "top", screen = s, height = dpi(22), bg = theme.bg_normal, fg = theme.fg_normal }

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mylayoutbox,
      lr_margin_box(s.mytaglist),
      lr_margin_box(s.mypromptbox, 5),
    },
    lr_margin_box(s.mytasklist, 5),
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      margin_box(wibox.widget.systray(), 2),
      lr_margin_box(require "awesome-wm-widgets.volume-widget.volume"(), 10),
      memory.widget,
      cpu.widget,
      mytextclock,
      require "awesome-wm-widgets.logout-menu-widget.logout-menu" {
        onlock = function()
          awful.spawn.with_shell "slock"
        end,
      },
    },
  }
end

return theme
