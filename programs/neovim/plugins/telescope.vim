lua << EOF


require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require('telescope').load_extension('coc')
require('telescope').load_extension('hoogle')
require('telescope').load_extension('tele_tabby')

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
    layout_config = {
      horizontal = {width = 0.9}
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    tele_tabby = {
      use_highlighter = true,
    }  
  }
}
 
EOF


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>qq <cmd>Telescope quickfix<cr>
"coc
nnoremap <silent> <space>d  :<C-u>Telescope coc workspace_diagnostics<cr>
nnoremap <silent> <space>c  :<C-u>Telescope coc commands<cr>
nnoremap <silent> <space>s  :<C-u>Telescope coc document_symbols<cr>
nnoremap <silent> <space>a  :<C-u>Telescope coc line_code_actions<cr>

nmap <silent> gd <cmd>Telescope coc definitions<cr>
nmap <silent> gy <cmd>Telescope coc type_definitions<cr>
nmap <silent> gi <cmd>Telescope coc implementation<cr>
nmap <silent> gr <cmd>Telescope coc references<cr>

nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>

