{
  description = "Home Manager configuration of emilis";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      home = home-manager.lib.homeManagerConfiguration;
    in {
      homeConfigurations = {

        # desktop hm
        "emilis@desktop" = home {
        inherit pkgs;
        configuration = ./desktop.nix;
        };

        # laptop hm
        "emilis@laptop" = home {
        inherit pkgs;
        configuration = ./laptop.nix;
        };

      };
    };
}
