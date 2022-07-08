local coq = require('coq')


local on_attach = function(_, _) end

require('lspconfig').rnix.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
