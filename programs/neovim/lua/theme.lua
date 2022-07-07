local g = vim.g --  global variables
local o = vim.o -- general settings
local cmd = vim.cmd


cmd 'colorscheme neodark'

o.background = 'dark'

g.neodark = { use_256color = 1, terminal_transparent = 1 }
