{ default, pkgs, lib, ... }:

with lib; let
  waybar_config = import ./config.nix { };
  waybar_style = import ./style.nix { inherit default; };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = waybar_style;
    settings = waybar_config;
  };
}

