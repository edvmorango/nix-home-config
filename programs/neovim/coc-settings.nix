{
  "metals" = {
    "serverVersion" = "0.10.3+18-7ef52f21-SNAPSHOT";
    "superMethodLensesEnabled" = "true";
    "showInferredType" = "true";
    "codeLens.enable" = "true";
  };

  " coc.preferences.formatOnSaveFiletypes " = [
    " scala "
    " haskell "
    " nix "
  ];

  " languageserver " = {

    " haskell " = {
      " command " = " ghcide ";
      " args " = [ " - -lsp " ];
      " rootPatterns " = [
        " * .cabal "
        " stack.yaml "
        " cabal.project "
        " package.yaml "
        " hie.yaml "
      ];
      " filetypes " = [
        " haskell "
        " lhaskell "
        " hs "
        " lhs "
      ];
    };

    " nix " = {
      " command " = " rnix-lsp ";
      " filetypes " = [
        " nix "
      ];

    };

    " elixirLS " = {
      " command " = " ~/.elixir-ls/release/language_server.sh ";
      " filetypes " = [ " elixir " ];
    };

  };
}
