{ config, lib, pkgs, ... }:


let

  plugins = pkgs.vimPlugins;

  # Plugins which need a custom config
  customPkgs = pkgs.callPackage ./custom-pkgs.nix {};


  allPkgs = plugins // customPkgs;

  generalPlugins = with allPkgs; [
    lightline-vim
    vim-devicons
    vim-fugitive
    vim-gitgutter
    #vim-hardtime
    vim-floaterm
    vim-abolish
    echodoc-vim
    rainbow_parentheses-vim
    nerdtree
    #tender-vim
    vim-which-key
    lexima-vim
    fzf-vim
    vim-floaterm
    indentLine
    vista-vim
    vim-auto-save
    # vim-visual-multi
    vim-subversive
    darcula
    # autoread
  ];

  cocPlugins = with allPkgs; [
    coc-nvim
    coc-metals
    coc-elixir
  ];

  nixPlugins = with plugins; [
    vim-nix
  ];

  haskellPlugins = with allPkgs; [
    haskell-vim
    ghcid
    vim-hoogle
    vim-ormolu
  ];

  scalaPlugins = with plugins; [
    vim-scala
  ];

  elixirPlugins = with plugins; [
    vim-elixir
    alchemist-vim
  ];

  sqlPlugins = with allPkgs; [
    pgsql
  ];

  neovim5 = customPkgs.neovim5;

  allPlugins = generalPlugins ++ cocPlugins ++ nixPlugins ++ haskellPlugins ++ scalaPlugins ++ elixirPlugins ++ sqlPlugins;

  vimConfig = builtins.readFile ./config.vim;
  ormoluConfig = builtins.readFile ./plugins/ormolu.vim;
  cocConfig = builtins.readFile ./plugins/coc.vim;
  cocSettings = builtins.toJSON (import ./coc-settings.nix);

  allConfig = vimConfig + cocConfig + ormoluConfig;

in
{
  programs.neovim = {
    enable = true;
    extraConfig = allConfig;
    package = neovim5;
    plugins = allPlugins;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true; # for coc.nvim
    withPython3 = true; # for plugins
  };


  xdg.configFile = {
    "nvim/coc-settings.json".text = cocSettings;
  };

}
