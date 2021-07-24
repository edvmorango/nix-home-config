{ pkgs, ... }:

{

  neovim5 = pkgs.neovim-unwrapped.overrideAttrs (
    old: {
      version = "v0.5.0-dev+1309-g516551319";
      src = pkgs.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "4be0e92db01a502863ac4bb26dd0fee16d833145";
        sha256 = "1h3sinb52xi4m94dv3dwlzjyr8mzz8v0ndgrkzgi3c1nwmf6b0f2";
      };

      buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
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

  darcula = pkgs.vimUtils.buildVimPlugin {
    name = "darcula";
    src = pkgs.fetchFromGitHub {
      owner = "doums";
      repo = "darcula";
      rev = "dca8aaba22bbcf4310be7d4e255543e5b6d4269d";
      sha256 = "0y2msc5dc8a263n0xba50ddbhi4aaj7pi9f6sda05id5g2pw2kx3";
    };
  };

  pgsql = pkgs.vimUtils.buildVimPlugin {
    name = "pgsql-vim";
    src = pkgs.fetchFromGitHub {
      owner = "lifepillar";
      repo = "lifepillar";
      rev = "51521a89018efb58aa6c530b8426936e6e2a85a9";
      sha256 = "0y2msc5dc8a263n0xba50ddbhi4aaj7pi9f6sda05id5g2pw2kx3";
    };

  };

  fzf-preview-vim = pkgs.vimUtils.buildVimPlugin {
    name = "fzf-preview.vim";
    src = pkgs.fetchFromGitHub {
      owner = "yuki-yano";
      repo = "fzf-preview.vim";
      rev = "cffcaecec6771b6fd531878b0037c235f94ca800";
      sha256 = "0azyacfw0dsf82s42gb0ximckg3vq3bjmn5n00fslvd3561fkdvk";
    };

  };

  vim-bookmarks = pkgs.vimUtils.buildVimPlugin {
    name = "vim-bookmarks";
    src = pkgs.fetchFromGitHub {
      owner = "MattesGroeger";
      repo = "vim-bookmarks";
      rev = "3adeae10639edcba29ea80dafa1c58cf545cb80e";
      sha256 = "1ikgs5cnqs9bhr8fqan8hg14px1j331l0b51yhnx00rmj4lr44bm";
    };

  };

  vim-custom-rooter = pkgs.vimUtils.buildVimPlugin {
    name = "vim-rooter";
    src = pkgs.fetchFromGitHub {
      owner = "edvmorango";
      repo = "vim-rooter";
      rev = "6fc7bb5fc42275f9d62fb16debe599ed51cde692";
      sha256 = "006fvzr8shhsz0kipv265i5vw499mrixrjr5573sbdwzqcrncpi5";
    };

  };


}
