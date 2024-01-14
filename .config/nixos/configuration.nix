# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
	boot.loader {
  		systemd-boot = {
  			enable = true;
			configurationLimit = 5;
    		}
		efi.canTouchEfiVariables = true;
		timeout = 3;
  	}

  networking = {
	hostName = "tonyniiixos";
	iwd.enable = true; 
  }

	environment = {
		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			NIX_PATH = "/home/t0nyandre/projects/dotfiles/nixos";
		}
	}
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  #networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
	enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
	videoDrivers = [ "amdgpu" ];
  };

	nix = {
		settings = {
			experimental-features = [
				"nix-command"
				"flakes"
			];
		};
		optimise.automatic = true;
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		}
	}

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.t0nyandre = {
    isNormalUser = true;
	home = "/home/t0nyandre";
    description = "Tony André Haugen";
    extraGroups = [ "audio" "video" "docker" "wheel" ];
    packages = with pkgs; [
	firefox-wayland
];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  	curl
	git
	file
	gcc
	gnumake
	htop
	tree
	fd
	ripgrep
	fzf
	jq
	zip
	unzip
	python3
	wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
