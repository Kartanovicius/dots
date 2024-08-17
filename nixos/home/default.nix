{ config, pkgs, lib, ... }:

{
  targets.genericLinux.enable = true;
  imports =
    [
      ./kitty
      ./chromium
      # ./spicetify
      ./git
      ./rofi
      ./zsh
      ./waybar
      ./gammastep
      ./kanshi
      ./zoxide
      ./gtk
      ./firefox
      ./starship
      ./hypr
      # ./eclipse
      # ./vscode
      # ./nvim
      ../lib
    ];
  home.stateVersion = "24.05";
}
