lua << EOF


-- local metals_config = require('metals').bare_config()

local lspconfig = require('lspconfig')
local coc = require('coq')

local capabilities = coq.lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr) 



end


require('lspconfig').rnix.setup(coq.lsp_ensure_capabilities({on_attach = on_attach}))

EOF
