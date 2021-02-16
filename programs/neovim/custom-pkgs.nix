{ pkgs, ... }:

{

  neovim5 = pkgs.neovim-unwrapped.overrideAttrs (
    old: {
      version = "v0.5.0-593-g1ca67a73c";
      src = pkgs.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "1ca67a73c0ba680eb8328e68bea31f839855dd29";
        sha256 = "1568d5xmpnndxfclcjc05i4dp5480fp7qq0jqajz9n0xlrcfsmn2";
      };
    }
  );

  coc-elixir = pkgs.vimUtils.buildVimPlugin {
    name = "coc-elixir";
    src = pkgs.fetchFromGitHub {
      owner = "elixir-lsp";
      repo = "coc-elixir";
      rev = "0295904a0900903a39b541415ab145deb171abc1";
      sha256 = "1b3sc22rw9hgpbalpw6h52b3kg2xxx6b826k71sr2zyqp54k4p9x";
    };
  };

  vim-ormolu = pkgs.vimUtils.buildVimPlugin {
    name = "vim-ormolu";
    src = pkgs.fetchFromGitHub {
      owner = "sdiehl";
      repo = "vim-ormolu";
      rev = "edbeb0135692345b088182963e9b229fe2235ac0";
      sha256 = "03srdix06dhz4b8g9akx448dw2rjbwj840xg7p9c5bq8kbmsjy8x";
    };
  };


}
