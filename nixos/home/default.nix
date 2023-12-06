{ config, pkgs, lib, ... }:

{
  targets.genericLinux.enable = true;
  imports =
    [
      ./kitty
      ./chromium
      ./spicetify
      ./git
      ./rofi
      ./zsh
      ./waybar
      ./gammastep
      ./kanshi
    ];
  home.stateVersion = "23.05";
}
