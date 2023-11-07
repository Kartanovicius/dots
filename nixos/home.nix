{ config, pkgs, lib, ... }:

{
  targets.genericLinux.enable = true;
  imports =
    [
      ./apps/kitty.nix
      ./apps/chromium.nix
      ./apps/spicetify.nix
      ./apps/git
      ./apps/rofi
      ./apps/zsh
    ];
  home.stateVersion = "23.05";
}
