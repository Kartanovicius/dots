#Labukas
{ config, pkgs, lib, ... }:

{
  environment = {
    sessionVariables = {
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      GPG_TTY = "$TTY";
      MOZ_ENABLE_WAYLAND = "1";
      TERMCMD = "kitty";
      TERM = "kitty";
      XDG_CONFIG_HOME = "$HOME/.config";
      WALLPAPER = "~/Pictures/wallpaper/w1.jpg";
      LIBSEAT_BACKEND = "logind";
    };
    shells = with pkgs; [ zsh ];
  };
}
