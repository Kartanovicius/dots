{ default, config, pkgs, lib, ... }:

let
  theme = import ./themes/smooth.nix { };
in
{
   wayland.windowManager.hyprland = {
     enable = true;
     package = pkgs.hyprland;
     systemd.enable = true;
     settings = default.gui.hypr;
   };
  programs.hyprlock = {
    enable = true;
    settings = default.gui.lock;
  };
}
