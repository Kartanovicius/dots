#Labukas
{ config, pkgs, lib, ... }:

{
  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
          }
        ];
      };
      docked1 = {
        outputs = [
          {
            criteria = "eDP-1";
            position = "300,1440";
          }
          {
            criteria = "DP-1";
            position = "0,0";
          }
        ];
      };
      docked2 = {
        outputs = [
          {
            criteria = "eDP-1";
            position = "300,1440";
          }
          {
            criteria = "DP-2";
            position = "0,0";
          }
        ];
      };
    };
  };
}
