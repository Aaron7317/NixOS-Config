{ config, lib, pkgs, inputs, user, location, ... }:

{
    imports = [
        ../modules/qtile
    ];

    # Main user
    users.users.${user} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "kvm" "libvirtd" "input"];
    };

    networking = {
        hostName = "aaron";
        networkmanager.enable = true;
    };

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment
    #services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Fonts to be installed
    fonts.fonts = with pkgs; [
        fantasque-sans-mono
        nerdfonts
        corefonts
    ];

    # Environment settings
    environment = {
        variables = {
            TERMINAL = "alacritty";
            EDITOR = "nvim";
            VISUAL = "nvim";
        };
        systemPackages = with pkgs; [
            killall
            vim
            pciutils
            usbutils
            wget
        ];
    };

    nix = {
        settings = {
            auto-optimise-store = true;
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 4d";
        };
        #package = pkgs.nixVersions.unstable;
        registry.nixpkgs.flake = inputs.nixpkgs;
        extraOptions = ''
            experimental-features = nix-command flakes
            keep-outputs          = true
            keep-derivations      = true
        '';
    };

    # Allow unfree software
    #nixpkgs.config.allowUnfree = true;
    #nixpkgs.config.segger-jlink.acceptLicense = true;

    # System info
    system = {
        autoUpgrade = {                         # Allow auto update (not useful in flakes)
        enable = true;
            channel = "https://nixos.org/channels/nixos-unstable";
        };
        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        stateVersion = "22.11"; # Did you read the comment?
    };
}
