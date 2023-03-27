

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

    hardware = {
            opengl = {
                enable = true;

                # Enable 32 bit application support
                driSupport32Bit = true;

		        extraPackages = [
                    #pkgs.mesa.drivers
		        ];
		        extraPackages32 = [
                    #pkgs.pkgsi686Linux.mesa.drivers
		        ];
            };
    };


    # Virtualisation Config
    virtualisation.libvirtd.enable = true;
    boot = {
        kernelModules = [ "kvm-intel" ];
    };

    time.timeZone = "America/Denver";
}
