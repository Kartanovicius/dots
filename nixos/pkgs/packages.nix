#Labukas
{ config, pkgs, lib, ... }:

{
  # Fonts
  fonts.packages = with pkgs;
    [
      nerdfonts
      jetbrains-mono
      font-awesome
      siji
      noto-fonts-emoji
    ];

  #Packages
  environment.systemPackages = with pkgs; [
    home-manager
    # Browsers
    brave
    google-chrome
    # Media
    spotify
    vlc
    # GUI Apps
    libsForQt5.kcalc
    gparted
    meld
    etcher
    libreoffice
    kanshi
    pcmanfm
    # CLI Apps
    ranger
    imagemagick
    zip
    unzip
    # Terminal
    kitty
    # Terminal video libs
    ffmpegthumbnailer
    ffmpeg
    # Shell
    jq
    wget
    tmux
    curl
    wl-clipboard
    meson
    # Dev
    nodejs_18
    yarn
    bun
    git
    tig
    lazygit
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript-language-server
    typescript
    sdkmanager
    # System information
    htop
    btop
    libnotify
    toybox
    hwinfo
    pavucontrol
    helvum
    # System
    dconf
    xorg.xbacklight
    brightnessctl
    lm_sensors
    qrencode
    chromedriver
    bluez
    # IDE
    vscode
    neovim
    jetbrains.idea-community
    jetbrains-toolbox
    lapce
    android-studio
    # Messengers
    tdesktop
    # Screen Recording and Capture
    wf-recorder
    slurp
    grim
    # Hyprland/Sway
    hyprpaper
    swaylock
    swayidle
    swaybg
    mako # notification daemon
    xwayland
    glib
    xdg-utils
    wdisplays
    hyprpicker # Color Picker
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    eww-wayland
    # Gnome dark-theme
    gnome3.adwaita-icon-theme
    dracula-theme
    # Keyring and Polkit
    libgnome-keyring
    gnome.libgnome-keyring
    gnome.gnome-keyring
    gnome.seahorse
    # packagekit
    lxde.lxsession
    # New
    hyprland-protocols
    xdg-utils
    # LSP
    nixpkgs-fmt
    # River WM
    river
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "electron-19.1.9"
    "nodejs-18.18.2"
    "nodejs-16.20.2"
    "nodejs-16.20.0"
  ];

  programs.htop = {
    enable = true;
    settings.show_cpu_temperature = 1;
  };
}
