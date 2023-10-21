#Labukas
{ config, pkgs, lib, ... }:

{
  imports = [
    ./app/waybar.nix
    ./app/chromium.nix
  ];

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
    chromium
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
    tig
    # System information
    htop
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
    fzf
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
    # Rofi
    rofi-power-menu
    rofi-bluetooth
    buku # TODO: add gitlab and jira bookmarks
    # Screen Recording and Capture
    wf-recorder # Screen Recorder
    slurp
    grim
    # Hyprland/Sway
    hyprpaper
    swaylock
    swayidle
    mako # notification daemon
    #kanshi
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
    # ZSH plugins
    thefuck
    zsh-autosuggestions
    zsh-history
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
    xdg-desktop-portal-hyprland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    # LSP
    nixpkgs-fmt
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
    "nodejs-16.20.2"
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        hidpi = true;
        enable = true;
      };
    };
  };

  # nixpkgs.overlays = [
  #  (self: super: {
  #    polkit = super.polkit.overrideAttrs (oldAttrs: {
  #    patches = oldAttrs.patches ++ [
  #      (super.fetchpatch {
  #        url = "https://gitlab.freedesktop.org/polkit/polkit/-/commit/716a273ce0af467968057f3e107156182bd290b0.patch";
  #        sha256 = "sha256-hOJJhUmxXm87W1ZU9Y1NJ8GCyKvPjbIVtCHlhRGlN8k=";
  #      })];
  #    });
  #  })
  # ];
}
