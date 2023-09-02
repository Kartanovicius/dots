{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      /home/donatask/Yogurt/nixos/packages.nix
      /home/donatask/Yogurt/nixos/accelerator.nix
      /home/donatask/Yogurt/nixos/zsh.nix
      /home/donatask/Yogurt/nixos/environments.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  #Enables flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the GNOME Desktop Environment. Change values to True for enabling gnome
  # services.xserver.desktopManager.gnome.enable = false;
  # services.gnome.gnome-keyring.enable = true;
  # services.xserver.displayManager.sessionCommands = ''
  #   ${lib.getBin pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
  # '';
  # services.xserver.displayManager.defaultSession = "hyprland";


  services = {
    xserver = {
      enable = true;
      layout = "us"; # keyboard layout
      videoDrivers = ["nvidia"];
      excludePackages = with pkgs; [ xterm ];
      # Enable GDM
      displayManager = {
        lightdm.enable = false;
        defaultSession = "hyprland";
        gdm = {
          enable = true;
          debug = true;
          wayland = true;
        };
        sessionCommands = ''
          ${lib.getBin pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
          ${lib.getBin pkgs.dbus}/bin/dbus-update-activation-environment --systemd DISPLAY
          eval $(ssh-agent)
          eval $(gnome-keyring-daemon --start)
        '';
      };
      desktopManager = {
        gnome.enable = false;
        xterm.enable = false;
      };
      # Enable TouchInputs
      libinput.enable = true;
    };
    dbus.enable = true;
    gnome = {
      # gnome-remote-desktop.enable = true;
      gnome-keyring.enable = true;
      sushi.enable = true;
      # gnome-user-share.enable = true;
      # core-shell.enable = true;
    };
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk 
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  # Swaylock  
  security.pam.services.swaylock = {};
  security.pam.services.swaylock.fprintAuth = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.donatask = {
      isNormalUser = true;
      description = "Donatas Kartanovicius";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    defaultUserShell = pkgs.zsh;
  };

  # VirtualBox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
  #virtualisation.virtualbox.guest.enable = true;
  #users.extraGroups.vboxusers.members = [ "donatask" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.stateVersion = "23.05"; # Did you read the comment?
}