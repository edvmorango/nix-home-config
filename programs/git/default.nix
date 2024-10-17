{
  config,
  pkgs,
  ...
}: let
  gitConfig = {
    core = {
      editor = "nvim";
    };
    init.defaultBranch = "main";
  };
in {
  programs.git = {
    enable = true;
    difftastic.enable = true;
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
      ".vimrootdir"
      ".jj"
    ];
    userEmail = "edvmorango@gmail.com";
    userName = "J. Eduardo V. Morango";
  };
}
