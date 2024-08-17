{ config, pkgs, lib, ... }:

{
  users.extraGroups.docker.members = [ "donatask" ];
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      "insecure-registries" = ''["cregistry.pricefx.eu"]'';
      experimental = true;
    };
  };
}
