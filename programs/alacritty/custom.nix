{ pkgs, ... }:

pkgs.alacritty.overrideAttrs (
  old: {
    src = pkgs.fetchFromGitHub {
      owner = "zenixls2";
      repo = "alacritty";
      rev = "3ed043046fc74f288d4c8fa7e4463dc201213500";
      sha256 = "1q5jnhmjxbbx7mq8jzkzkq48kczf52bbg4p2hq82acbkwkha9lfm";
    };
  }
)
