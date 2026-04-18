# overlays/tree-sitter.nix
{ treesitter-src }:

final: prev: {
  tree-sitter = prev.tree-sitter.overrideAttrs (oldAttrs: {
    version = "0.26.8";
    src = treesitter-src;
    dontApplyPatches = true;
  });
}
