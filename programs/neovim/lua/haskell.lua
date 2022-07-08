local g = vim.g


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


--autocmd BufWritePre *.cabal :call RunCabal()
