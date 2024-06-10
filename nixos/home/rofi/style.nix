{ default, mkLiteral }:

{
  "*" = {
    border-color = mkLiteral default.xcolors.border;
    handle-color = mkLiteral default.xcolors.primary;
    text-color = mkLiteral default.xcolors.foreground;
    background-color = mkLiteral default.xcolors.background;
    foreground-color = mkLiteral default.xcolors.foreground;
    alternate-background = mkLiteral default.xcolors.foreground;
    normal-background = mkLiteral default.xcolors.background;
    normal-foreground = mkLiteral default.xcolors.foreground;
    urgent-background = mkLiteral default.xcolors.background;
    urgent-foreground = mkLiteral default.xcolors.foreground;
    active-background = mkLiteral default.xcolors.background;
    active-foreground = mkLiteral default.xcolors.foreground;
    selected-normal-background = mkLiteral default.xcolors.backgroundLight1;
    selected-normal-foreground = mkLiteral default.xcolors.foreground;
    selected-urgent-background = mkLiteral default.xcolors.backgroundLight1;
    selected-urgent-foreground = mkLiteral default.xcolors.foreground;
    selected-active-background = mkLiteral default.xcolors.backgroundLight1;
    selected-active-foreground = mkLiteral default.xcolors.foreground;
    alternate-normal-background = mkLiteral default.xcolors.foreground;
    alternate-normal-foreground = mkLiteral default.xcolors.background;
    alternate-urgent-background = mkLiteral default.xcolors.foreground;
    alternate-urgent-foreground = mkLiteral default.xcolors.background;
    alternate-active-background = mkLiteral default.xcolors.foreground;
    alternate-active-foreground = mkLiteral default.xcolors.background;
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
    border = mkLiteral "2px solid";
    border-color = mkLiteral default.xcolors.backgroundLight1;
    border-radius = mkLiteral "7px";
    cursor = mkLiteral "default";
  };
  "mainbox" = {
    children = [
      "inputbar"
      "listview"
    ];
    padding = mkLiteral "0px";
  };
  "inputbar" = {
    children = [
      "prompt"
      "entry"
    ];
    spacing = mkLiteral "0px";
    border = mkLiteral "0px solid";
    border-radius = mkLiteral "0px";
  };
  "prompt, entry" = {
    vertical-align = mkLiteral "0.5";
  };
  "prompt" = {
    padding = mkLiteral "1%";
    background-color = mkLiteral default.xcolors.backgroundLight1;
  };
  "entry" = {
    blink = false;
    padding = mkLiteral "0 1.5% 0 0";
    background-color = mkLiteral default.xcolors.backgroundLight1;
  };
  "listview" = {
    enabled = true;
    lines = 3;
    columns = 5;
    cycle = false;
    dynamic = true;
    layout = mkLiteral "vertical";
  };
  "element" = {
    orientation = mkLiteral "vertical";
    padding = mkLiteral "1em 0.5em 1em 0.5em";
    margin = mkLiteral "0.5em";
    children = [
      "element-icon"
      "element-text"
    ];
    spacing = mkLiteral "0.5em";
    border = mkLiteral "0px solid";
    border-radius = mkLiteral "2px";
    border-color = mkLiteral default.xcolors.border;
  };
  "element selected" = {
    border = mkLiteral "2px solid";
    background-color = mkLiteral default.xcolors.backgroundLight1;
  };
  "element-text" = {
    vertical-align = mkLiteral "0.5";
  };
  "element-text, element-icon" = {
    horizontal-align = mkLiteral "0.5";
    background-color = mkLiteral "inherit";
  };
  "element-icon" = { size = mkLiteral "2.5em"; };
  "listview, element, element selected, element-text, element-icon" = {
    cursor = mkLiteral "pointer";
  };
  "entry" = {
    cursor = mkLiteral "text";
  };
}

