---@diagnostic disable: inject-field
require('keys')

local g = vim.g -- a table to access global variables

local o = vim.o

g.filetype = true
g.on = true
g.syntax_on = true



o.autochdir = true

--true colors
o.termguicolors = true

o.shortmess = 'F' -- o.shortmess:gsub('F', '') .. 'c'
o.completeopt = 'menuone,noinsert,noselect'

o.ignorecase = true
o.smartcase = true

vim.wo.number = true


o.wrap = false
o.showmode = true
o.smartindent = true
o.autoindent = true
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.incsearch = true
o.mouse = 'a'
o.history = 1000
o.whichwrap = o.whichwrap .. '<,>,h,l,[,]'
vim.wo.linebreak = true
o.textwidth = 120
o.tabstop = 2
o.clipboard = o.clipboard .. 'unnamedplus'        --copy paste
o.laststatus = 2
o.viewoptions = 'folds,options,cursor,unix,slash' --UNIX better support
o.encoding = 'utf-8'
o.cmdheight = 2                                   -- "for echodoc

Map('i', '<C-d>', '<Esc>')
Map('n', '<C-d>', '<Esc>')
Map('v', '<C-d>', '<Esc>')
Map('s', '<C-d>', '<Esc>')
Map('x', '<C-d>', '<Esc>')
Map('o', '<C-d>', '<Esc>')
Map('!', '<C-d>', '<Esc>')
Map('l', '<C-d>', '<Esc>')
Map('c', '<C-d>', '<Esc>')
Map('t', '<C-d>', '<Esc>')
Map('', '<C-d>', '<Esc>')
