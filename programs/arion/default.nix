{ pkgs, ... }:

let

  arionPkg = builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master {};

in
{
  programs.arion = {
    enable = true;
    package = arionPkg;
  };

}
