{ pkgs }:

let

  mkVimPlugin = nivPkg:
    let
      pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
        name = nivPkg.repo;
        src = pkgs.fetchFromGitHub
          {
            owner = nivPkg.owner;
            repo = nivPkg.repo;
            rev = nivPkg.rev;
            sha256 = nivPkg.sha256;
          };
      };
    in
    pkg;

in
mkVimPlugin
