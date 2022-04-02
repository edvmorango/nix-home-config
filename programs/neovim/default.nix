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
    vim-deus
    onedark-vim
    vim-one
    neodark-vim
    #tender-vim
    ##editor
    nerdtree
    treesitter
    #lua-vim
    #   plenary-nvim
    completion-nvim
    #coq-nvim
    #coq-artifacts
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
    vim-maximizer
    vim-scala3
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
    vim-cabalfmt
  ];

  scalaPlugins = with allPkgs; [
    vim-scala
    #nvim-metals
  ];

  elixirPlugins = with plugins; [
    vim-elixir
    alchemist-vim
  ];

  sqlPlugins = with allPkgs; [
    pgsql
  ];

  telescopePlugins = with allPkgs; [
    plenary
    nvim-web-devicons
    telescope
    telescope-neoclip
    telescope-coc
    telescope-lsp-handlers
    telescope-media-files
    telescope-tele-tabby
    telescope-hoogle
    telescope-changes
    telescope-command-palette
    nvim-harpoon
    scaladex-nvim
  ];


  neovim5 = customPkgs.neovim5;



  allPlugins = generalPlugins ++ cocPlugins ++ nixPlugins ++ haskellPlugins ++ scalaPlugins ++ elixirPlugins ++ sqlPlugins ++ telescopePlugins;

  vimConfig = builtins.readFile ./config.vim;
  ormoluConfig = builtins.readFile ./plugins/ormolu.vim;
  metalsConfig = builtins.readFile ./plugins/metals.vim;
  cocConfig = builtins.readFile ./plugins/coc.vim;
  telescopeConfig = builtins.readFile ./plugins/telescope.vim;
  cocSettings = builtins.toJSON (import ./coc-settings.nix);

  allConfig = vimConfig + cocConfig + ormoluConfig + telescopeConfig; #+ metalsConfig

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
