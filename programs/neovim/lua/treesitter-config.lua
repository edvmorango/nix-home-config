local parsers_path = "/home/edvmorango/.treesitter/parsers"

vim.opt.runtimepath:append(parsers_path)


require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "rust", "scala", "lua", "purescript", "json", "regex", "vim", "bash", "nix", "yaml", "hcl" },

  -- aprsers
  parser_install_dir = parsers_path,

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript", "cc", "markdown" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --

    -- Lua parse is coming from nix neovim-9.1 and isn't updated, which causes the annoying error related to syntax, for
    -- now disable is the best alternative
    disable = { "lua", "c" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = false
  },
  indent = {
    enable = false
  }

}

require('hlargs').setup()




--vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
-- callback = function()
--    vim.opt.foldmethod = 'expr'
--   vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
-- end
--})
