#Labukas
{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./aliases/default.nix
      ./aliases/git.nix
      ./aliases/pricefx.nix
    ];

  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" "rbw" "vscode" "yarn" ];
      theme = "josh";
    };
  };
}
