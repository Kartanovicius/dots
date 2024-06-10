{ config, pkgs, lib, ... }:

{
  users.extraGroups.docker.members = [ "donatask" ];
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
