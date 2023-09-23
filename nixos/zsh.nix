#Labukas
{config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      #Defalt
      ll = "ls -l";
      nixedit = "nano /etc/nixos/configuration.nix";
      donates = "echo 'Ja jsem Donates :)'";
      node-scripts = "cat package.json | jq .scripts";
      #git
      gg = "git status";
      co = "git checkout";
      cob = "git checkout -b";
      undo = "git reset HEAD~1 --mixed";
      #Pricefx
      pfx = "cd ~/Pricefx/pricefx-clients-js/";
      pfx-run = ''
        export NODE_OPTIONS=--openssl-legacy-provider;
        tmux new-session -d -s pfx 'pfx-modules && yarn start';
        tmux split-window -h -t pfx 'pfx-sfdc && yarn start';
        tmux select-layout -t pfx tiled;
        tmux attach-session -t pfx;
      '';
      pfx-sfdc = "cd ~/Pricefx/pricefx-clients-js/packages/pricefx-sfdc-canvas";
      pfx-sfdc-run = "yarn --cwd pfx-sfdc start";
      pfx-js = "cd ~/Pricefx/pricefx-clients-js/packages/pricefx-js";
      pfx-module = "cd ~/Pricefx/pricefx-clients-js/packages/pricefx-modules";
      pfx-module-run = "pfx-module; yarn start";
      pfx-sugarcrm = "cd ~/Pricefx/pricefx-clients-js/packages/pricefx-crm-extensions/sugarCRM";
      pfx-create-sugar-crm-zip = ''
        (cd ~/Pricefx/pricefx-clients-js/packages/pricefx-crm-extensions/sugarCRM/source/ && \
        current_version=$(grep -oE "'version' => '[0-9.]+'" manifest.php | grep -oE "[0-9.]+") && \
        new_version=$(echo $current_version | awk -F. '{ $NF = $NF + 1; } 1' | sed 's/ /./g') && \
        sed -i "s/'version' => '$current_version'/'version' => '$new_version'/" manifest.php && \
        cd ~/Pricefx/pricefx-clients-js/packages/pricefx-crm-extensions/sugarCRM/SugarModuleConnector/ && \
        yarn build && \
        cd ~/Pricefx/pricefx-clients-js/packages/pricefx-crm-extensions/sugarCRM/source && \
        zip -r -X pricefx_sugarcrm_module.zip * && \
        cp pricefx_sugarcrm_module.zip ~/Pricefx/pricefx_sugarcrm_module.zip && \
        rm -r ~/Pricefx/pricefx-clients-js/packages/pricefx-crm-extensions/sugarCRM/source/pricefx_sugarcrm_module.zip)
      '';
    };
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" "rbw" "vscode" "yarn" ];
      theme = "josh";
    };
  };
}
