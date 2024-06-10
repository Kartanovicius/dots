{ config, pkgs, lib, ... }:

let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
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
    unstable.vivaldi
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
    inkscape-with-extensions
    element-desktop
    logseq
    unstable.anydesk
    darktable
    digikam
    steam
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
    jetbrains.idea-community
    jetbrains-toolbox
    android-studio
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
    eww-wayland
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
    "nodejs-18.18.2"
    "nodejs-16.20.2"
    "nodejs-16.20.0"
  ];

  programs.htop = {
    enable = true;
    settings.show_cpu_temperature = 1;
  };
}
