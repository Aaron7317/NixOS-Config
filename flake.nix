{
    description = "A Flake for managing the entire nixos configuration";

    inputs = {
        # Nixpkgs unstable branch
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
        # Home manager
        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Nixos Hardware Optimizations
        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };
    };

    outputs = inputs @ { self, nixpkgs, home-manager, nixos-hardware, ... }:
        let
            user = "aaron";
            location = "$HOME/.flake";
        in {
            nixosConfigurations = (
                import ./hosts {
                    inherit (nixpkgs) lib;
                    inherit inputs nixpkgs home-manager nixos-hardware user location;
                }
            );
        };
}
