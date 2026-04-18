# overlays/tree-sitter.nix
{ tree-sitter }:

final: prev: {
  tree-sitter = prev.tree-sitter.overrideAttrs (oldAttrs: {
    version = "0.26.8";
    src = tree-sitter;

    # Optional: If the latest version requires different build steps,
    # you would add them here. Usually, overrideAttrs is enough.
  });
}
