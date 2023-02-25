

{ config, pkgs, user, ... }:

{
    imports =
        [(import ./hardware-configuration.nix)];

    boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        
        
        loader = {
            systemd-boot = {
                enable = true;
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi";
            };
        };
    };

    hardware.opengl.extraPackages = [
        pkgs.mesa.drivers
    ];
}
