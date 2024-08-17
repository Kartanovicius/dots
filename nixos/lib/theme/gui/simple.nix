{}: {
  hypr = {
    decoration = {
      shadow_offset = "0 5";
      "col.shadow" = "rgba(00000099)";
    };

    "$mod" = "SUPER";

    bind = [
      # Base
      "SUPER, Return, exec, kitty"
      "SUPER, E, exec, kitty ranger"
      "SUPER, W, exec, rofi-network-manager"
      "SUPER, Q, killactive"
      "SUPER CTRL, L, exec, swaylock -c 000000"
      # Screenshots
      ",Print, exec, grim - | wl-copy && notify-send 'Fullscreen Screenshot Taken'"
      "SHIFT, Print, exec, grim -g '$(slurp)' - | wl-copy && notify-send 'Selected Area Screenshot Taken'"
      "SHIFT CTRL, Print, exec, grim -g '$(slurp)' ~/'Pictures'/'$(date +%Y%m%d-%H%M%S)'.png && notify-send 'screenshot taken & saved'"
      # rofi
      "SUPER, Escape, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
      "SUPER, D, exec, rofi -modi 'drun,run' -show drun -sidebar-mode"
      # Switch workspaces with mainMod + [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"
      # Volume
      ",XF86AudioMute, exec, amixer set Master toggle"
      ",XF86AudioRaiseVolume, exec, amixer set Master 5%+"
      ",XF86AudioLowerVolume, exec, amixer set Master 5%-"
      "CTRL ,XF86AudioRaiseVolume, exec, amixer set Master 1%+"
      "CTRL ,XF86AudioLowerVolume, exec, amixer set Master 1%-"
      ",XF86AudioMicMute, exec, amixer set Capture toggle"
      # Brightness
      ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      "CTRL ,XF86MonBrightnessUp, exec, brightnessctl set +1%"
      "CTRL ,XF86MonBrightnessDown, exec, brightnessctl set 1%-"

    ];

    bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];

    monitor = [
      "eDP-1,1920x1200,300x1440,1"
      "DP-1,2560x1440,0x0,1"
      "DP-2,2560x1440,0x0,1"
    ];

    preload = [ "~/Pictures/wallpaper/w1.jpg" ];

    wallpaper = [
      "eDP-1,~/Pictures/wallpaper/w1.jpg"
      "DP-2,~/Pictures/wallpaper/w1.jpg"
    ];

    general = {
      gaps_in = 0;
      gaps_out = 7;
      border_size = 5;
      col.active_border = "rgba(6B998Eee) rgba(B62E18ee) 45deg";
      col.inactive_border = "rgba(595959aa)";
      layout = "dwindle";
    };

    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, default"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 0, 2, default"
        "workspaces, 1, 5, default"
      ];
    };
  };
  lock =
    {
      background = [
        {
          path = "~/Pictures/wallpaper/w1.jpg";
          blur_passes = 2;
          contrast = 0.8916;
          brightness = 0.7172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0;
        }
      ];

      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      label = [
        # Time HR
        {
          text = ''
            cmd[update:1000] echo "$(date +"%H")"
          '';
          color = "rgba(255, 255, 255, 1)";
          shadow_pass = 2;
          shadow_size = 3;
          shadow_color = "rgb(0, 0,0)";
          shadow_boost = 1.2;
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -250";
          halign = "center";
          valign = "top";
        }
        # Time MIN
        {
          text = ''
            cmd[update:1000] echo "$(date +"%M")"
          '';
          color = "rgba(255, 255, 255, 1)";
          shadow_pass = 2;
          shadow_size = 3;
          shadow_color = "rgb(0, 0,0)";
          shadow_boost = 1.2;
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -420";
          halign = "center";
          valign = "top";
        }
        # Day-Month-Date
        {
          text = ''
            cmd[update:1000] echo -e "$(date +"%d %b %A")"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
        # USER
        # {
        #   text = "    $USER";
        #   color = "rgba(216, 222, 233, 0.80)";
        #   font_size = 16;
        #   font_family = "JetBrains Mono Nerd";
        #   position = "275, -140";
        #   halign = "left";
        #   valign = "center";
        # }
        # Music
        {
          text = ''
            cmd[update:1000] echo "$(~/Pukis/nixos/scripts/songdetail.sh)"
          '';
          color = "rgba(255, 255, 255, 1)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd";
          position = "0, -350";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          size = "250, 60";
          rounding = 6;
          outline_thickness = 0;
          outer_color = "rgba(248, 249, 250, 0.2)";
          dots_size = 0.1; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 1; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          inner_color = "rgba(29, 32, 38, 0.5)";
          font_color = "rgba(248, 249, 250, 1)";
          fade_on_empty = false;
          font_family = "JetBrains Mono Nerd Font Mono";
          placeholder_text = ''
            <span foreground="##FFFFFF">   $USER</span>
          '';
          hide_input = false;
          position = "0, -470";
          halign = "center";
          valign = "center";
          zindex = 10;
        }
      ];
    };
  waybar_config = {
    mainBar = {
      layer = "top";
      position = "bottom";
      margin-top = 0;
      margin-left = 0;
      margin-right = 0;
      margin-bottom = 0;
      height = 25;
      # start_hidden = true;
      # mode = "overlay";
      reload_style_on_change = true;
      modules-left = [
        "river/tags"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        # "memory"
        # "cpu"
        "battery"
        # "backlight#icon"
        "pulseaudio#microphone"
        "pulseaudio"
        "network"
      ];
      clock = {
        format = "{:%H:%M - %A, %e %B %Y}";
        format-alt = "{:%e %b %Y %H:%M}";
        interval = 10;
        tooltip-format = "{:%e %B %Y}";
      };
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
      network = {
        format = "{ifname}";
        format-wifi = "{icon}";
        format-ethernet = "";
        format-disconnected = "睊";
        tooltip-format = "{essid}";
        on-click = "kitty nmtui";
        format-icons = [ "󰤯" "󰤟" "󰤢" "󰤢" "󰤨" ];
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
        # format-source = " {volume}%";
        format-source = "";
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
      "river/tags" = {
        num-tags = 5;
        tag-labels = [ "1" "2" "3" "4" "5" ];
      };
    };
  };
  waybar_style = ''
    @define-color foreground #ffffff;
    @define-color accent #6fd07c;
    @define-color accent_hover #43a55a;
    @define-color background #0d0d0d;
    @define-color background_light #333333;
    @define-color background_lighter #4d4d4d;
    @define-color critical #EF5350;
    @define-color gradient1 #6ed17b;
    @define-color gradient2 #59bb6c;

    * {
        border: none;
        border-radius: 0;
        font-family: proportional_font, monospace_alt_font;
        font-size: 13px;
        min-height: 0;
        transition: 0s;
    }

    window#waybar {
        background: @background;
        border-radius: 15px 15px 0px 0px;
    }

    tooltip {
      background: @background;
      border-radius: 13px;
      font-family: proportional_font;
    }

    tooltip label {
      color: white;
      font-family: proportional_font;
    }

    #custom-updates,
    #custom-sync,
    #network,
    #bluetooth,
    #backlight,
    #pulseaudio,
    #memory{
        background: transparent;
        color: @accent;
        margin: 6px;
        margin-bottom: 7px;
    }

    #workspaces{
        margin-right: 9px
    }

    #workspaces button {
        background: transparent;
        color: white;
        margin: 6px 0px 6px 0px;
        padding: 3px 3px 3px 3px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #workspaces button:hover {
        background: @accent_hover;
        color: black;
        margin: 6px 0px 6px 0px;
        padding: 3px 3px 3px 3px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #workspaces button.active {
        background: linear-gradient(to right, @gradient1, @gradient2);
        color: black; 
        margin: 6px 0px 6px 0px;
        padding: 3px 3px 3px 3px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #workspaces button.urgent {
        background: @critical;
        color: black; 
        margin: 6px 0px 6px 0px;
        padding: 3px 3px 3px 3px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #clock {
        background: linear-gradient(to right, @gradient1, @gradient2);
        color: @background;
        margin: 6px;
        margin-left: 9px;
        margin-right: 0px;
        padding: 3px 8px 3px 8px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #clock:hover {
        background: @accent_hover;
        margin: 6px;
        margin-left: 9px;
        margin-right: 0px;
        padding: 3px 8px 3px 8px;
    }

    #battery {
        background: transparent;
        color: @accent;
        margin: 6px;
        margin-bottom: 7px;
        transition: 0.3s;
    }

    #battery.charging {
        background: linear-gradient(to right, @gradient1, @gradient2);
        color: @background;
        margin: 6px 0px 6px 0px;
        padding: 3px 7px 3px 7px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #disk {
        background: transparent;
        color: @accent;
        margin-top: 6px;
        margin-bottom: 7px;
        margin-left: 10px;
    }

    #cpu{
        background: transparent;
        color: @accent;
        margin-top: 6px;
        margin-bottom: 7px;
    }

    #temperature.cpu {
        background: transparent;
        color: @accent;
        margin-top: 6px;
        margin-bottom: 7px;
        margin-left: 1px;
    }

    #temperature.cpu.critical{
        background: @critical;
        color: @background;
        border-radius: 8px;
        margin-top: 6px;
        margin-bottom: 7px;
        margin-left: 1px;
        padding: 3px 5px 3px 5px;
    }

    #tray {
        background: @background_light;
        margin: 6px 0px 6px 0px;
        padding: 3px 7px 3px 7px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #tray:hover {
        background: @background_lighter;
        margin: 6px 0px 6px 0px;
        padding: 3px 7px 3px 7px;
        border-radius: 8px;
        transition: 0.3s;
    }

    #tray menu {
        color: @accent;
        background: @background;
        border-radius: 8px;
        transition: 0.3s;
    }

    #window {
        background-color: @background_light;
        margin: 6px 0px 6px 0px;
        padding: 3px 7px 3px 7px;
        border-radius: 8px;
        transition: 0.3s;
    }

    /* make window module transparent when no windows present */
    window#waybar.empty #window {
        background-color: transparent;
    }

    /*
    #temperature.disk {
        background: @background;
        color: @accent;
        margin-top: 6px;
        margin-bottom: 7px;
        margin-left: 1px;
    }

    #temperature.disk.critical{
        background: @critical;
        color: @background;
        border-radius: 8px;
        margin-top: 6px;
        margin-bottom: 7px;
        margin-left: 1px;
        padding: 3 5 3 5px;
    }
    */
  '';
}

