{
  config,
  pkgs,
  ...
}:
let
  gitConfig = {
    core = {
      editor = "nvim";
    };
    init.defaultBranch = "main";
  };
in
{

  programs.git = {
    enable = true;
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
    signing.format = "openpgp";
    settings = {
      extraConfig = gitConfig;
      user = {
        email = "edvmorango@gmail.com";
        name = "J. Eduardo V. Morango";
      };

    };
  };
}
