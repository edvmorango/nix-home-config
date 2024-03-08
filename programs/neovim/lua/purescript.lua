vim.filetype.add({ extension = { purs = 'purescript' }})

local lspconfig = require('lspconfig')


lspconfig.purescriptls.setup {
 -- " Your personal on_attach function referenced before to include
 -- " keymaps & other ls options
  settings = {
    purescript = {
      addSpagoSources = true -- e.g. any purescript language-server config here
    }
  },
  flags = {
    debounce_text_changes = 150,
  }
}
