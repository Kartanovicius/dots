#Labukas
{ config, pkgs, lib, ... }:

{
  #Fix for hyprland
  programs.waybar = {
    enable = true;
  };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

}
