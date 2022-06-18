{ pkgs
, lib ? pkgs.lib
, ...
}: { config
   , debug ? false
   ,
   }:
let
  neovimPlugins = pkgs.neovimPlugins;
  myNeovimUnwrapped = pkgs.neovim-unwrapped.overrideAttrs (prev: {
    propagatedBuildInputs = with pkgs; [ pkgs.stdenv.cc.cc.lib ];
  });

  #vim = vimOptions.config.vim;


  allConfig = (builtins.readFile ../config.vim);

in

pkgs.wrapNeovim myNeovimUnwrapped {

  vimAlias = pkgs.vim.vimAlias;
  configure = {

    enable = true;
    extraConfig = allConfig;
    #package = neovimPkg;
    #plugins = neovimPlugins;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true; # for coc.nvim
    withPython3 = true; # for plugins

    packages.myVimPackage = with neovimPlugins;
      {
        start = builtins.filter (f: f != null) vim.startPlugins;
        opt = vim.optPlugins;
      };
  };
}
