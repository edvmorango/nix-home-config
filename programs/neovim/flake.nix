{
  description = "neovim plugins flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    neovim-flake = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #######################         PLUGINS       ##########################
    lightline-vim = {
      url = "github:itchyny/lightline.vim";
      flake = false;
    };

    vim-devicons = {
      url = "github:ryanoasis/vim-devicons";
      flake = false;
    };

    vim-deus = {
      url = "github:ajmwagar/vim-deus";
      flake = false;
    };

    onedark-vim = {
      url = "github:joshdick/onedark.vim";
      flake = false;
    };

    vim-one = {
      url = "github:rakr/vim-one";
      flake = false;
    };

    neodark-vim = {
      url = "github:KeitaNakamura/neodark.vim";
      flake = false;
    };

    nerdtree = {
      url = "github:preservim/nerdtree";
      flake = false;
    };

    nvim-treesiter = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };

    nvim-metals = {
      url = "github:scalameta/nvim-metals";
      flake = false;
    };

    nvim-lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    nvim-lightline-lsp = {
      url = "github:josa42/nvim-lightline-lsp";
      flake = false;
    };

    nvim-notify = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };

    lsp-status-nvim = {
      url = "github:nvim-lua/lsp-status.nvim";
      flake = false;
    };

    vim-subversive = {
      url = "github:svermeulen/vim-subversive";
      flake = false;
    };

    vim-easy-align = {
      url = "github:junegunn/vim-easy-align";
      flake = false;
    };

    vista-vim = {
      url = "github:liuchengxu/vista.vim";
      flake = false;
    };

    rainbow_parentheses-vim = {
      url = "github:kien/rainbow_parentheses.vim";
      flake = false;
    };

    indentLine = {
      url = "github:Yggdroot/indentLine";
      flake = false;
    };

    echodoc-vim = {
      url = "github:Shougo/echodoc.vim";
      flake = false;
    };

    lexima-vim = {
      url = "github:cohama/lexima.vim";
      flake = false;
    };

    vim-abolish = {
      url = "github:tpope/vim-abolish";
      flake = false;
    };

    vim-fugitive = {
      url = "github:tpope/vim-fugitive";
      flake = false;
    };

    vim-gitgutter = {
      url = "github:airblade/vim-gitgutter";
      flake = false;
    };

    vim-floaterm = {
      url = "github:voldikss/vim-floaterm";
      flake = false;
    };

    vim-rooter = {
      url = "github:edvmorango/vim-rooter";
      flake = false;
    };

    fzf-vim = {
      url = "github:junegunn/fzf.vim";
      flake = false;
    };

    vim-which-key = {
      url = "github:liuchengxu/vim-which-key";
      flake = false;
    };

    vim-auto-save = {
      url = "github:907th/vim-auto-save";
      flake = false;
    };

    vim-maximizer = {
      url = "github:szw/vim-maximizer";
      flake = false;
    };

    vim-scala3 = {
      url = "github:gvolpe/vim-scala";
      flake = false;
    };

    coq-nvim = {
      url = "github:ms-jpq/coq_nvim";
      flake = false;
    };

    vim-nix = {
      url = "github:LnL7/vim-nix";
      flake = false;
    };

    haskell-vim = {
      url = "github:neovimhaskell/haskell-vim";
      flake = false;
    };

    ghcid-vim = {
      url = "github:ndmitchell/ghcid";
      flake = false;
    };

    vim-hoogle = {
      url = "github:Twinside/vim-hoogle";
      flake = false;
    };

    vim-ormolu = {
      url = "github:sdiehl/vim-ormolu";
      flake = false;
    };

    vim-cabalfmt = {
      url = "github:sdiehl/vim-cabalfmt";
      flake = false;
    };

    plenary-nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    nvim-web-devicons = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };

    telescope-nvim = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };

    nvim-neoclip = {
      url = "github:AckslD/nvim-neoclip.lua";
      flake = false;
    };

    telescope-lsp-handlers-nvim = {
      url = "github:gbrlsnchs/telescope-lsp-handlers.nvim";
      flake = false;
    };

    telescope-media-files-nvim = {
      url = "github:nvim-telescope/telescope-media-files.nvim";
      flake = false;
    };

    telescope-hoogle-nvim = {
      url = "github:psiska/telescope-hoogle.nvim";
      flake = false;
    };

    telescope-command-palette-nvim = {
      url = "github:LinArcX/telescope-command-palette.nvim";
      flake = false;
    };

    harpoon = {
      url = "github:ThePrimeagen/harpoon";
      flake = false;
    };

    scaladex-nvim = {
      url = "github:softinio/scaladex.nvim";
      flake = false;
    };


  };


  outputs =
    { self
    , nixpkgs
    , flake-utils
    , neovim-flake
    , ...
    } @ inputs:

    flake-utils.lib.eachDefaultSystem (system:
    let
      pluginOverlay = lib.buildPluginOverlay;

      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          pluginOverlay
          (final: prev: {
            neovim-unwrapped = neovim-flake.packages.${prev.system}.neovim;
          })
        ];

      };

      pluginInputs = rec {
        res = nixpkgs.lib.attrsets.getAttrs valid inputs;

        valid = builtins.filter
          (s: (builtins.elem s nonPlugins) == false)
          (builtins.attrNames inputs);

        nonPlugins = [ "nixpkgs" "flake-utils" "neovim-flake" ];
      }.res;

      lib = import ./src {
        inherit pkgs pluginInputs;
      };

      neovimBuilder = lib.neovimBuilder;

    in
    rec {

      packages = with pkgs; {
        inherit neovim;
      };

      apps = {
        nvim = flake-utils.lib.mkApp {
          drv = pkgs.neovim;
          name = "nvim";
        };
      };

      defaultApp = apps.nvim;
      defaultPackage = packages.neovimCustom;

    }
    );

}

