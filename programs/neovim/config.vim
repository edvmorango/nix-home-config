
"lightline
call lightline#lsp#register()

let g:lightline = {
      \ 'colorscheme': 'neodark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'lspstatus', 'currentfunction', 'readonly', 'gitbranch' ,'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'lspstatus': 'lightline#lsp#status'
      \ },
      \ }

let g:airline_powerline_fonts=1


command! ProjectFiles execute 'Files' s:find_git_root()'

" To use a custom highlight for the popup window, change Pmenu to your highlight group
highlight link EchoDocPopup Pmenu 

"easy align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
let g:which_key_vertical=1

"fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

"
"nnoremap <silent> <C-p> :FZF  --keep-right --preview-window=up <CR>
"autocmd! FileType fzf tnoremap <buffer> <C-p> <c-c>


let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 1, 'xoffset' : 1.0 } }

"dev-icons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
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

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

let NERDTreeIgnore = ['^.git$[[dir]]', '^.target$[[dir]]']
"autocmd BufEnter * lcd %:p:h
set autochdir "change directory to file
let g:NERDTreeChDirMode = 2


function ToggleCWD()
  exec ':NERDTreeToggle' getcwd()
endfunction


map <C-F> :call ToggleCWD()  <CR>
map <C-S> :NERDTreeFind<CR>

"Disable the annoying and useless ex-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

"cabal-fmt
let g:cabalfmt_options=["--indent 2"]
autocmd BufWritePre *.cabal :call RunCabal()

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


"vim-rooter
"let g:rooter_patterns = ['.vimdir', '.vimsubdir']
let g:rooter_manual_only = 1

function RooterRoot()
  exec ":call CustomRooter(['.vimdir'])" 
endfunction

function RooterSub()
  exec ":call CustomRooter(['.vimsubdir'])"
endfunction


nnoremap <leader>rr  :call RooterRoot() <CR> 
nnoremap <leader>rs  :call RooterSub() <CR> 

"notify

"vim-maximizer
let g:maximizer_set_default_mapping = 1

"pgsql-vim
let g:sql_type_default = 'pgsql'

"Custom maps
"

let g:coq_settings  = { 'xdg' : v:true, 'auto_start' : v:true}


