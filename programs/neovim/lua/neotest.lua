require('neotest').setup({
  adapters = {
    require('neotest-scala')({
      -- Command line arguments for runner
      -- Can also be a function to return dynamic values
      args = { '--no-color' },
      -- Runner to use. Will use bloop by default.
      -- Can be a function to return dynamic value.
      -- For backwards compatibility, it also tries to read the vim-test scala config.
      -- Possibly values bloop|sbt.
      runner = 'bloop',
      -- Test framework to use. Will use utest by default.
      -- Can be a function to return dynamic value.
      -- Possibly values utest|munit|scalatest.
      framework = 'munit',
    })
  }
})
