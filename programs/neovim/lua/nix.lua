-- local capabilities = require('coq').lsp_ensure_capabilities({ on_attach = function(_,_) end })
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())


require('lspconfig').rnix.setup { capabilities = capabilities }
