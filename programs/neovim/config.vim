
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





"cabal-fmt
let g:cabalfmt_options=["--indent 2"]
autocmd BufWritePre *.cabal :call RunCabal()


let g:coq_settings  = { 'xdg' : v:true, 'auto_start' : v:true}


