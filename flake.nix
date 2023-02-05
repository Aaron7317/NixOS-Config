{
    description = "A Flake for managing the entire nixos configuration";

    inputs = {
        # Nixpkgs unstable branch
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
        # Home Manager
        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Nixos Hardware Optimizations
        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };

        # Neovim Configuration 
        neovim-config = {
            url = github:Aaron7317/nvim;
            flake = false;
        };

        # Alacritty Configuration
        alacritty-config = {
            url = github:Aaron7317/alacritty;
            flake = false;
        };
    };

    outputs = inputs @ { self, nixpkgs, home-manager, nixos-hardware, neovim-config, alacritty-config, ... }:
        let
            user = "aaron";
            location = "$HOME/.flake";
        in {
            nixosConfigurations = (
                import ./hosts {
                    inherit (nixpkgs) lib;
                    inherit inputs nixpkgs home-manager nixos-hardware neovim-config alacritty-config user location;
                }
            );
        };
}
