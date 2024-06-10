{ config, pkgs, lib, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    # should be set if provider is manual
    latitude = 50.08804;
    longitude = 14.42076;
    # duskTime = "14:35-20:15";
    # dawnTime = "6:00-7:45";
  };
}
