{ config, pkgs, lib, ... }:

# Advanced version of cd
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
