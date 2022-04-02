{ config, lib, pkgs, ... }:

let

  unstable = import (import ./unstable-packages.nix) {};

  arionPkg = (import (builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master) {}).arion;

  defaultPkgs = with pkgs; [
    coursier
    bloop
    git
    git-lfs
    niv
    dbeaver
    rnix-lsp
    any-nix-shell
    docker-compose
    dive
    exa
    slack
    xclip
    vscode
    iptables
    #postman
    tor
    lorri
    fzf
    fd
    ripgrep
    #skype
    highlight
    glib
    mcfly
    tldr
    procs
    zoxide
    openvpn
    sqlite
    whatsapp-for-linux
    google-chrome
    libreoffice
    keybase
    keybase-gui
    kbfs
    gnupg
    pinentry
    mongodb-compass
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
    qbittorrent
    #browsers
    firefox
    brave
    #documents
    file
    manix
    mupdf
    #programs
    discord
    zoom-us
    obs-studio
    tdesktop
    #steam
    # iterm1
    #kubectl
    #kops
    pritunl-ssh
    awscli2
    bat
    insomnia
    jetbrains.idea-ultimate
    steam-run
    postman
    #libs
    openssl
    chrpath
    patchelf
    zlib
  ];


  haskellPkgs = with pkgs.haskellPackages; [
    nix-tree
  ];

  customPkgs = [
    arionPkg
  ];

in
{

  programs.home-manager.enable = true;
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
    nix-direnv.enableFlakes = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

  };


  home = {
    homeDirectory = "/home/edvmorango";
    username = "edvmorango";
    packages = defaultPkgs ++ unstablePkgs ++ customPkgs ++ haskellPkgs;
    stateVersion = "21.05";


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
