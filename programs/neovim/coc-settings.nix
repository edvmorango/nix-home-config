{
  "metals" = {
    "serverVersion" = "0.10.4+95-8e23e067-SNAPSHOT";
    "superMethodLensesEnabled" = "true";
    "showInferredType" = "true";
    "codeLens.enable" = "true";
  };

  "coc.preferences.formatOnSaveFiletypes" = [
    "scala"
    "haskell"
    "nix"
  ];

  "languageserver" = {

    "haskell" = {
      "command" = "haskell-language-server-wrapper";
      "args" = [ "--lsp" ];
      "rootPatterns" = [
        "stack.yaml"
        "hie.yaml"
        ".hie-bios"
        "BUILD.bazel"
        ".cabal"
        "cabal.project"
        "package.yaml"
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

  };
}
