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
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}


--require('telescope').load_extension('hoogle')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('scaladex')
require('telescope').load_extension('notify')
require('telescope').load_extension('lsp_handlers')
require('telescope').load_extension("undo")

local resolve = require("telescope.config.resolve")


TelescopeLayoutConfigVertical = {
  horizontal = { width = 0.9 },
  width = resolve.resolve_width(0.9),
  height = resolve.resolve_height(0.99),
  preview_height = resolve.resolve_height(0.75),
  prompt_position = "bottom"
}


TelescopeLayoutConfigHorizontal = {
  vertical = { width = 0.9 },
  width = resolve.resolve_width(0.9),
  height = resolve.resolve_height(0.99),
  preview_width = resolve.resolve_width(0.65)
}


require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
    layout_strategy = "horizontal",
    layout_config = TelescopeLayoutConfigHorizontal,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--fixed-strings"
    },
    path_display = { "smart" }
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
Map('n', '<leader>p', '<cmd>Telescope find_files<CR>', { silent = true })
Map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { silent = true })
Map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { silent = true })
Map('n', '<leader>qq', '<cmd>Telescope quickfix<CR>', { silent = true })

-- Metals

Map('n', '<space>c', '<cmd>lua Call_server_ui()<CR>',
  { silent = true })

function Call_server_ui()
  local current_file = vim.bo.filetype

  if (current_file == "scala" or current_file == "sbt") then
    require("telescope").extensions.metals.commands(TelescopeLayoutConfigVertical)
  end
end

-- nnoremap <silent> <space>c  :<C-u>lua require("telescope").extensions.metals.commands()<cr>


--Map('n', '<space>d', '<cmd>Telescope diagnostics<CR>', { silent = true })
Map('n', '<space>s', '<cmd>MetalsSuperMethodHierarchy<CR>', { silent = true })
Map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true })
-- Map('n', '<space>z', '<cmd>Telescope undo<CR>', { silent = true })



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
Map('n', '<C-l>', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { silent = true })



-- nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
-- nnoremap <silent> gds         <cmd>lua vim.lsp.buf.document_symbol()<CR>
-- nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


Map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
Map('n', 'gds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { silent = true })
Map('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { silent = true })

-- nnoremap <silent> <space>h  :<C-u>Telescope hoogle<cr>

Map('n', 'z', '<cmd>Telescope neoclip a extra=star,plus,b<CR>', { silent = true })



-- nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
-- nmap <silent> z <cmd>Telescope neoclip a extra=star,plus,b<cr>
--

function RootFiles()
  exec(':Rooter', '<CR>')
  exec(':Telescope find_files', '<CR>')
end

function RootGrep()
  exec(':Rooter', '<CR>')
  exec(':Telescope live_grep', '<CR>')
end

Map('n', '<C-p>', '<cmd>lua RootFiles()<CR>', { silent = true })
Map('n', '<C-g>', '<cmd>lua RootGrep()<CR>', { silent = true })
