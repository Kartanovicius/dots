#Labukas
{config, pkgs, lib, ... }:

{
  # Fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    jetbrains-mono
    font-awesome
    siji
    noto-fonts-emoji
  ];  

  #Packages
  environment.systemPackages = with pkgs; [
    # Browsers
    chromium
    firefox
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
    postman
    git
    tig
    # System information
    htop
    libnotify
    glxinfo
    ncdu
    toybox
    # System
    dconf
    xorg.xbacklight
    brightnessctl
    lm_sensors
    polkit_gnome
    pinentry # Password prompt for rofi-rbw
    wtype # Required by rofi-rbw
    fzf
    # IDE
    vscode
    neovim
    # Messengers
    tdesktop
    # Password keeper
    rbw
    # Rofi
    rofi-power-menu
    rofi-wayland
    rofi-bluetooth
    buku # TODO: add gitlab and jira bookmarks
    rofi-rbw
    # Screen Recording and Capture
    wf-recorder # Screen Recorder
    slurp
    grim
    # Hyprland/Sway
    waybar
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
    # Gnome dark-theme
    gnome3.adwaita-icon-theme
    dracula-theme
    #graphite-gtk-theme
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
    # New
    nvidia-vaapi-driver
    hyprland-protocols
    xdg-desktop-portal-hyprland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
    "nodejs-16.20.2"
  ];

  programs = {
    hyprland = {
      enable = true;
      nvidiaPatches = true;
      xwayland = {
        hidpi = true;
        enable = true;
      };
    };
    waybar.package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  []) ++ [ "-Dexperimental=true" ];
      patches = (oa.patches or []) ++ [
        (pkgs.fetchpatch {
          name = "fix waybar hyprctl";
          url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
          sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
        })
      ];
    });

    chromium = {
      enable = true;
      extensions = [
        "gighmmpiobklfepjocnamgkkbiglidom" # Adblock
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "hjdoplcnndgiblooccencgcggcoihigg" # Terms of Service; Didn’t Read
        "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
        "fngmhnnpilhplaeedifhccceomclgfbg" # EditThisCookie
        "nngceckbapebfimnlniiiahkandclblb" # KeePassXC-Browser
        "fploionmjgeclbkemipmkogoaohcdbig" # Page load time
        "oldceeleldhonbafppcapldpdifcinji" # LT Grammar
        "mbniclmhobmnbdlbpiphghaielnnpgdp" # Lightshot screenshot
      ];
    };
  };

  #nixpkgs.overlays = [
  #  (self: super: {
  #    polkit = super.polkit.overrideAttrs (oldAttrs: {
  #    patches = oldAttrs.patches ++ [
  #      (super.fetchpatch {
  #        url = "https://gitlab.freedesktop.org/polkit/polkit/-/commit/716a273ce0af467968057f3e107156182bd290b0.patch";
  #        sha256 = "sha256-hOJJhUmxXm87W1ZU9Y1NJ8GCyKvPjbIVtCHlhRGlN8k=";
  #      })];
  #    });
  #  })
  #];
}
