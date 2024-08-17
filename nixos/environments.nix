{ config, pkgs, lib, ... }:

{

  systemd.services.keyring-deamon = {
    script = ''
      echo "gnome keyring deamon"
      eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh);
      export SSH_AUTH_SOCK;
    '';
    wantedBy = [ "multi-user.target" ];
  };

  environment = {
    sessionVariables = {
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      GPG_TTY = "$TTY";
      MOZ_ENABLE_WAYLAND = "1";
      TERMCMD = "kitty";
      TERM = "kitty";
      XDG_CONFIG_HOME = "$HOME/.config";
      LIBSEAT_BACKEND = "logind";
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };
    shells = with pkgs; [ zsh ];
  };
}
