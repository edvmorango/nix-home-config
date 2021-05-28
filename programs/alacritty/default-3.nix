{ pkgs, config, lib, ... }:

let

  alacritty-ligatures = pkgs.callPackage ./custom.nix {};
in
{

  programs.alacritty = {
    enable = true;
    package = alacritty-ligatures;
    settings = {
      background_opacity = 1;
      bell = {
        animation = "EaseOutExpo";
        duration = 5;
        color = "#ffffff";
      };
      colors = {
        primary = {
          background = "#040404";
          foreground = "#c5c8c6";
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
          size = 11;
          ligature = true;
        };
        size = 11;
        ligature = true;
      };
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.tmux}/bin/tmux";
      window = {
        decorations = "full";
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
