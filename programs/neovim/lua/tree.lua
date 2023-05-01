require('keys')


vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})




require('nvim-tree').setup {
  open_on_setup = true,
  open_on_setup_file = false,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400
  },
  filesystem_watchers = {
    enable = true,
    --interval = 100,
    debounce_delay = 50
  },
  view = {
    adaptive_size = false,
    --height = 30,
    width = 30,
    --side = 'left',
    signcolumn = 'yes',
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' }
      }
    }
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      show = { folder_arrow = true, git = true },
    },
    special_files = { "README.md", "readme.md", '.envrc', 'flake.nix' },
  },
  filters = {
    dotfiles = false,
    custom = { '^\\.git' },
    exclude = { '.envrc' }
  },
  actions = {
    change_dir = {
      enable = true
    },
    expand_all = {
      exclude = { ".git", "target", ".bsp" }
    },
    open_file = {
      quit_on_open = true
    },
    remove_file = {
      close_window = true
    },
    use_system_clipboard = true
  }
}


local exec = vim.api.nvim_exec


function NvimTreeToggleRoot()
  -- Mapf('n', '<leader>rr', function() exec(':call CustomRooter([".vimdir"])', '<CR>') end)

  exec(':call CustomRooter([".vimdir"])', '<CR>')
  exec(':NvimTreeToggle', '<CR>')

end

Mapf('n', '<C-F>', "<cmd>lua NvimTreeToggleRoot()<CR>")

Map('n', '<leader>ff', '<cmd>NvimTreeToggle<CR>', { silent = true })
