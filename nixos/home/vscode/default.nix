{ config, pkgs, lib, ... }:

let
  user_settings = import ./userSettings.nix { };
in
{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;
    # extensions = with pkgs; [
    #   vscode-extensions.svelte.svelte-vscode # Svelte language support for VS Code
    #   vscode-extensions.formulahendry.auto-close-tag # Automatically add HTML/XML close tag, same as Visual Studio IDE or Sublime Text
    #   vscode-extensions.bbenoist.nix # Nix language support for Visual Studio Code.
    #   vscode-extensions.jnoortheen.nix-ide # Nix language support with formatting and error report.
    #   vscode-extensions.esbenp.prettier-vscode # Code formatter using prettier
    #   vscode-extensions.dart-code.flutter # Flutter support and debugger for Visual Studio Code.
    #   vscode-extensions.dart-code.dart-code # Flutter support and debugger for Visual Studio Code.
    #   vscode-extensions.dbaeumer.vscode-eslint # Integrates ESLint JavaScript into VS Code.
    # ];
    # package = pkgs.vscodium;
    # userSettings = user_settings;
  };
}
