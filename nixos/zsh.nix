#Labukas
{config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    #shellAliases = {
    #  ll = "ls -l";
    #  update = "sudo nixos-rebuild switch";
    #  test = "sudo nixos-rebuild test";
    #  nixedit = "sudo nano /etc/nixos/configuration.nix";
    #};
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" "rbw" "vscode" "yarn" ];
      theme = "josh";
    };
  };
}
