{
  description = "Home Manager configuration of edvmorango";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    username = "edvmorango";
    pkgs = import nixpkgs {inherit system;};
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify the path to your home configuration here
      #configuration = import./home.nix;

      modules = [./home.nix];
      #homeDirectory = "/home/${ username}";
      # Update the state version as needed.
      # See the changelog here:
      # https://nix-community.github.io/home-manager/release-notes.html#sec-release-21.05
      #stateVersion = "22.05";

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}
