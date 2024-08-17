{ config, pkgs, lib, ... }:

{
  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            position = "0,0";
          }
        ];
      }
      {
        profile.name = "docked1";
        profile.outputs = [
          {
            criteria = "eDP-1";
            position = "300,1440";
          }
          {
            criteria = "DP-2";
            position = "0,0";
          }
        ];
      }
      {
        profile.name = "docked2";
        profile.outputs = [
          {
            criteria = "eDP-1";
            position = "300,1440";
          }
          {
            criteria = "DP-2";
            position = "0,0";
          }
        ];
      }
      {
        profile.name = "docked3";
        profile.outputs = [
          {
            criteria = "eDP-1";
            position = "300,1440";
          }
          {
            criteria = "DP-7";
            position = "0,0";
          }
        ];
      }
    ];
  };
}
