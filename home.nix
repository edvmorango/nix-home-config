{ config, lib, pkgs, ... }:

let

  unstable = import (import ./unstable-packages.nix) {};

  arionPkg = (import (builtins.fetchTarball https://github.com/hercules-ci/arion/tarball/master) {}).arion;

  defaultPkgs = with pkgs; [
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
  ];


  haskellPkgs = with pkgs.haskellPackages; [
    brittany
    cabal2nix
    cabal-install
    ghc
    haskell-language-server
    hoogle
    nix-tree
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
