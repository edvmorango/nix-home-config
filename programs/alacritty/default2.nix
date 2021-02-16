{ pkgs, ... }:

let
  alacritty-ligature = pkgs.callPackage ./custom.nix {};

in
{
  programs.alacritty = {
    cargoSha256 = "0000000000000000000000000000000000000000000000000000";
    enable = true;
    package = alacritty-ligature;
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
        size = 11;
      };
      selection.save_to_clipboard = true;
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
