{ config, pkgs, lib, ... }:

let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
  gdk = pkgs.google-cloud-sdk.withExtraComponents (with pkgs.google-cloud-sdk.components; [
    gke-gcloud-auth-plugin
  ]);
in
{
  # Fonts
  fonts.packages = with pkgs;
    [
      nerdfonts
      jetbrains-mono
      font-awesome
      siji
      noto-fonts-emoji
      fantasque-sans-mono
      fira-code
    ];

  #Packages
  environment.systemPackages = with pkgs; [
    home-manager
    # Browsers
    google-chrome
    brave
    ungoogled-chromium
    # Media
    spotify
    vlc
    # GUI Apps
    gnome.gnome-calculator
    # gparted
    meld
    libreoffice
    kanshi
    pcmanfm
    inkscape-with-extensions
    unstable.logseq
    unstable.remmina
    drawing
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
    unstable.bun
    git
    tig
    lazygit
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript-language-server
    typescript
    gitlab-runner
    docker
    temurin-jre-bin-21
    maven
    php
    gdk
    google-cloud-sdk
    postgresql
    # System information
    htop
    btop
    libnotify
    toybox
    hwinfo
    fastfetch
    # Settings
    pavucontrol
    # System
    dconf
    xorg.xbacklight
    brightnessctl
    lm_sensors
    qrencode
    chromedriver
    bluez
    # IDE
    unstable.vscode
    neovim
    jetbrains-toolbox
    insomnia
    # android-studio
    # Messengers
    tdesktop
    unstable.signal-desktop
    # Screen Recording and Capture
    wf-recorder
    slurp
    grim
    swappy
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
    wl-color-picker # Color Picker
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    # eww
    playerctl
    # Customizations
    bibata-cursors
    papirus-icon-theme
    dracula-theme
    # Keyring and Polkit
    libgnome-keyring
    gnome.libgnome-keyring
    gnome.gnome-keyring
    gnome.seahorse
    keepassxc
    polkit
    lxde.lxsession
    # New
    hyprland-protocols
    xdg-utils
    # LSP
    nixpkgs-fmt
    # River WM
    river
    adwaita-qt
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "electron-19.1.9"
    "electron-27.3.11"
    "nodejs-18.18.2"
    "nodejs-16.20.2"
    "nodejs-16.20.0"
  ];

  programs.htop = {
    enable = true;
    settings.show_cpu_temperature = 1;
  };
}
