{ pkgs }:

pkgs.callPackage "${pkgs.path}/pkgs/development/tools/parsing/tree-sitter/default.nix" {
  src = pkgs.fetchFromGitHub {
    owner = "tree-sitter";
    repo = "tree-sitter";
    tag = "v0.26.8";
    hash = "sha256-aHszbvLCLqCwAS4F4UmM3wbSb81QuG9FM7BDHTu1ZvM=";
    fetchSubmodules = true;
  };
}
