local settings = {
  themes = {
    "powerarrow-dark",     -- 1 DEFAULT
    "vertex",              -- 2
  },

  chosen_theme = 2,

  modkey = "Mod4",
  altkey = "Mod1",

  -- Pref browser
  terminal = "alacritty",

  vi_focus = false,    -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
  cycle_prev = true,   -- cycle with only the previously focused client or all https://github.com/lcpz/awesome-copycats/issues/274

  -- Pref editor
  editor = "nvim",

  -- Pref browser
  browser = "librewolf",

  -- Bluetooth
  BLUESTATUS = false,

  -- Gaps
  useless_gap = 8,
}

return settings
