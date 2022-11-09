local wezterm = require 'wezterm'
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
      key = ']',
      mods = 'CTRL|SHIFT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    }
  },
}
