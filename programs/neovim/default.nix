{ config, lib, pkgs, ... }:


let

  plugins = pkgs.vimPlugins;

  # Plugins which need a custom config
  customPkgs = pkgs.callPackage ./custom-pkgs.nix { };

  allPkgs = plugins // customPkgs;

  generalPlugins = with allPkgs; [
    ##themes
    #vim-devicons
    neodark-vim
    ##editor
    treesitter
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
    nvim-tree-lua-pkg
    nvim-whichkey-setup-lua-pkg
    nvim-web-devicons-pkg
    lualine-nvim-pkg
    lualine-lsp-progress-pkg
    ##git
    vim-fugitive
    vim-gitgutter
    ##external
    vim-floaterm
    vim-custom-rooter
    fzf-vim
    ##misc
    vim-subversive #replacement \ + s
    rainbow_parentheses-vim # parentheses colors
    indentLine # display vertical lines
    echodoc-vim # display lsp suggestions (ctrl-space)
    lexima-vim # autoclose parentheses
    vim-abolish
    vim-auto-save
    vim-scala3
    coq_nvim
    nvim-jqx
    twilight-nvim
    tidy-nvim-pkg
    onenord-nvim-pkg
    lsp_signature-nvim
    hlargs-nvim-pkg
    scrollbar-nvim-pkg
    fixcursorhold-nvim-pkg
    neotest-pkg
    neotest-scala-pkg
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

  allPlugins = generalPlugins ++ nixPlugins ++ haskellPlugins ++ scalaPlugins ++ sqlPlugins ++ telescopePlugins;

  luaInit = builtins.readFile ./init.lua;

in
{
  programs.neovim =
    {
      enable = true;
      plugins = allPlugins;
      package = neovimPkg;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true; # for coc.nvim
      withPython3 = true; # for plugins
      # The snippet below is hardcoded because for some reason even copying the file nix doesn't manage to find
      # `config.lua` in the store
      extraConfig = ''
        luafile /home/edvmorango/.config/nvim/lua/config.lua
      '';
    };

  xdg.configFile.nvim = {
    source = ./.;
    recursive = true;
  };

}
