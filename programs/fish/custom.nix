{ pkgs }:

let
  bobthefish = {
    name = "theme-bobthefish";
    src = pkgs.fetchFromGitHub {
      owner = "oh-my-fish";
      repo = "theme-bobthefish";
      rev = "f3ec01dd10f7311821302b4747d82fceb7c15587";
      sha256 = "0kpivdnynmkb9h824lh1z4djsjniaqdwfv0mjjia2rbpzvn8pca1";
    };
  };
in
{
  theme = bobthefish;
  prompt = builtins.readFile "${bobthefish.src.out}/fish_prompt.fish";
}
