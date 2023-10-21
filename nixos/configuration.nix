{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{
  imports =
    [
      (import "${home-manager}/nixos")
      ./accelerator.nix
      ./zsh.nix
      ./environments.nix
      ./polkit.nix
      ./pkgs/packages.nix
    ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.donatask = import ./home.nix;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

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

  services = {
    xserver = {
      enable = true;
      layout = "us"; # keyboard layout
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
      enable = false;
      wlr.enable = false;
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
  security.pam.services.swaylock = { };
  security.pam.services.swaylock.fprintAuth = false;

  # VirtualBox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
  #virtualisation.virtualbox.guest.enable = true;
  #users.extraGroups.vboxusers.members = [ "donatask" ];
}
