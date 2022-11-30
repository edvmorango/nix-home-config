{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x FZF_DEFAULT_COMMAND "fd --type f"
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';

  themeConfig = ''
    set -g theme_display_date no
    set -g theme_nerd_fonts yes
    set -g theme_display_git_master_branch no
    set -g theme_nerd_fonts yes
    set -g theme_newline_cursor yes
  '';

  fishPlugins = pkgs.callPackage ./custom.nix { };

  customAliases = ''
    alias docker-kill="docker kill (docker ps -q)"
  '';

  fishConfig = ''
    set fish_greeting
  '' + fzfConfig + themeConfig + customAliases;


in
{
  programs.fish = {
    enable = true;
    plugins = [ fishPlugins.theme ];
    interactiveShellInit = ''
      eval (direnv hook fish)
      any-nix-shell fish --info-right | source
      zoxide init fish --cmd cd | source
    '';
    shellAliases = {
      cat = "bat";
    };
    shellInit = fishConfig;
  };

  xdg.configFile."fish/functions/fish_prompt.fish".text = fishPlugins.prompt;
}
