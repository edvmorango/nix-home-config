{ pluginInputs, ... }: final: prev:
let
  inherit (prev.vimUtils) buildVimPluginFrom2Nix;

  #treesitterGrammars = prev.tree-sitter.withPlugins (_: prev.tree-sitter.allGrammars);

  plugins = (builtins.attrNames pluginInputs);


  buildPlugin = name:
    buildVimPluginFrom2Nix {
      pname = name;
      version = "master";
      src = builtins.getAttr name pluginInputs;
    };

in
{
  neovimPlugins = builtins.listToAttrs (map
    (plugin: {
      name = plugin;
      value = buildPlugin plugin;
    })
    plugins);
}

