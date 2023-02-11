


{ lib, inputs, nixpkgs, home-manager, neovim-config, alacritty-config, nixos-hardware, user, location, ... }:

let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
in 
{
    framework-laptop = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs user location;
            host = {
                hostName = "aaron";
            };
        };
        modules = [
            ./framework-laptop
            ./configuration.nix 
            nixos-hardware.nixosModules.framework
            
            home-manager.nixosModules.home-manager {
                home-manager.backupFileExtension = ".home-manager-backup";
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                    inherit user neovim-config alacritty-config;
                    host = {
                        hostName = "aaron";
                    };
                };
                home-manager.users.${user} = {
                    imports = [(import ./home.nix)] ++ [(import ./framework-laptop/home.nix)];
                };
            }
        ];
    };
}
