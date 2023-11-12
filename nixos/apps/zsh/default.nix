{ config, lib, pkgs, zshPlugins, ... }:

let
  zsh_plugins = import ./zsh_plugins.nix { pkgs = pkgs; };
  configDir = ".config/zsh";
  p10kTheme = ./config/.p10k.zsh;
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
    enableAutosuggestions = true;
    enableCompletion = true;
    plugins = with zsh_plugins; builtins.trace "++zsh plugin list: ${lib.concatMapStringsSep "," (x: x.name) plugin_list}" (plugin_list);
    oh-my-zsh = {
      enable = true;
      plugins = [
        "yarn"
      ];
    };
    initExtra = ''
      [[ ! -f ${p10kTheme} ]] || source ${p10kTheme}
      autopair-init
      bindkey '^g' jump
      zle -N jump
    '';

  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
