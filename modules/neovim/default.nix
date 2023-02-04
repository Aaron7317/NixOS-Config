{ pkgs, lib, ... }:

{
    programs = {
        neovim = {
            enable = true;
	    extraPackages = with pkgs; [
            # Clipboard
            xclip

            # Telescope
            ripgrep
            fd
	    ];
        };
    };
}
