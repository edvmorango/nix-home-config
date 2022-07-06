local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

g.filetype = true
g.on = true
g.syntax_on = true


--true colors
g.termguicolors = true

opt.number = true
opt.wrap = false
opt.showmode = true
opt.tw = 80
opt.smartcase = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.incsearch = true
opt.mouse = 'a'
opt.history = 1000
--opt.whichwrap = opt.whichwrap ^ { '<', '>', 'h', 'l', '[', ']' }
opt.linebreak = true
opt.textwidth = 120
opt.tabstop = 2
opt.clipboard = opt.clipboard ^ { 'unnamedplus' } --copy paste
opt.laststatus = 2
opt.viewoptions = { 'folds', 'options', 'cursor', 'unix', 'slash' } --UNIX better support
opt.encoding = 'utf-8'
opt.cmdheight = 2 -- "for echodoc
opt.mouse = 'nicr' -- "disable mouse
