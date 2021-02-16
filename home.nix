{ config, lib, pkgs, ... }:

let

  unstable = import (import ./unstable-packages.nix) {};

  arionPkg = (import (builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master) {}).arion;

  defaultPkgs = with pkgs; [
    git
    dbeaver
    rnix-lsp
    any-nix-shell
    docker-compose
    dive
    exa
    slack
    xclip
    vscode
    postman
    tor
    lorri
    fzf
    skype
  ];

  unstablePkgs = with unstable; [
    #audio 
    pavucontrol
    paprefs
    pasystray
    playerctl
    pulsemixer
    #media
    vlc
    #browsers
    firefox
    brave
    #documents
    manix
    mupdf
    #programs
    discord
    zoom
    steam

  ];

  customPkgs = [ arionPkg ];

in
{

  programs.home-manager.enable = true;
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableNixDirenvIntegration = true;
  };


  home = {
    homeDirectory = "/home/edvmorango";
    username = "edvmorango";
    packages = defaultPkgs ++ unstablePkgs ++ customPkgs;
    stateVersion = "21.03";
  };

  xdg.enable = true;

  imports = [
    ./programs/neovim/default.nix
    ./programs/alacritty/default.nix
    ./programs/rofi/default.nix
    ./programs/tmux/default.nix
    ./programs/fish/default.nix
    ./programs/git/default.nix
  ];

}
