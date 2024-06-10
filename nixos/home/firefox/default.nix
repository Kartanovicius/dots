#Labukas
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin.override
      {
        nativeMessagingHosts = [
          # Gnome shell native connector
          pkgs.gnome-browser-connector
          # Tridactyl native connector
          pkgs.tridactyl-native
        ];
      };
  };
}
