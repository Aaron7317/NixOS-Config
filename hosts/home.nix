{ config, lib, pkgs, user, dotfiles, ... }:

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
            gimp

            # Gaming
            steam
            discord
            lutris
            minetest
            minetestserver

            xournalpp
            texlive.combined.scheme-full

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
        source = "${dotfiles}/.config/nvim";
        recursive = true;
    };

    xdg.configFile.alacritty = {
        source = "${dotfiles}/.config/alacritty";
        recursive = true;
    };

    xdg.configFile.qtile = {
        source = "${dotfiles}/.config/qtile";
        recursive = true;
    };

    xdg.configFile.conky = {
        source = "${dotfiles}/.config/conky";
        recursive = true;
    };
}
