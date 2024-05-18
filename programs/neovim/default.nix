{pkgs, ...}: let
  nivPkgs = import ./nix/sources.nix;
  plugins = pkgs.vimPlugins;

  # Plugins which need a custom config

  mkVimPlugin = nivPkg: let
    pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = nivPkg.repo;
      src =
        pkgs.fetchFromGitHub
        {
          owner = nivPkg.owner;
          repo = nivPkg.repo;
          rev = nivPkg.rev;
          sha256 = nivPkg.sha256;
        };
    };
  in
    pkg;

  pluginsNames =
    map (strName: nivPkgs."${strName}")
    [
      #formatter
      "conform.nvim"
      #Diagnostics
      "trouble.nvim"
      "eagle.nvim"
      #Motion
      "nvim-spider"
      #rooter
      "nvim-rooter.lua"
      #
      "indent-blankline.nvim"
      "nui.nvim"
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
      "cmp_luasnip"
      "inc-rename.nvim"
      "autoclose.nvim"
      #"vim-rooter"
      "vim-scala"
      #editor
      "hlargs.nvim"
      "scrollbar.nvim"
      "tidy.nvim"
      "lsp_lines.nvim"
      #testing
      "nvim-nio" # for neotest
      "neotest"
      "neotest-plenary"
      "neotest-scala"
      #theme
      "onenord.nvim"
      #extra
      "nvim-whichkey-setup.lua"
      #topbar
      "nvim-navic"
      #util
      "undotree"
      #rust
      "rustaceanvim"
      #vale
      "vale.vim"
      #snippet
      "nvim-scissors"
      #  "LuaSnip"
      #"purescript-vim"
      "lspkind.nvim"
      #yank
      "yankbank-nvim"
    ];

  vimPlugins =
    map mkVimPlugin pluginsNames;

  allPkgs = plugins;

  # quotes are necessary for plugins with dots
  generalPlugins = with allPkgs; [
    neodark-vim
    luasnip
    #cmp-luasnip
    nvim-notify
    ##git
    vim-fugitive
    vim-gitgutter
    ##external
    vim-floaterm
    #vim-custom-rooter
    #fzf-vim
    ##misc
    vim-subversive #replacement \ + s
    rainbow_parentheses-vim # parentheses colors
    #indentLine # display vertical lines
    echodoc-vim # display lsp suggestions (ctrl-space)
    vim-abolish
    vim-auto-save
    #vim-scala3
    coq_nvim
    nvim-jqx
  ];

  nixPlugins = with plugins; [
    vim-nix
  ];

  haskellPlugins = with allPkgs; [
    haskell-vim
    ghcid
    vim-hoogle
    vim-ormolu
    # vim-cabalfmt
  ];

  scalaPlugins = with allPkgs; [
    vim-scala
    #nvim-metals
  ];

  sqlPlugins = [];

  telescopePlugins = map mkVimPlugin (map (strName: nivPkgs."${strName}")
    [
      "plenary.nvim"
      "telescope.nvim"
      "telescope-lsp-handlers.nvim"
      "telescope-media-files.nvim"
      "telescope-hoogle.nvim"
      "telescope-ui-select.nvim"
      "scaladex.nvim"
      "telescope-undo.nvim"
      "search.nvim"
      "easypick.nvim"
    ]);

  neovimPkg = pkgs.neovim-unwrapped; #customPkgs.neovim-pkg;

  allPlugins =
    generalPlugins
    ++ nixPlugins
    ++ haskellPlugins
    ++ scalaPlugins
    ++ sqlPlugins
    ++ telescopePlugins
    ++ vimPlugins;
in {
  programs.neovim = {
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
