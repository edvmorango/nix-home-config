local capabilities = vim.tbl_extend(
  'keep',
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)


local on_attach = function(client, _)
  require('lsp-status').on_attach(client)
end

require('lspconfig').yamlls.setup {
  autostart = true,
  cmd = { "yaml-language-server", "--stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    yaml = {
      format = {
        enable = true
      }
    }
  }
}
