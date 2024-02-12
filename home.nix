{pkgs, ...}: let
  arionPkg = (import (builtins.fetchTarball "https://github.com/hercules-ci/arion/tarball/master") {}).arion;

  nix-alien-pkgs = import (
    builtins.fetchTarball "https://github.com/thiagokokada/nix-alien/tarball/master"
  ) {};

  alien = with nix-alien-pkgs; [
    nix-alien
  ];

  defaultPkgs = with pkgs; [
    github-desktop
    redis
    anki
    nushell
    alejandra
    mesa
    bookworm
    rust-analyzer
    ngrok
    nailgun
    atuin
    _1password
    _1password-gui
    tree-sitter
    git
    git-lfs
    niv
    dbeaver
    nil
    any-nix-shell
    docker-compose
    dive
    eza
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
    glxinfo
    mesa.drivers
    kitty
    jq
    yq
    sumneko-lua-language-server
    nodePackages.yaml-language-server
    wezterm
    gcc
    zoxide
    nixpkgs-fmt
    vscode
    difftastic
    k9s
    tlaplusToolbox
  ];

  impurePkgs = with pkgs; [
    act
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
    jetbrains.idea-community
    #postman
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

  haskellPkgs = with pkgs.haskellPackages; [
    nix-tree
  ];

  customPkgs = [
    arionPkg
  ];
in {
  home = {
    packages = defaultPkgs ++ customPkgs ++ haskellPkgs ++ impurePkgs ++ alien; #;
    username = "edvmorango";
    homeDirectory = "/home/edvmorango";
    stateVersion = "22.05";
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

    kitty = {
      enable = true;
      extraConfig = builtins.readFile programs/kitty/kitty.conf;
    };
  };

  xdg.enable = true;

  xdg.configFile."wezterm/wezterm.lua".text = builtins.readFile programs/wezterm/wezterm.lua;

  imports = [
    ./programs/fish/default.nix
    ./programs/neovim/default.nix
    ./programs/tmux/default.nix
    ./programs/git/default.nix
  ];
}
