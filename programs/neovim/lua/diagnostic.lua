--require("lsp_lines").setup()
--
--
require("eagle").setup({
  -- override the default values found in config.lua
})

require('diagflow').setup({
  enable = true,
  max_width = 100,    -- The maximum width of the diagnostic messages
  max_height = 30,    -- the maximum height per diagnostics
  severity_colors = { -- The highlight groups to use for each diagnostic severity level
    error = "DiagnosticFloatingError",
    warning = "DiagnosticFloatingWarn",
    info = "DiagnosticFloatingInfo",
    hint = "DiagnosticFloatingHint",
  },
  format = function(diagnostic)
    return diagnostic.message
  end,
  gap_size = 1,
  scope = 'line', -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
  padding_top = 3,
  padding_right = 5,
  text_align = 'right',                                  -- 'left', 'right'
  placement = 'top',                                     -- 'top', 'inline'
  inline_padding_left = 0,                               -- the padding left when the placement is inline
  update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
  toggle_event = {},                                     -- if InsertEnter, can toggle the diagnostics on inserts
  show_sign = true,                                      -- set to true if you want to render the diagnostic sign before the diagnostic message
  render_event = { 'DiagnosticChanged', 'CursorMoved' },
  border_chars = {
    top_left = "┌",
    top_right = "┐",
    bottom_left = "└",
    bottom_right = "┘",
    horizontal = "─",
    vertical = "│"
  },
  show_borders = false,
})


vim.o.mousemoveevent = true
