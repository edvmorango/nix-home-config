local wezterm = require('wezterm')
local act = wezterm.action

return {
  window_decorations = "TITLE | RESIZE",
  front_end = 'WebGpu',
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

  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = '\\((\\w+://\\S+)\\)',
      format = '$1',
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = '\\[(\\w+://\\S+)\\]',
      format = '$1',
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = '\\{(\\w+://\\S+)\\}',
      format = '$1',
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = '<(\\w+://\\S+)>',
      format = '$1',
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      format = '$0',
    },
    -- implicit mailto link
    {
      regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
      format = 'mailto:$0',
    },
    {
      regex = [[\b([\w.-]+)@([\w.-]+):([\w./-]+)\b]],
      format = "https://$2/$3",
    }
  },

  mouse_bindings = {
    -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks, and that it populates
    -- the Clipboard rather the PrimarySelection which is part
    -- of the default assignment for a left mouse click.
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.CompleteSelection 'Clipboard',
    },
    {
      event = { Up = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = act.PasteFrom 'Clipboard',
    },
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.Nop,
    },
  },
  term = "wezterm"
}
