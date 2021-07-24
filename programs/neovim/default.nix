{ config, lib, pkgs, ... }:


let

  plugins = pkgs.vimPlugins;

  # Plugins which need a custom config
  customPkgs = pkgs.callPackage ./custom-pkgs.nix {};


  allPkgs = plugins // customPkgs;

  generalPlugins = with allPkgs; [
    ##themes
    lightline-vim
    vim-devicons
    darcula
    vim-deus
    #tender-vim
    ##editor
    nerdtree
    #nerdtree-git-plugin
    vim-subversive #replacement \ + s
    vim-easy-align
    vista-vim # lsp symbols
    rainbow_parentheses-vim # parentheses colors
    indentLine # display vertical lines
    echodoc-vim # display lsp suggestions (ctrl-space)
    lexima-vim # autoclose parentheses
    vim-abolish
    ##git
    vim-fugitive
    vim-gitgutter
    ##external
    vim-floaterm
    vim-custom-rooter
    fzf-vim
    ##misc
    vim-bookmarks
    vim-which-key
    vim-auto-save
    #vim-hardtime
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
