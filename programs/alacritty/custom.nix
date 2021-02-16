{ pkgs, ... }:

pkgs.alacritty.overrideAttrs (
  old: {
    version = "v0.3.3-478-g05307f8";
    src = pkgs.fetchFromGitHub {
      owner = "zenixls2";
      repo = "alacritty";
      rev = "05307f8782ae0c94da5ff7b4bab2d1a51a50a70a";
      sha256 = "1acw7h92k75i9a8svaa8gxyjx57758vx5c237iq5q9i00s0a5ksq";
    };
  }
)
