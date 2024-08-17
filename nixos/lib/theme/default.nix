{ colorlib
, lib
,
}: rec {
  colors = import ./colors.nix;
  # #RRGGBB
  xcolors = lib.mapAttrs (_: colorlib.x) colors;
  # rgba(,,,) colors (css)
  rgbaColors = lib.mapAttrs (_: colorlib.rgba) colors;

  browser = "brave";

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://i.imgur.com/s8MR4o3.jpg";
    sha256 = "sha256:00gf7ainxfiymghyfgj8hwkjfbk2sr49n6mhsh6kjmzvyhkf377i";
  };

  gui = import ./gui/simple.nix { };
}
