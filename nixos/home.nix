{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./apps/kitty.nix
      ./apps/rofi.nix
    ];
  home.stateVersion = "23.05";
}
