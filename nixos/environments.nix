#Labukas
{config, pkgs, lib, ... }:

{
  environment = {
    sessionVariables = {
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GTK_USE_PORTAL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      NIXOS_OZONE_WL = "1";
      GPG_TTY = "$TTY";
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
      CLUTTER_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      MOZ_ENABLE_WAYLAND = "1";
      GBM_BACKEND = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_BACKEND = "vulkan";
      SDL_VIDEODRIVER = "wayland";
      LIBGL_ALWAYS_SOFTWARE = "1";
      TERMCMD = "kitty";
      TERM  = "kitty";
    };
    shells = with pkgs; [ zsh ];
  };
}
