{ config, pkgs, lib, ... }:
{
    services = {
        xserver = {
            enable = true;
            
            layout = "us";
            xkbVariant = "";
      
            windowManager = {
                qtile = {
                    enable = true;
                };
            };

            displayManager = {
                lightdm = {
                    enable = true;
                    background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath;
                    greeters = {
                        gtk = {
                            theme = {
                                name = "Nord";
                                package = pkgs.nordic;
                            };
                            cursorTheme = {
                                name = "Nord Cursor";
                                package = pkgs.nordic;
                                size = 20;
                            };
                        };
                    };
                };
                defaultSession = "none+qtile";
            };
        };

        picom.enable = true;
    };

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        feh
        alacritty
        htop
        brightnessctl
        rofi
    ];
}
