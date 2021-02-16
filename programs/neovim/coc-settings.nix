{
  "metals.serverVersion" = "0.9.8+54-2042dd0d-SNAPSHOT";
  "coc.preferences.formatOnSaveFiletypes" = [
    "scala"
    "haskell"
    "nix"
  ];

  "languageserver" = {

    "haskell" = {
      "command" = "ghcide";
      "args" = [ "--lsp" ];
      "rootPatterns" = [
        "*.cabal"
        "stack.yaml"
        "cabal.project"
        "package.yaml"
        "hie.yaml"
      ];
      "filetypes" = [
        "haskell"
        "lhaskell"
        "hs"
        "lhs"
      ];
    };

    "nix" = {
      "command" = "rnix-lsp";
      "filetypes" = [
        "nix"
      ];

    };

    "elixirLS" = {
      "command" = "~/.elixir-ls/release/language_server.sh";
      "filetypes" = [ "elixir" ];
    };

  };
}
