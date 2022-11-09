{ pkgs }:

let
  bobthefish = {
    name = "theme-bobthefish";
    src = pkgs.fetchFromGitHub {
      owner = "oh-my-fish";
      repo = "theme-bobthefish";
      rev = "2dcfcab653ae69ae95ab57217fe64c97ae05d8de";
      sha256 = "118hj100c4bb8hyhr22mrsjhg97pyd24cwb1l39bhryd0k9yc5lc";
    };
  };

in
{
  theme = bobthefish;
  prompt = builtins.readFile "${bobthefish.src.out}/functions/fish_prompt.fish";
}
