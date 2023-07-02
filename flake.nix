{
    description = "A Flake for managing the entire nixos configuration";

    inputs = {
        # Nixpkgs unstable branch
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
        # Home Manager
        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Nixos Hardware Optimizations
        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };

        # Configuration Files (Yes I know I need to find an alternative way of doing this)
        dotfiles = {
            url = github:Aaron7317/dotfiles;
            flake = false;
        };
    };

    outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, dotfiles, ... }:
        let
            user = "aaron";
            location = "$HOME/.flake";
        in {
            nixosConfigurations = (
                import ./hosts {
                    inherit (nixpkgs) lib;
                    inherit inputs nixpkgs nixpkgs-unstable home-manager nixos-hardware dotfiles user location;
                }
            );
        };
}
