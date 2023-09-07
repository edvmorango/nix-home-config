require('keys')

local g = vim.g
local cmd = vim.cmd
local exec = vim.api.nvim_exec

--autosave
g.auto_save = true

-- vim-rooter
g.rooter_manual_only = true

-- echodoc
g.echodoc = { enable_at_startup = true, type = 'virtual' }

-- highlight link EchoDocPopup Pmenu



-- identline (make a function to enable/disable)
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  space_char_blankline = " ",

}



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


--vim-which-key
require("whichkey_setup").config {
  hide_statusline = false,
  default_keymap_settings = {
    silent = true,
    noremap = true,
  },
  default_mode = 'n',
}

g.timeoutlen = 500
g.which_key_vertical = 1


-- lsp
require("inc_rename").setup()

Map("n", "<leader>r", ':IncRename ') -- the space is relevant


-- tidy (remove trailing spaces)
require("tidy").setup({
  filetype_exclude = {},
})

-- twilight (dims inactive portions of code)
require("twilight").setup {}

Map('n', 't', '<cmd>Twilight<CR>')

--vim-subversive

Map('n', '<leader>s', '<plug>(SubversiveSubvertRange)')
Map('x', '<leader>s', '<plug>(SubversiveSubvertRange)')

Map('n', '<leader>ss', '<plug>(SubversiveSubvertWordRange)')


Map('n', '<space>z', '<cmd>UndotreeToggle<CR>', { silent = true })



g.subversivePromptWithActualCommand = 0

--rooter

require('nvim-rooter').setup({
  rooter_patterns = { '.git', '.vimdir' },
  trigger_patterns = { '*' },
  manual = true,
  fallback_to_parent = false,
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
