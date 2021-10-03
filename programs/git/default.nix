{ config, pkgs, ... }:

let
  gitConfig = {};
in
{
  programs.git = {
    enable = true;
    extraConfig = gitConfig;
    ignores = [
      "*.bloop"
      "*.metals"
      "*.metals.sbt"
      "*metals.sbt"
      "*.direnv"
      ".env"
      ".flyway.conf"
      ".vimdir"
      ".vimsubdir"
    ];
    userEmail = "edvmorango@gmail.com";
    userName = " J.Eduardo V.Morango ";
  };
}
