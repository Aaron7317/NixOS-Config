{ config, lib, pkgs, user, neovim-config, alacritty-config, ... }:

{
    imports = [
        ../modules/neovim
        ../modules/alacritty
        #../modules/qtile
    ];


    programs = {
        # Let Home Manager install and manage itself.
        home-manager = {
            enable = true;
        };
    };

    # Allow installation of nonfree software
    nixpkgs.config.allowUnfree = true;

    home = {
        username = "${user}";
        homeDirectory = "/home/${user}";

        packages = with pkgs; [
            alacritty
            brave
            thunderbird
            virt-manager
            qemu
            unzip
            zip
            htop

            # Gaming
            steam
            discord
            lutris
            minetest

            xournalpp

            # Programming
            gcc
            gdb
            cmake
            gnumake
            git

        ];



        stateVersion = "22.11";
    };

    xdg.configFile.nvim = {
        source = neovim-config;
        recursive = true;
    };

    xdg.configFile.alacritty = {
        source = alacritty-config;
        recursive = true;
    };
}
