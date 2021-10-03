{ pkgs, ... }:

{

  neovim5 = pkgs.neovim-unwrapped.overrideAttrs (
    old: {
      name = "neovim-5.0.0";
      version = "v0.5.0";
      src = pkgs.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "a5ac2f45ff84a688a09479f357a9909d5b914294";
        sha256 = "0lgbf90sbachdag1zm9pmnlbn35964l3khs27qy4462qzpqyi9fi";
      };

      buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
    }
  );

  telescope = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "440c598de419858a056e7d9d42a0a6829cd5bb05";
      sha256 = "08rv6jd7r07n1pj7wjnwlq2wh25vp1hv5kkfywjavrvmb1ka6ik6";
    };
  };

  telescope-neoclip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-neoclip.lua";
    src = pkgs.fetchFromGitHub {
      owner = "AckslD";
      repo = "nvim-neoclip.lua";
      rev = "ecf149d4baab347a101d427c3d472730504182e8";
      sha256 = "05bbqyixchy53v59c0wpn6r5sb3d0cn3y1c6fznrgk4dx1pq7zp8";
    };
  };

  telescope-coc = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-coc.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "fannheyward";
      repo = "telescope-coc.nvim";
      rev = "7b8aa399b31998b7adf3da505a1952b1310d429c";
      sha256 = "1x1m13yk222lay6j4w76y9ydbvn52022gif34d452n2x7jk0cvbf";
    };
  };

  telescope-lsp-handlers = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-lsp-handlers";
    src = pkgs.fetchFromGitHub {
      owner = "gbrlsnchs";
      repo = "telescope-lsp-handlers.nvim";
      rev = "d6d5983b0131ee2c386ca9e349f6621e12d971cb";
      sha256 = "1x51mlj1c3cwmcjqssh89049q91423jxm3rv8s25pcw493zb2x6b";
    };
  };


  telescope-media-files = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-media-files";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-media-files.nvim";
      rev = "9d9487dc97c885ea75d9242272ba7472a495f087";
      sha256 = "1wv0zndnrjv3nkm7lma5386h5nl6vni3ffdyz8wfa7yi4vkhw936";
    };
  };

  telescope-tele-tabby = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-tele-tabby";
    src = pkgs.fetchFromGitHub {
      owner = "TC72";
      repo = "telescope-tele-tabby.nvim";
      rev = "03d4bce80ddc0c215bf1056affe5fa468638130c";
      sha256 = "1zg9vbzvxx1xxw3fdkm4zjhr33shmhmj05yb6hq096p5zl7qk1h8";
    };
  };

  telescope-hoogle = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-hoogle";
    src = pkgs.fetchFromGitHub {
      owner = "luc-tielen";
      repo = "telescope_hoogle";
      rev = "01d3b174754cb335a7f06ce602f1690e34bb63de";
      sha256 = "1i1s0wrxv0c19469z6kyyp84prr4kkf3jvmlmn98qyaysd1y5jmq";
    };
  };



  nvim-metals = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-metals";
    src = pkgs.fetchFromGitHub {
      owner = "scalameta";
      repo = "nvim-metals";
      rev = "ffc3df0595c1502e0f000fbe6f7ed2de108d5f1d";
      sha256 = "1mbc7avcls29b5h3m6hfn6g6x541f04j3w8j1icmkk2sc5p45gnq";
    };
  };

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

  vim-maximizer = pkgs.vimUtils.buildVimPlugin {
    name = "vim-maximizer";
    src = pkgs.fetchFromGitHub {
      owner = "szw";
      repo = "vim-maximizer";
      rev = "2e54952fe91e140a2e69f35f22131219fcd9c5f1";
      sha256 = "031brldzxhcs98xpc3sr0m2yb99xq0z5yrwdlp8i5fqdgqrdqlzr";
    };

  };

  coq-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "coq-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ms-jpq";
      repo = "coq_nvim";
      rev = "f5f7e4b2d112ad45edc47306f80524c2ca952c1b";
      sha256 = "0035qqr2n31x7zzdca5kgiw31q746j7cf9i14h0pzl3z07g3zmh9";
    };
  };

  coq-artifacts = pkgs.vimUtils.buildVimPlugin {
    name = "coq-artifacts";
    src = pkgs.fetchFromGitHub {
      owner = "ms-jpq";
      repo = "coq.artifacts";
      rev = "7a7835caec51d49f7d177bcf329c8d7605a467c0";
      sha256 = "0dbyq6xk6aqkj1rvjd5nzq6mdz8djbcgxvnp2q6av30jcn6ihcfp";
    };
  };

  treesitter = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-treesitter";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "fc1c31a393a713f7a6fe34a829ac3d5e521de0be";
      sha256 = "1if882555gydwbvgjz2zc50yszz3fsha3wi9rbvhjy76h4yd5a22";
    };
  };

  plenary = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "plenary.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "6bb0e09030a7c2af19bf288088ca815228de9429";
      sha256 = "12c3xfqmhnk0k1x6jjh4hbhw0w3d42afsfpvg542nwly17hy3sfg";
    };
  };

  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-web-devicon";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "9ed2037df0ee87d0d6c084187d1e340b4eac7587";
      sha256 = "1fkwbs6lpxrks3wb3l5laxjraxwwzlmmw7i4r7yawa2kyf05hvvy";
    };
  };

}
