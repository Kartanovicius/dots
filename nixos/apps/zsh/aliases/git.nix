#Labukas
{ config, pkgs, lib, ... }:

{
  programs.zsh.shellAliases = {
    gg = "git status";
    co = "git checkout";
    cob = "git checkout -b";
    undo = "git reset HEAD~1 --mixed";
  };
}
