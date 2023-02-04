{ config, lib, pkgs, user, ... }:

{
    imports = [
        ../modules/neovim
        ../modules/alacritty
    ];

    programs = {
        # Let Home Manager install and manage itself.
        home-manager.enable = true;
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

            # Gaming
            steam
            discord
            lutris

            xournalpp

            # Programming
            gcc
            gdb
            cmake
            gnumake
            git

            # LSP
            rnix-lsp
            sumneko-lua-language-server
            ccls
        ];

        stateVersion = "22.11";
    };
}
