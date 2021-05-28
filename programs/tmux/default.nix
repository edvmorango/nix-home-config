{ config, pkgs, ... }:

let
  plugins = pkgs.tmuxPlugins;
  cfg = builtins.readFile ./tmux.conf;
in
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    keyMode = "vi";
    terminal = "tmux-256color";
    extraConfig = cfg;
    plugins = with plugins; [
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60'
        '';
      }
    ];
    shortcut = "a";
  };

}
