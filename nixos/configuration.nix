{ config, pkgs, lib, ... }:

{
  imports =
    [
      /home/donatask/Yogurt/nixos/packages.nix
      /home/donatask/Yogurt/nixos/accelerator.nix
      /home/donatask/Yogurt/nixos/zsh.nix
      /home/donatask/Yogurt/nixos/environments.nix
    ];

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

  # VirtualBox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
  #virtualisation.virtualbox.guest.enable = true;
  #users.extraGroups.vboxusers.members = [ "donatask" ];
}
