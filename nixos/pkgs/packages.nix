#Labukas
{ config, pkgs, lib, ... }:

{
  # Fonts
  fonts.fonts = with pkgs;
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
    nomacs
    # Apps
    libsForQt5.kcalc
    ranger
    gparted
    imagemagick
    meld
    zip
    unzip
    etcher
    logseq
    freetube
    gphoto2
    # Terminal
    kitty
    # Terminal video libs
    ffmpegthumbnailer
    ffmpeg
    # Scripts
    jq
    wget
    tmux
    curl
    wl-clipboard
    # Dev
    yarn
    nodejs_16
    git
    lazygit
    tig
    bun
    # System information
    htop
    btop
    libnotify
    glxinfo
    ncdu
    toybox
    hwinfo
    lbreakouthd
    # System
    dconf
    xorg.xbacklight
    brightnessctl
    lm_sensors
    polkit_gnome
    pinentry # Password prompt for rofi-rbw
    wtype # Required by rofi-rbw
    networkmanagerapplet
    qrencode
    chromedriver
    bluez
    # IDE
    vscode
    neovim
    jetbrains.idea-community
    # Messengers
    tdesktop
    # Screen Recording and Capture
    wf-recorder # Screen Recorder
    slurp
    grim
    # Hyprland/Sway
    hyprpaper
    swaylock
    swayidle
    mako # notification daemon
    kanshi
    xwayland
    glib
    xdg-utils
    wdisplays
    hyprpicker # Color Picker
    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    eww-wayland
    # Gnome dark-theme
    gnome3.adwaita-icon-theme
    dracula-theme
    # Keyring and Polkit
    polkit_gnome
    libgnome-keyring
    gnome.libgnome-keyring
    gnome.gnome-keyring
    gnome.seahorse
    packagekit
    libsForQt5.polkit-kde-agent
    # New
    hyprland-protocols
    xdg-utils
    # LSP
    nixpkgs-fmt
    # River WM
    swaybg
    river
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
    "nodejs-16.20.2"
  ];

  programs.htop = {
    enable = true;
    settings.show_cpu_temperature = 1;
  };
}
