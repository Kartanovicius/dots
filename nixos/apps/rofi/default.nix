#Labukas
{ config, pkgs, lib, ... }:

let
  buku-run =
    pkgs.writeShellScriptBin "buku-run" (builtins.readFile ./buku-run);
in
{
  home.packages = with pkgs; [
    rofi-power-menu
    rofi-bluetooth
    buku
    buku-run
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
    ];
    font = "JetBrainsMono Nerd Font 12";
    extraConfig = {
      modes = "window,drun,run,calc,power-menu:rofi-power-menu";
    };
    theme =
      let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; =&gt; foo: "abc";
        #   bar = mkLiteral "abc"; =&gt; bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
        background = "#000000";
        background-alt = "#1f1f1f";
        foreground = "#FFFFFF";
        selected = "#61AFEF";
        active = "#B1E3AD";
        urgent = "#E06C75";
        rad = "4px";
      in
      {
        "configuration" = {
          display-drun = " Apps";
          display-run = " Run";
          display-filebrowser = " Files";
          display-window = " Windows";
          drun-display-format = "{name}";
          window-format = "{w} · {c} · {t}";
          show-icons = true;
          icon-theme = "Reversal-dark";
        };
        "*" = {
          background-color = mkLiteral background;
          text-color = mkLiteral foreground;
          border-colour = mkLiteral selected;
          handle-colour = mkLiteral selected;
          background-colour = mkLiteral background;
          foreground-colour = mkLiteral foreground;
          alternate-background = mkLiteral background-alt;
          normal-background = mkLiteral background;
          normal-foreground = mkLiteral foreground;
          urgent-background = mkLiteral urgent;
          urgent-foreground = mkLiteral background;
          active-background = mkLiteral active;
          active-foreground = mkLiteral background;
          selected-normal-background = mkLiteral selected;
          selected-normal-foreground = mkLiteral background;
          selected-urgent-background = mkLiteral active;
          selected-urgent-foreground = mkLiteral background;
          selected-active-background = mkLiteral urgent;
          selected-active-foreground = mkLiteral background;
          alternate-normal-background = mkLiteral background;
          alternate-normal-foreground = mkLiteral foreground;
          alternate-urgent-background = mkLiteral urgent;
          alternate-urgent-foreground = mkLiteral background;
          alternate-active-background = mkLiteral active;
          alternate-active-foreground = mkLiteral background;
        };
        "window" = {
          /* properties for window widget */
          transparency = "real";
          location = "center";
          anchor = "center";
          fullscreen = false;
          width = mkLiteral "1000px";
          /* properties for all widgets */
          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-radius = mkLiteral "calc((4px * 2))";
          cursor = mkLiteral "default";
        };
        "mainbox" = {
          children = [
            "inputbar"
            "listview"
          ];
          padding = mkLiteral "1.5em";
          spacing = mkLiteral "1em";
        };
        "inputbar" = {
          children = [
            "prompt"
            "entry"
          ];
          border-radius = mkLiteral rad;
          background-color = mkLiteral background-alt;
        };
        "prompt, entry, element selected" = {
          vertical-align = mkLiteral "0.5";
          background-color = mkLiteral background-alt;
        };
        "prompt" = {
          padding = mkLiteral "1%";
        };
        "entry" = {
          blink = false;
          padding = mkLiteral "0 1.5% 0 0";
          placeholder = "Search through apps";
        };
        "listview" = {
          enabled = true;
          lines = 10;
          columns = 1;
          cycle = false;
          dynamic = true;
        };

        "element" = {
          orientation = "horizontal";
          padding = mkLiteral "0.5em";
          border-radius = mkLiteral rad;
          children = [
            "element-icon"
            "element-text"
          ];
          spacing = mkLiteral "0.5em";
        };
        "element-text" = {
          vertical-align = mkLiteral "0.5";
        };
        "element-text, element-icon" = {
          horizontal-align = 0;
          background-color = mkLiteral "inherit";
        };
        "element-icon" = { size = mkLiteral "1.5em"; };
        "listview, element, element selected, element-text, element-icon" = {
          cursor = mkLiteral "pointer";
        };
        "entry" = {
          cursor = mkLiteral "text";
        };
      };
  };
}
