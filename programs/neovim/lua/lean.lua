local on_attach = function(client, bufnr)
  print("herea?")
  require('lsp-status').on_attach(client)
end



require('lean')
    .setup {
      abbreviations = { builtin = true },
      lsp = {
        enable = true,
        on_attach = on_attach },
      mappings = false,
    }

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = { spacing = 4 },
    update_in_insert = true,
  }
)
