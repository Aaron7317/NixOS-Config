

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
			pkgs.amdvlk
		];

		extraPackages32 = [
			pkgs.driversi686Linux.amdvlk
		];
            };
    };

    environment.variables.AMD_VULKAN_ICD = "RADV";
    
    # Set your time zone
    time.timeZone = "America/Los_Angeles";

}
