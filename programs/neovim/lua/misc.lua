require('keys')

local g = vim.g
local fn = vim.fn

--autosave
g.auto_save = true

-- vim-rooter
g.rooter_manual_only = true

-- echodoc
g.echodoc = { enable_at_startup = true, type = 'virtual' }


-- identline (make a function to enable/disable)
g.indentLine_setColors = false

-- gitgutter
g.updatetime = 100

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
