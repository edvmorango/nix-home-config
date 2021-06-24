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
    #postman
    tor
    lorri
    fzf
    fd
    ripgrep
    #skype
    highlight
    glib
    exa
    mcfly
    tldr
    procs
    zoxide
  ];

  unstablePkgs = with unstable; [
    #audio 
    #pavucontrol
    #paprefs
    #pasystray
    #playerctl
    #pulsemixer
    #media
    #vlc
    #browsers
    #firefox
    #brave
    #documents
    #manix
    #mupdf
    #programs
    #discord
    #zoom
    #steam
    iterm2
    kubectl
    kops
    awscli2
    bat
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

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

  };


  home = {
    homeDirectory = "/home/edvmorango";
    username = "edvmorango";
    packages = defaultPkgs ++ unstablePkgs ++ customPkgs;
    stateVersion = "21.03";


  };

  xdg.enable = false;

  imports = [
    ./programs/fish/default.nix
    ./programs/neovim/default.nix
    ./programs/alacritty/default.nix
    #./programs/rofi/default.nix
    ./programs/tmux/default.nix
    ./programs/git/default.nix
  ];


}
