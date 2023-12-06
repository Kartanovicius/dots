#Labukas
{ config, pkgs, lib, ... }:

let
  style = ./style.css;
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = style;
    settings = [
      {
        layer = "top";
        position = "top";
        margin-top = 0;
        margin-bottom = 0;
        height = 30;
        modules-left = [
          "river/tags"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "memory"
          "cpu"
          "battery"
          "backlight#icon"
          "pulseaudio"
          "pulseaudio#microphone"
          "network"
        ];
        memory = {
          interval = 5;
          format = "{used:0.1f}G/{total:0.1f}G ";
          on-click = "kitty -e 'htop'";
          states = {
            warning = 70;
            critical = 90;
          };
        };
        cpu = {
          interval = 5;
          format = " {usage}%";
          states = {
            warning = 70;
            critical = 90;
          };
          max-length = 10;
          on-click = "kitty --start-as=fullscreen --title btop sh -c 'btop'";
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
        clock = {
          format = "{: %e %b %Y %H:%M}";
          format-alt = " {: %e %b %Y (%A)}";
          interval = 10;
          tooltip-format = "{: %e %B %Y}";
        };
        network = {
          format = "{ifname}";
          format-wifi = " {icon}";
          format-ethernet = " ";
          format-disconnected = "睊";
          tooltip-format = "{essid}";
          on-click = "kitty nmtui";
          format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤢 " "󰤨 " ];
        };
        "network#vpn" = {
          interface = "tun0";
          format = " ";
          format-disconnected = "⚠  Disconnected";
          tooltip-format = "{ifname}= {ipaddr}/{cidr}";
        };
        pulseaudio = {
          scroll-step = 1;
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon}  {format_source}";
          format-bluetooth-muted = " {icon}  {format_source}";
          format-muted = "婢";
          format-icons = {
            headphone = "";
            hands-free = "וֹ";
            headset = "  ";
            phone = "";
            portable = "";
            car = " ";
            default = [
              ""
            ];
          };
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click = "pamixer --default-source -t";
          on-click-right = "pavucontrol";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        "backlight#icon" = {
          format = "{icon} {percent}%  ";
          format-icons = [
            ""
          ];
          on-scroll-down = "brightnessctl -c backlight set 1%-";
          on-scroll-up = "brightnessctl -c backlight set +1%";
        };
        "custom/keyboard-layout" = {
          exec = "swaymsg -t get_inputs | jq '.[] | select(.identifier == \"1=1=AT_Translated_Set_2_keyboard\") | .xkb_active_layout_name' | tr -d '\"'";
          interval = 30;
          format = "  {}";
          signal = 1;
          tooltip = false;
          on-click = "~/.config/waybar/scripts/change_language.sh 1";
        };
      }
    ];
  };
}

