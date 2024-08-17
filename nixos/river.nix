{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (river.overrideAttrs (prevAttrs: rec {
      postInstall =
        let
          riverSession = ''
            [Desktop Entry]
            Name=River
            Comment=Dynamic Wayland compositor
            Exec=river
            Type=Application
          '';
        in
        ''
          mkdir -p $out/share/wayland-sessions
          echo "${riverSession}" > $out/share/wayland-sessions/river.desktop
        '';
      passthru.providedSessions = [ "river" ];
    }))
  ];

  services.displayManager.sessionPackages = [
    (pkgs.river.overrideAttrs
      (prevAttrs: rec {
        postInstall =
          let
            riverSession = ''
              [Desktop Entry]
              Name=River
              Comment=Dynamic Wayland compositor
              Exec=river
              Type=Application
            '';
          in
          ''
            mkdir -p $out/share/wayland-sessions
            echo "${riverSession}" > $out/share/wayland-sessions/river.desktop
          '';
        passthru.providedSessions = [ "river" ];
      })
    )
  ];
}
