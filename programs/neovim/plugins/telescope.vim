lua << EOF


require('neoclip').setup()
require('harpoon').setup()
require('notify').setup()


require('nvim-web-devicons').setup {
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


-- require('telescope').load_extension('coc')
require('telescope').load_extension('hoogle')
require('telescope').load_extension('tele_tabby')
require("telescope").load_extension('harpoon')
require('telescope').load_extension('changes')
require('telescope').load_extension('command_palette')
require('telescope').load_extension('scaladex')
require('telescope').load_extension('notify')
require('telescope').load_extension('lsp_handlers')


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
    tele_tabby = {use_highlighter = true},
    lsp_handlers = {
		  code_action = {
				telescope = require('telescope.themes').get_dropdown({}),
			}
    }
  }
}


 
EOF

nnoremap <silent> <c-m> :lua require("harpoon.mark").add_file()<CR>


"Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>g  <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>qq <cmd>Telescope quickfix<cr>
"coc
"nnoremap <silent> <space>d  :<C-u>Telescope coc workspace_diagnostics<cr>
"nnoremap <silent> <space>c  :<C-u>Telescope coc commands<cr>
" nnoremap <silent> <space>s  :<C-u>Telescope coc document_symbols<cr>
" nnoremap <silent> <space>a  :<C-u>Telescope coc line_code_actions<cr>
" nnoremap <silent> <space>f  :<C-u>Telescope coc file_code_actions<cr>



"metals

nnoremap <silent> <space>c  :<C-u>lua require("telescope").extensions.metals.commands()<cr>

nnoremap <silent> <space>d  :<C-u>Telescope diagnostics<cr>
nnoremap <silent> <space>s  :<C-u>Telescope lsp_document_symbol<cr>
nnoremap <silent> <space>a  :<C-u>Telescope lsp_code_actions<cr>
"
nmap <silent> gd <cmd>Telescope lsp_definitions<cr>
nmap <silent> gy <cmd>Telescope lsp_type_definitions<cr>
nmap <silent> gi <cmd>Telescope lsp_implementations<cr>
nmap <silent> gr <cmd>Telescope lsp_references<cr>


"
"nnoremap <silent> <space>f  :<C-u>Telescope coc file_code_actions<cr>



"nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gds         <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
"nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>
"nnoremap <silent> <leader>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
"nnoremap <silent> <leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
"nnoremap <silent> <leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
"nnoremap <silent> <space>d    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
"nnoremap <silent> [c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
"nnoremap <silent> ]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>



nnoremap <silent> <space>h  :<C-u>Telescope hoogle<cr>


"nmap <silent> gd <cmd>Telescope coc definitions<cr>
"nmap <silent> gy <cmd>Telescope coc type_definitions<cr>
"map <silent> gi <cmd>Telescope coc implementations<cr>
"nmap <silent> gr <cmd>Telescope coc references<cr>

nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>

nmap <silent> z <cmd>Telescope neoclip a extra=star,plus,b<cr>
nmap <silent> q <cmd>Telescope harpoon marks<cr>
      

