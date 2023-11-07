#Labukas
{ config, pkgs, lib, ... }:

{
  environment = {
    sessionVariables = {
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      NIXOS_OZONE_WL = "1";
      GPG_TTY = "$TTY";
      MOZ_ENABLE_WAYLAND = "1";
      TERMCMD = "kitty";
      TERM = "kitty";
      XDG_CONFIG_HOME = "$HOME/.config";
    };
    shells = with pkgs; [ zsh ];
  };
}
