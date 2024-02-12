{ config, pkgs, lib, ... }:

with lib; let
  inherit (config.lib.formats.rasi) mkLiteral;
  rofi_style = import ./style.nix { inherit default mkLiteral; };
  buku-run =
    pkgs.writeShellScriptBin "buku-run" (builtins.readFile ./buku-run);
in
{
  home.packages = with pkgs; [
    rofi-power-menu
    rofi-bluetooth
    buku
    buku-run
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
    ];
    font = "JetBrainsMono Nerd Font 12";
    extraConfig = {
      modi = "drun,emoji,ssh";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      display-drun = " Apps";
      display-window = " Windows";
      display-run = " Run";
      display-filebrowser = " Files";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
      show-icons = true;
      icon-theme = "Reversal-dark";
    };
    theme = rofi_style;
  };
}
