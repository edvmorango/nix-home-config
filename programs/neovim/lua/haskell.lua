local g = vim.g


local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.hls.setup {
  filetypes = { "haskell", "lhaskell", "cabal" },
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  settings = {
    haskell = {
      cabalFormattingProvider = "cabalfmt",
      formattingProvider = "fourmolu"
    }

  },
  capabilities = capabilities,
}



local augroup = vim.api.nvim_create_augroup('haskell_ag', { clear = true })

g.cabalfmt_options = { '--indent 2' }
g.ormolu_options = { '-o -XTypeApplications' }

vim.api.nvim_create_autocmd('BufWritePre',
  {
    pattern = '*.cabal',
    group = augroup,
    command = ':call RunCabal()'
  }
)
