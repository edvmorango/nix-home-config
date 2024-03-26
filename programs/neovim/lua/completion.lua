local g = vim.g

-- Disabled until further fix
g.coq_settings = { xdg = true, auto_start = false }


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end



luasnip = require('luasnip.loaders.from_vscode').lazy_load {
  paths = '/home/edvmorango/.config/nixpkgs/programs/neovim/snippets'
}


local cmp = require('cmp')
local ls = require('luasnip')
local lspkind = require('lspkind')




local kind_icons = {
  Text = "",
  Method = "µ",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}



vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()

if ls.choice_active() then
  ls.change_choice(1)
end
end, {silent = true})

require('cmp').setup {
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)

      local max_width = 85

      vim_item.kind =  string.format('%s', kind_icons[vim_item.kind])
      vim_item.menu = ""
      vim_item.abbr = string.sub(vim_item.abbr,1, max_width)
      return vim_item
    end,
  },
  window = {
    border = { '', '', '', '', '', '', '', '' },
    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
    winblend = vim.o.pumblend,
    scrolloff = 0,
    col_offset = 0,
    side_padding = 1,
    scrollbar = true,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip',  option = { show_autosnippets = true } }
    },
    {
      { name = 'buffer' },
    }
  )
}
