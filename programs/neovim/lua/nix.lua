-- local capabilities = require('coq').lsp_ensure_capabilities({ on_attach = function(_,_) end })
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())


local on_attach = function(_, _)
  require('lsp_signature').on_attach()
  require('lsp-status').on_attach()
end






require('lspconfig').rnix.setup { capabilities = capabilities, on_attach = on_attach }
