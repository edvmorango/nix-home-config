{ config, lib, pkgs, ... }:


let

  plugins = pkgs.vimPlugins;

  # Plugins which need a custom config
  customPkgs = pkgs.callPackage ./custom-pkgs.nix { };



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
    #completion-nvim
    nvim-metals-pkg
    nvim-lspconfig-pkg
    lightline-lsp-pkg
    nvim-cmp-pkg
    cmp-nvim-lsp
    luasnip
    cmp-luasnip
    nvim-notify
    lsp-status-pkg
    #  nvim-cursorline
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
    coq_nvim
  ];

  cocPlugins = with allPkgs; [
    # coc-nvim
    # coc-metals
    #coc-elixir
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

  sqlPlugins = with allPkgs; [ ];

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


  neovimPkg = customPkgs.neovim-pkg;



  allPlugins = generalPlugins ++ cocPlugins ++ nixPlugins ++ haskellPlugins ++ scalaPlugins ++ elixirPlugins ++ sqlPlugins ++ telescopePlugins;

  vimConfig = builtins.readFile ./config.vim;
  cmpConfig = builtins.readFile ./plugins/cmp.vim;
  ormoluConfig = builtins.readFile ./plugins/ormolu.vim;
  metalsConfig = builtins.readFile ./plugins/metals.vim;
  #cocConfig = builtins.readFile ./plugins/coc.vim;
  telescopeConfig = builtins.readFile ./plugins/telescope.vim;
  notifyConfig = builtins.readFile ./plugins/notify.vim;
  rnixConfig = builtins.readFile ./plugins/rnix.vim;


  cocSettings = builtins.toJSON (import ./coc-settings.nix);

  allConfig = vimConfig + ormoluConfig + telescopeConfig + notifyConfig + metalsConfig + rnixConfig;
  # + cocConFIG

in
{
  programs.neovim = {
    enable = true;
    extraConfig = allConfig;
    package = neovimPkg;
    plugins = allPlugins;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true; # for coc.nvim
    withPython3 = true; # for plugins


    # extraPython3Packages = p: with p; 
    # with callPackage ./custom/coq-nvim/python.nix p p p; [ 
    #   pyyaml 
    #   pynvim-pp 
    #   std2 
    # ];
  };


  xdg.configFile = {
    "nvim/coc-settings.json".text = cocSettings;
  };

}
