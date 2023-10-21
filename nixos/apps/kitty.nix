#Labukas
{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 15;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      background_opacity = "1";
    };
    extraConfig = ''
      symbol_map U+E0A0-U+E0A2,U+E0B0-U+E0B3 PowerlineSymbols
    '';
    theme = "Monokai Pro";
    font = {
      name = "JetBrains Mono";
      package = pkgs.jetbrains-mono;
      size = 11;
    };
  };
}
