-- local capabilities = require('coq').lsp_ensure_capabilities({ on_attach = function(_,_) end })
--local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local capabilities = vim.tbl_extend(
  'keep',
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)


local on_attach = function(client, _)
  require('lsp-status').on_attach(client)
end

require('lspconfig').nil_ls.setup {
  autostart = true,
  cmd = { "nil" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['nil'] = {
      testSetting = 42,
      formatting = {
        command = { "alejandra" },
      },
    },
  },
}
