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
      ../lib
    ];
  home.stateVersion = "23.11";
}
