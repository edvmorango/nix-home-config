require('keys')

local g = vim.g
local cmd = vim.cmd

--autosave
g.auto_save = true
g.auto_save_silent = true
-- vim-rooter
g.rooter_manual_only = true

-- echodoc
g.echodoc = { enable_at_startup = true, type = 'virtual' }

-- highlight link EchoDocPopup Pmenu

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
  "CursorColumn",
  "Whitespace"
}


local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- identline (make a function to enable/disable)
require("ibl").setup {
  indent = {
    highlight = highlight,
    char = '╎'
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { enabled = false },
  -- for example, context is off by default, use this to turn it on
  --show_current_context = true,
  --show_current_context_start = true,
  --show_end_of_line = true,
  --space_char_blankline = " ",

}

Map('n', 't', '<cmd>IBLToggle<CR>')

function ToggleIndentBlankline()
  if (g.indent_blankline_enabled) then
    g.indent_blankline_enabled = false
  else
    g.indent_blankline_enabled = true
  end
end

-- gitgutter
vim.o.updatetime = 100

-- motion
--
require("spider").setup({
  skipInsignificantPunctuation = true
})

vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })


--mouse

Map('i', '<ScrollWheelUp>', '<nop>')
Map('i', '<S-ScrollWheelUp>', '<nop>')
Map('i', '<C-ScrollWheelUp>', '<nop>')
Map('i', '<ScrollWheelDown>', '<nop>')
Map('i', '<S-ScrollWheelDown>', '<nop>')
Map('i', '<C-ScrollWheelDown>', '<nop>')
Map('i', '<ScrollWheelLeft>', '<nop>')
Map('i', '<S-ScrollWheelLeft>', '<nop>')
Map('i', '<C-ScrollWheelLeft>', '<nop>')
Map('i', '<ScrollWheelRight>', '<nop>')
Map('i', '<S-ScrollWheelRight>', '<nop>')
Map('i', '<C-ScrollWheelRight>', '<nop>')

-- ex-mode
Map('n', 'Q', '<nop>')
Map('n', 'gQ', '<nop>')



-- window
Map('n', '<M-h>', '<C-w>h')
Map('n', '<M-j>', '<C-w>j')
Map('n', '<M-k>', '<C-w>k')
Map('n', '<M-l>', '<C-w>l')

-- Moving
Map('n', '<M-H>', '<C-w>H')
Map('n', '<M-J>', '<C-w>J')
Map('n', '<M-K>', '<C-w>K')
Map('n', '<M-L>', '<C-w>L')
Map('n', '<M-x>', '<C-w>x')

-- float term
g.floaterm_keyMap_new  = '<F7>'
g.floaterm_keyMap_prev = '<C-w>'
g.floaterm_keyMap_next = '<C-e>'
g.floaterm_width       = 0.9
g.floaterm_height      = 0.9


Map('n', '<C-k>', '<cmd>FloatermToggle<CR>')
Map('t', '<C-k>', '<C-\\><C-n><cmd>FloatermToggle<CR>')



-- apparently normal! have dependencies, so isn't a good idea call the function directly from lua
-- so I'm quoting
function CenterCursorOnNext(forward)
  if forward
  then
    cmd 'silent! normal! n'
    cmd 'silent! normal! zz'
  else
    cmd 'silent! normal! N'
    cmd 'silent! normal! zz'
  end
end

Map('n', 'n', '<cmd>lua CenterCursorOnNext(true)<CR>', { silent = true })
Map('n', 'N', '<cmd>lua CenterCursorOnNext(false)<CR>', { silent = true })



g.timeoutlen = 500


-- lsp
require("inc_rename").setup()

Map("n", "<leader>r", ':IncRename ') -- the space is relevant



-- tidy (remove trailing spaces)
require("tidy").setup({
  filetype_exclude = {},
})



--vim-subversive

Map('n', '<leader>s', '<plug>(SubversiveSubvertRange)')
Map('x', '<leader>s', '<plug>(SubversiveSubvertRange)')

Map('n', '<leader>ss', '<plug>(SubversiveSubvertWordRange)')


-- undo
require('yankbank').setup({
  max_entries = 12,
  sep = "",
})

Map('n', 'z', '<cmd>YankBank<CR>', { silent = true })

-- fidget
require("fidget").setup()


-- ctx
require('nvim_context_vt').setup()
Map('n', '<C-t>', ':NvimContextVtToggle<CR>', { silent = true })

-- subversive
g.subversivePromptWithActualCommand = 0

--rooter

require('nvim-rooter').setup({
  rooter_patterns = { '.git', '.vimdir' },
  trigger_patterns = { '*' },
  manual = true,
  fallback_to_parent = false,
})

---
require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    scala = { "scalafmt" },
    rust = { "rustfmt" },
    json = { "jq" },
    nix = { "alejandra" },
    lua = { "stylua" },
    haskell = {

      command = "fourmolu",
      append_args = { "--mode inplace (git ls-files '*.hs')" }


    }
  },
})


-- status
local lspstatus = require('lsp-status')

lspstatus.config { status_symbol = 'LSP' }

lspstatus.register_progress()

-- scrollbar
local scrollbarInit = vim.api.nvim_create_augroup("ScrollbarInit", {})

require("autoclose").setup({})


vim.api.nvim_create_autocmd({ 'WinScrolled', 'VimResized', 'QuitPre' },
  {
    group = scrollbarInit,
    command = "silent! lua require('scrollbar').show()"
  }
)

vim.api.nvim_create_autocmd({ 'WinEnter', 'FocusGained' },
  {
    group = scrollbarInit,
    command = "silent! lua require('scrollbar').show()"
  }
)

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave', 'BufWinLeave', 'FocusLost' },
  {
    group = scrollbarInit,
    command = "silent! lua require('scrollbar').clear()"
  }
)


-- undo highligted
require('highlight-undo').setup({
  duration = 300,
  keymaps = {
    Keymap_name = {
      -- most fields here are the same as in vim.keymap.set
      desc = "a description",
      hlgroup = 'HighlightUndo',
      mode = 'n',
      lhs = 'lhs',
      rhs = 'optional, can be nil',
      opts = {
        -- same as opts to vim.keymap.set. if rhs is nil, there should be a
        -- callback key which points to a function
      },
    },
  },
})


-- illuminate tokens
require('illuminate').configure({
  -- providers: provider used to get references in the buffer, ordered by priority
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  -- delay: delay in milliseconds
  delay = 100,
  -- filetype_overrides: filetype specific overrides.
  -- The keys are strings to represent the filetype while the values are tables that
  -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
  filetype_overrides = {},
  -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    'dirbuf',
    'dirvish',
    'fugitive',
  },
  -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
  -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
  filetypes_allowlist = {},
  -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
  -- See `:help mode()` for possible values
  modes_denylist = {},
  -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
  -- See `:help mode()` for possible values
  modes_allowlist = {},
  -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_denylist = {},
  -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_allowlist = {},
  -- under_cursor: whether or not to illuminate under the cursor
  under_cursor = true,
  -- large_file_cutoff: number of lines at which to use large_file_config
  -- The `under_cursor` option is disabled when this cutoff is hit
  large_file_cutoff = nil,
  -- large_file_config: config to use for large files (based on large_file_cutoff).
  -- Supports the same keys passed to .configure
  -- If nil, vim-illuminate will be disabled for large files.
  large_file_overrides = nil,
  -- min_count_to_highlight: minimum number of matches required to perform highlighting
  min_count_to_highlight = 1,
  -- should_enable: a callback that overrides all other settings to
  -- enable/disable illumination. This will be called a lot so don't do
  -- anything expensive in it.
  should_enable = function(bufnr) return true end,
  -- case_insensitive_regex: sets regex case sensitivity
  case_insensitive_regex = false,
})
