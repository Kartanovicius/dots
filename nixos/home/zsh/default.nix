{ config, lib, pkgs, zshPlugins, ... }:

let
  zsh_plugins = import ./zsh_plugins.nix { pkgs = pkgs; };
  configDir = ".config/zsh";
  # p10kTheme = ./config/.p10k.zsh;
  # p10kThemeDir = /home/donatask/Pukis/nixos/home/zsh/config/.p10k.zsh;
in
{
  imports =
    [
      ./aliases/default.nix
      ./aliases/git.nix
      ./aliases/pricefx.nix
    ];
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = configDir;
    autosuggestion.enable = true;
    enableCompletion = true;
    plugins = with zsh_plugins; builtins.trace "++zsh plugin list: ${lib.concatMapStringsSep "," (x: x.name) plugin_list}" (plugin_list);
    oh-my-zsh = {
      enable = true;
      plugins = [
        "yarn"
      ];
    };
    initExtra = ''
      autopair-init
      bindkey '^g' jump
      zle -N jump
      eval "$(zoxide init zsh)"
    '';

  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
