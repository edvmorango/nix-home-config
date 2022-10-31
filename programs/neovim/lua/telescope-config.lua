require('keys')

local exec = vim.api.nvim_exec


require('neoclip').setup()
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


require('telescope').load_extension('hoogle')
require('telescope').load_extension('tele_tabby')
require('telescope').load_extension('changes')
require('telescope').load_extension('command_palette')
require('telescope').load_extension('scaladex')
require('telescope').load_extension('notify')
require('telescope').load_extension('lsp_handlers')






local resolve = require("telescope.config.resolve")


TelescopeLayoutConfig = {
  horizontal = { width = 0.9 },
  width = resolve.resolve_width(0.9),
  height = resolve.resolve_height(0.99),
  preview_height = resolve.resolve_height(0.75),
  prompt_position = "bottom"
}


require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
    layout_strategy = "vertical",
    layout_config = TelescopeLayoutConfig },
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
    tele_tabby = { use_highlighter = true },
    lsp_handlers = {
      code_action = {
        telescope = require('telescope.themes').get_dropdown({}),
      }
    }
  }
}




--Find files using Telescope command-line sugar.
Map('n', '<leader>g', '<cmd>Telescope live_grep<CR>', { silent = true })
Map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true })
Map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { silent = true })
Map('n', '<leader>qq', '<cmd>Telescope quickfix<CR>', { silent = true })

-- Metals


Map('n', '<space>c', '<cmd>lua require("telescope").extensions.metals.commands(TelescopeLayoutConfig)<CR>', { silent = true })

-- nnoremap <silent> <space>c  :<C-u>lua require("telescope").extensions.metals.commands()<cr>


Map('n', '<space>d', '<cmd>Telescope diagnostics<CR>', { silent = true })
Map('n', '<space>s', '<cmd>MetalsSuperMethodHierarchy<CR>', { silent = true })
Map('n', '<space>a', '<cmd>Telescope lsp_code_actions<CR>', { silent = true })


-- nnoremap <silent> <space>d  :<C-u>Telescope diagnostics<cr>
-- nnoremap <silent> <space>s  :<C-u>Telescope lsp_document_symbol<cr>
-- nnoremap <silent> <space>a  :<C-u>Telescope lsp_code_actions<cr>

--nmap <silent> gd <cmd>Telescope lsp_definitions<cr>
--nmap <silent> gy <cmd>Telescope lsp_type_definitions<cr>
--nmap <silent> gi <cmd>Telescope lsp_implementations<cr>
--nmap <silent> gr <cmd>Telescope lsp_references<cr>


Map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { silent = true })
Map('n', 'gy', '<cmd>Telescope lsp_type_definitions<CR>', { silent = true })
Map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { silent = true })
Map('n', 'gr', '<cmd>Telescope lsp_references<CR>', { silent = true })


-- nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
-- nnoremap <silent> gds         <cmd>lua vim.lsp.buf.document_symbol()<CR>
-- nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


Map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
Map('n', 'gds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { silent = true })
Map('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { silent = true })

-- nnoremap <silent> <space>h  :<C-u>Telescope hoogle<cr>

Map('n', '<C-p>', '<cmd>Telescope find_files<CR>', { silent = true })
Map('n', 'z', '<cmd>Telescope neoclip a extra=star,plus,b<CR>', { silent = true })



-- nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
-- nmap <silent> z <cmd>Telescope neoclip a extra=star,plus,b<cr>
--

function RootFiles()
  -- Mapf('n', '<leader>rr', function() exec(':call CustomRooter([".vimdir"])', '<CR>') end)

  exec(':call CustomRooter([".vimdir"])', '<CR>')
  exec(':Telescope find_files', '<CR>')

end

function RootGrep()
  -- Mapf('n', '<leader>rr', function() exec(':call CustomRooter([".vimdir"])', '<CR>') end)

  exec(':call CustomRooter([".vimdir"])', '<CR>')
  exec(':Telescope live_grep', '<CR>')

end

Map('n', '<A-p>', '<cmd>lua RootFiles()<CR>', { silent = true })
Map('n', '<A-g>', '<cmd>lua RootGrep()<CR>', { silent = true })
