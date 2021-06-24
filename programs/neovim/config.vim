filetype on

"syntax
syntax on

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set whichwrap+=<,>,h,l,[,]
set linebreak
set textwidth=120
set expandtab "Tab to space
set tabstop=2 "Number of spaces per tab
set clipboard+=unnamedplus "copy paste 
set laststatus=2
set viewoptions=folds,options,cursor,unix,slash "UNIX better support
set encoding=utf-8
set cmdheight=2 "for echodoc
set mouse=nicr "disable mouse

"mouse
set mouse=nicr
inoremap <ScrollWheelUp> <nop>
inoremap <S-ScrollWheelUp> <nop>
inoremap <C-ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
inoremap <S-ScrollWheelDown> <nop>
inoremap <C-ScrollWheelDown> <nop>
inoremap <ScrollWheelLeft> <nop>
inoremap <S-ScrollWheelLeft> <nop>
inoremap <C-ScrollWheelLeft> <nop>
inoremap <ScrollWheelRight> <nop>
inoremap <S-ScrollWheelRight> <nop>
inoremap <C-ScrollWheelRight> <nop>

"truecolors
set termguicolors

"disable arrow keys
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
"inoremap <Up> <nop>
"inoremap <Down> <nop>
"inoremap <Left> <nop>
"inoremap <Right> <nop>
"vnoremap <Up> <nop>
"vnoremap <Down> <nop>
"vnoremap <Left> <nop>
"vnoremap <Right> <nop>
"noremap <PageUp> <nop>
"inoremap <PageUp> <nop>
"vnoremap <PageUp> <nop>
"noremap <PageDown> <nop>
"inoremap <PageDown> <nop>
"vnoremap <PageDown> <nop>

"window
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Moving
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
nnoremap <M-x> <C-w>x

" Center after jump
function! CenteredFindNext(forward)
    " save the current value for later restore
    let s:so_curr=&scrolloff
    set scrolloff=999
    try
        if a:forward
            silent normal! n
        else
            silent normal! N
        endif
    finally
        " restore no matter what
        let &scrolloff=s:so_curr
    endtry
endfunction

:nnoremap <silent>n :call CenteredFindNext(1)<CR>
:nnoremap <silent>N :call CenteredFindNext(0)<CR>

"thme
syntax enable
"colorscheme tender
"colorscheme darcula
colorscheme deus
set background=dark
let g:deus_termcolors=256

"floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<C-w>'
let g:floaterm_keymap_next   = '<C-e>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
nnoremap <silent> <C-k> :FloatermToggle<CR>
tnoremap <silent> <C-k>   <C-\><C-n>:FloatermToggle<CR>
"lightline

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'darculaOriginal',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'gitbranch' ,'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

let g:airline_powerline_fonts=1

"rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"enable AutoSave on Vim startup
let g:auto_save = 1  
"echodoc 
let g:echodoc#enable_at_startup=1 "shows showSignatureHelp trigerred by ( or [
let g:echodoc#type = 'virtual'

" To use a custom highlight for the popup window, change Pmenu to your highlight group
highlight link EchoDocPopup Pmenu 

"hardtime
"let g:hardtime_default_on = 0

"gitgutter
set updatetime=100

"vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
let g:which_key_vertical=1
"fzf
nnoremap <silent> <C-p> :FZF  --keep-right --preview-window=up <CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 1, 'xoffset' : 1.0 } }
"Nerdtree
"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
   \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 0
let NERDTreeShowHidden=1

"autocmd BufEnter * lcd %:p:h
map <C-F> :NERDTreeToggle<CR>
map <C-S> :NERDTreeFind<CR>

"Disable the annoying and useless ex-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>


"subversive
nmap <leader>s <plug>(SubversiveSubvertRange)
xmap <leader>s <plug>(SubversiveSubvertRange)

nmap <leader>ss <plug>(SubversiveSubvertWordRange)
let g:subversivePromptWithActualCommand = 0
" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>
" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>

"Search
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
"set nowrapscan " Don't go back to first match after the last match is found.


"Vista
let g:vista_icon_indent = ["=>", "|->"]

let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 70
let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

nnoremap <silent> <C-l> :Vista!! <CR>

"pgsql-vim
let g:sql_type_default = 'pgsql'

"Custom maps

nnoremap <space>d :noh <CR>
