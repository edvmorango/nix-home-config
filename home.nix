{ pkgs, ... }:
let

  defaultPkgs = with pkgs; [
    tlafmt
    neohtop
    calibre
    csvkit
    librepods
    usbutils
    evtest
    bluez
    bluez-tools
    dualsensectl
    kdePackages.okular
    amp-cli
    cheese
    mission-center
    wev
    ydotool
    opencode
    #ollama-cuda
    kdePackages.k3b
    ghostty
    unetbootin
    galaxy-buds-client
    inotify-tools
    _1password-cli
    _1password-gui
    #zed-editor
    jnv
    aider-chat
    gitify
    moreutils
    goose-cli
    postgres-lsp
    bruno
    ladybird
    writedisk
    jujutsu

    tor
    usbmuxd2
    gparted
    cloud-utils
    kdePackages.okular
    github-desktop
    redis
    anki
    nushell
    alejandra
    mesa
    rust-analyzer
    ngrok
    nailgun
    atuin
    tree-sitter
    git
    git-lfs
    niv
    dbeaver-bin
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
    mcfly
    tldr
    procs
    zoxide
    openvpn
    sqlite
    libreoffice
    keybase
    keybase-gui
    kbfs
    gnupg
    pinentry-curses
    mesa-demos
    kitty
    jq
    yq
    lua-language-server
    nodePackages.yaml-language-server
    wezterm
    gcc
    zoxide
    nixpkgs-fmt
    vscode
    difftastic
    k9s
    tlaplusToolbox
    #haskell.compiler.ghc925
    navi
    lm_sensors
    putty
    postman
    docker-compose-language-service
    dockerfile-language-server-nodejs
  ];

  impurePkgs = with pkgs; [
    helix
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
    slack
    google-chrome
    mongodb-compass
    obs-studio
    telegram-desktop
    insomnia
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
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    nix-tree
    cabal-fmt
    hoogle
    fourmolu
  ];

  customPkgs = [
  ];
in
{
  home = {
    packages = defaultPkgs ++ customPkgs ++ haskellPkgs ++ impurePkgs; # ;
    username = "edvmorango";
    homeDirectory = "/home/edvmorango";
    stateVersion = "22.05";

  };
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };

  programs = {
    home-manager.enable = true;

    waybar.enable = true;

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
  xdg.configFile."waybar/config.jsonc".text = builtins.readFile programs/waybar/waybar-config.jsonc;

  imports = [
    ./programs/fish/default.nix
    ./programs/tmux/default.nix
    ./programs/git/default.nix
  ];
}
