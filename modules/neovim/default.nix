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

                # LSP
                rnix-lsp
                sumneko-lua-language-server
                ccls
                python311Packages.python-lsp-server
	        ];
        };
    };
}
