{
  "metals" = {
    "serverVersion" = "0.10.7+74-b68f0c82-SNAPSHOT";
    "superMethodLensesEnabled" = "true";
    "showInferredType" = "true";
    "showImplicitArguments" = "true";
    "showImplicitConversionsAndClasses" = "true";
    "enableIdentOnPaste" = "true";
    "codeLens.enable" = "true";
    "statusBarEnabled" = "true";
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
        "lh"
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
