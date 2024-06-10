{ pkgs, lib, ... }:
let
  spicetify-nix = builtins.getFlake "github:MichaelPachec0/spicetify-nix/e82a3a5597af46a0fbf2bbb18b6aa7fbf7125fac";
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.Ziro;
      colorScheme = "gray-dark";

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        adblock
      ];
    };
}
