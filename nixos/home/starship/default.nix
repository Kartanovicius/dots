{ config, pkgs, lib, ... }:

# Advanced version of cd
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
