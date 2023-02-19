{ config, pkgs, lib, ... }:
{
    services = {
        xserver = {
            enable = true;

            videoDrivers = [ "modesetting" ];
            
            layout = "us";
            xkbVariant = "";
      
            windowManager = {
                qtile = {
                    enable = true;
                };
            };

            displayManager = {                          # Display Manager
                lightdm = {
                    enable = true;                          # Wallpaper and GTK theme
                    background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath;
                    greeters = {
                        gtk = {
                            theme = {
                                name = "nordic";
                                package = pkgs.nordic;
                            };
                            cursorTheme = {
                                name = "nordic";
                                package = pkgs.nordic;
                                size = 16;
                            };
                        };
                    };
                };
                defaultSession = "none+qtile";
            };

        };

        picom = {
            enable = true;
            fade = true;
            fadeDelta = 4;
            vSync = true;
        };
    };

#programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        feh
        alacritty
        htop
        brightnessctl
        rofi
        conky
    ];
}
