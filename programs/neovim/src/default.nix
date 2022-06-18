{ pkgs
, pluginInputs
,
}: {
  inherit (pkgs.lib);

  neovimBuilder = import ./neovimBuilder.nix { inherit pkgs; };
  buildPluginOverlay = import ./buildPlugin.nix { inherit pluginInputs; };
}
