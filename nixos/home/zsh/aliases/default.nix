{ config, pkgs, lib, ... }:

{
  programs.zsh.shellAliases = {
    ll = "ls -l";
    nixedit = "nano /etc/nixos/configuration.nix";
    donates = "echo 'Ja jsem Donates :)'";
    node-scripts = "cat package.json | jq .scripts";
    countdown = "node ~/Github/node_modules/console-countdown/lib/CountdownCLI.js";
  };
}
