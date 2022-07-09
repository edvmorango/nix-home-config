{ pkgs, ... }:

{

  neovim-pkg = pkgs.neovim-unwrapped.overrideAttrs (
    old: {
      name = "neovim";
      version = "v0.7.0";
      src = pkgs.fetchFromGitHub
        {
          owner = "neovim";
          repo = "neovim";
          rev = "v0.7.0";
          sha256 = "sha256-eYYaHpfSaYYrLkcD81Y4rsAMYDP1IJ7fLJJepkACkA8=";
        };
      buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
    }
  );


  tidy-nvim-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "tidy.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mcauley-penney";
      repo = "tidy.nvim";
      rev = "3d6f0c7d9f260734f2166e7e4f719227b08b060d";
      sha256 = "0nl9znxa4892racfzsh2rp1740780d2027yngcmpr5mk0inmmfkm";
    };
  };

  onenord-nvim-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "onenord.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "rmehri01";
      repo = "onenord.nvim";
      rev = "eaa5baec341a0b9dcf3621d886d77f4539f8a3c1";
      sha256 = "0qdjhms7lmrz36c6qrhani4hijhc3mwv31pym79yx0zc6cqgql99";
    };
  };

  nvim-tree-lua-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-tree.lua";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "4bd919a75f37c7127ccfc746fc59a71068db3ceb";
      sha256 = "0arzwzmrigsiqpdq9avlb0xmfcrxfvwg3ah0abg5cbv10zagzz8b";
    };
  };

  lualine-nvim-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "lualine.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "c15e3b4c9eb7015dd58688b3d9bb1d659a49d3d1";
      sha256 = "0s3734i7j28z5l17x8r6lj15rzpkmrpfywq96nhq3vrmnxiaaww1";
    };
  };

  nvim-web-devicons-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-web-devicons";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "2d02a56189e2bde11edd4712fea16f08a6656944";
      sha256 = "0f7r7xza28aaf60nbzaw9fcsjjff5c67jmgbci0jz21v2ib89pps";
    };
  };

  nvim-whichkey-setup-lua-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-whichkey-setup.lua";
    src = pkgs.fetchFromGitHub {
      owner = "AckslD";
      repo = "nvim-whichkey-setup.lua";
      rev = "b2df0761b8ba3fca31b7ae1b0afcad2f8a4e89f4";
      sha256 = "02bidgicrrx6jwm6hpcq0waqdzif2rws2q1i47zvi5x9i3zyl5cx";
    };
  };


  nvim-lspconfig-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "lspconfig";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "ad9903c66bac88f344890acb6532f63f1cd4dac3";
      sha256 = "10fg52g53yk0d10rm96kw907wdkgqw762ib6530zrnw7p8fbm2ms";
    };
  };

  virtual-types-nvim-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "virtual-types.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jubnzv";
      repo = "virtual-types.nvim";
      rev = "31da847fa54b801f309a08123935626adda4aaad";
      sha256 = "0kqg29xld064fz1xly1kc7wcyck62q5hjkb5fc5vrj0zdnrdzz22";
    };
  };

  lsp-status-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "lsp-staus.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "4073f766f1303fb602802075e558fe43e382cc92";
      sha256 = "1aicy5n57ihpy1fkrv3bpxdcmwbdldl6pnxisndfk2h0l2vc1bp4";
    };
  };



  lightline-lsp-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "lightline-lsp";
    src = pkgs.fetchFromGitHub {
      owner = "josa42";
      repo = "nvim-lightline-lsp";
      rev = "d9e61801f54c8824b59e93068865e3bc4f1ca0b8";
      sha256 = "0sd38c4cp7i6prgr86b5nq9fhpi2h1yrn3ggs3d7my65ayz759m6";
    };
  };

  vim-scala3 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-scala3";
    src = builtins.fetchTarball {
      name = "vim-scala3";
      url = "https://github.com/gvolpe/vim-scala/archive/7379894.tar.gz";
      sha256 = "1y9sjmcyv1ihkb0a3hxz85d0h2k9digczj7ppfrga2mj67lgwj4m";
    };
  };

  #  neovim5 = pkgs.neovim-unwrapped.overrideAttrs (
  #    old: {
  #      name = "neovim-5.0.0";
  #      version = "v0.5.0";
  #      src = pkgs.fetchFromGitHub {
  #        owner = "neovim";
  #        repo = "neovim";
  #        rev = "a5ac2f45ff84a688a09479f357a9909d5b914294";
  #        sha256 = "0lgbf90sbachdag1zm9pmnlbn35964l3khs27qy4462qzpqyi9fi";
  #};

  # buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
  #}
  #);

  nvim-cmp-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-cmp";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "433af3dffce64cbd3f99bdac9734768a6cc41951";
      sha256 = "0r3va6syk6vfhs909p4r5p4h3ifyy5f4rk0m9jnvwblg9cjy17sw";
    };
  };

  luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "LuaSnip";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "6b67cb12747225a6412d8263bb97d6d2b8d9366a";
      sha256 = "08a1kk8z3mcq65dh0hi44188dxkqjfg3yilr8viamyni1kwy7gf3";
    };
  };

  cmp-luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "cmp_luasnip";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "b10829736542e7cc9291e60bab134df1273165c9";
      sha256 = "1qygdas99m7py98rqxyza88lmk2as8yi9khjac603x6anxmq766l";
    };
  };



  telescope = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "8b02088743c07c2f82aec2772fbd2b3774195448";
      sha256 = "1ir6w7czd6xqk80nmppnpmykal78n8bjl1vjccp80zllrx3cidc7";
    };
  };

  telescope-neoclip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-neoclip.lua";
    src = pkgs.fetchFromGitHub {
      owner = "AckslD";
      repo = "nvim-neoclip.lua";
      rev = "d859891e4bff9729ad6e63bd4aebc51946de8786";
      sha256 = "17dbvr1y7hzrv04c89b4nmgmgg0qccrkz6qsh7vsava0lvjs4zm5";
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

  scaladex-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "scaladex.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "softinio";
      repo = "scaladex.nvim";
      rev = "93dddf53450c0563da8efec917b5301c581d8d6f";
      sha256 = "12vkq1zbvi6v1nyc1v75b2qh7za9h1f7xswmxlvn2j31xrm5yq66";
    };
  };

  telescope-command-palette = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-command-palette.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "LinArcX";
      repo = "telescope-command-palette.nvim";
      rev = "1944d6312b29a0b41531ea3cf3912f03e4eb1705";
      sha256 = "04mvffc813v783jhvq6ng8x4n2wp7mi96g8mmrxi3a7a8h84qh53";
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

  telescope-changes = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "telescope-changes.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "LinArcX";
      repo = "telescope-changes.nvim";
      rev = "7ed65f3698be4b5f7a9cdeb88a657bfa866dcb3c";
      sha256 = "17vyg2hz728hsjynwgywgb4k74583b2klw8xnm051yrfrw6zywqx";
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



  nvim-metals-pkg = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "nvim-metals";
    src = pkgs.fetchFromGitHub {
      owner = "scalameta";
      repo = "nvim-metals";
      rev = "bc6f2ba6d6b2c5ffd65b41f3df74761a90e538da";
      sha256 = "0fk41l2jmlhrylc9xbh4h9a35j106r0lr7rd0i2lp0acqai629qg";
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
      rev = "b1e8b61a94955d747ba8ad02cd3c0dddb1bf883f";
      sha256 = "047vzgqky7f5aas8ca9m5pif4cccjvxasf2zqiksz8j6nzj4sgf7";
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

  vim-cabalfmt = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-cabalfmt";
    src = pkgs.fetchFromGitHub {
      owner = "sdiehl";
      repo = "vim-cabalfmt";
      rev = "90f544ee637ee16f5acad01f4d7952734c7baed0";
      sha256 = "0hrxiv92qm7kxqbscnz1vk8m3gy2sh925faygzcbc94gjvriba1y";
    };
  };

  nvim-harpoon = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "harpoon";
    src = pkgs.fetchFromGitHub {
      owner = "ThePrimeagen";
      repo = "harpoon";
      rev = "b2bb0d6f2b8a55895afda53f0ad04527998d3411";
      sha256 = "0izsscglfk6lpisxvarr0qw4m9br8854wi6jhyp2msd8r9gcrzi7";
    };
  };



}
