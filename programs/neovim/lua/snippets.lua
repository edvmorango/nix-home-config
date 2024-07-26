require("scissors").setup {
  snippetDir = "/home/edvmorango/.config/nixpkgs/programs/neovim/snippets",
  editSnippetPopup = {
    height = 0.8, -- relative to the window, number between 0 and 1
    width = 0.8,
    border = "rounded",
    keymaps = {
      cancel = "q",
      saveChanges = "<CR>", -- alternatively, can also use `:w`
      goBackToSearch = "<BS>",
      deleteSnippet = "<C-BS>",
      duplicateSnippet = "<C-d>",
      openInFile = "<C-o>",
      insertNextPlaceholder = "<C-t>", -- insert & normal mode
    },
  },
  telescope = {
    -- By default, the query only searches snippet prefixes. Set this to
    -- `true` to also search the body of the snippets.
    alsoSearchSnippetBody = false,
  },
  -- `none` writes as a minified json file using `vim.encode.json`.
  -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
  -- you version control your snippets.
  jsonFormatter = "jq", -- "yq"|"jq"|"none"
}
