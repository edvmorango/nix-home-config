{ config, lib, pkgs, ... }:


let

  nivPkgs = import ./nix/sources.nix;
  plugins = pkgs.vimPlugins;

  # Plugins which need a custom config
  customPkgs = pkgs.callPackage ./custom-pkgs.nix { };

  allPkgs = plugins // customPkgs;

  mkVimPlugin = nivPkg:
    let
      pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
        name = nivPkg.repo;
        src = pkgs.fetchFromGitHub
          {
            owner = nivPkg.owner;
            repo = nivPkg.repo;
            rev = nivPkg.rev;
            sha256 = nivPkg.sha256;
          };
      };
    in
    pkg;

  pluginsNames = map (strName: nivPkgs."${strName}")
  [
      "nvim-treesitter"
      "noice.nvim"
      "nvim-metals"
      "nvim-lspconfig"
      "nvim-cmp"
      "cmp-nvim-lsp"
      "lsp-status.nvim"
      "nvim-tree.lua"
      "nvim-web-devicons"
      "lualine.nvim"
      "lualine-lsp-progress"
      #editor
      "hlargs.nvim"
      "scrollbar.nvim"
      "tidy.nvim"
      #testing
      "neotest"
      "neotest-scala"
      #theme
      "onenord.nvim"
      #extra
      "nvim-whichkey-setup.lua"
    ];

  vimPlugins =
    map mkVimPlugin pluginsNames;


  # quotes are necessary for plugins with dots
  generalPlugins = with allPkgs;
    [
      neodark-vim
      luasnip
      cmp-luasnip
      nvim-notify
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
      lsp_signature-nvim
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
    scaladex-nvim
  ];

  neovimPkg = pkgs.neovim-unwrapped; #customPkgs.neovim-pkg;

  allPlugins = generalPlugins ++ nixPlugins ++ haskellPlugins ++ scalaPlugins ++ sqlPlugins ++ telescopePlugins ++
    vimPlugins;

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
