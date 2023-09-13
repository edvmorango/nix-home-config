local wezterm = require('wezterm')
local act = wezterm.action

return {
  font_dirs = { '$HOME/.local/share/fonts' },
  font = wezterm.font {
    family = 'FiraCode Nerd Font',
    stretch = 'Normal',
    weight = 'Regular',
  },
  keys = {
    -- This will create a new split and run the `top` program inside it
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    }
  },
  warn_about_missing_glyphs = false,

  mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks, and that it populates
    -- the Clipboard rather the PrimarySelection which is part
    -- of the default assignment for a left mouse click.
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = wezterm.action.CompleteSelection 'Clipboard',
    },
  },
  term = "wezterm"
}
