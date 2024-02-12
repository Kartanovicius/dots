{ config, lib, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    configDir = /home/donatask/Pukis/nixos/home/eww/config;
    package = pkgs.eww-wayland;
  };
}
