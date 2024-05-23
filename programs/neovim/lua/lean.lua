local lean = require('lean')

lean.setup {
  lsp = { on_attach = on_attach },
  mappings = true,
}
