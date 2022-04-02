{ config
, lib
, pkgs
, ...
}:

let

  #unstable = import (import ./unstable-packages.nix) {};

  arionPkg = (import (builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master) { }).arion;

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
    xclip
    # vscode
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
    libreoffice
    keybase
    keybase-gui
    kbfs
    gnupg
    pinentry
  ];

  impurePkgs = with pkgs; [
    #audio
    pavucontrol
    paprefs
    #pasystray
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
    slack
    google-chrome
    mongodb-compass
    obs-studio
    tdesktop
    insomnia
    jetbrains.idea-ultimate
    postman
    #dev
    kubectl
    kops
    pritunl-ssh
    awscli2
    bat
    #libs
    openssl
    chrpath
    patchelf
    zlib
  ];


  haskellPkgs = with pkgs.haskellPackages;
    [
      nix-tree
    ];

  customPkgs = [
    arionPkg
  ];

in
{

  home = {
    packages = defaultPkgs ++ customPkgs ++ haskellPkgs ++ impurePkgs; #;
  };

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      #    enableFishIntegration = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;

    };

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

