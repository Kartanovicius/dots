{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in
{
  imports =
    [
      (import "${home-manager}/nixos")
      ./accelerator.nix
      ./environments.nix
      ./polkit.nix
      ./pkgs/packages.nix
      ./lib
    ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.donatask = import ./home;
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
      libinput.enable = true;
      # desktopManager.gnome.enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
          debug = true;
        };
      };
    };
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    gnome = {
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
  };
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    wlr = {
      enable = true;
    };
  };
  xdg.portal.config.common.default = "wlr";
  # xdg.portal.wlr.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  security.pam.services.gdm.enableGnomeKeyring = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Swaylock  
  security.pam.services.swaylock = { };
  security.pam.services.swaylock.fprintAuth = false;

  # VirtualBox
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # users.extraGroups.vboxusers.members = [ "donatask" ];
}
