#Labukas
{ config, pkgs, lib, ... }:

let
  pfx-client-folder = "~/Pricefx/pricefx-clients-js";
  pfx-core-folder = "~/Pricefx/pricefx-core";
in
{
  programs.zsh.shellAliases = {
    pfx-run = ''
      export NODE_OPTIONS=--openssl-legacy-provider;
      tmux new-session -d -s pfx 'pfx-modules && yarn start';
      tmux split-window -h -t pfx 'pfx-sfdc && yarn start';
      tmux select-layout -t pfx tiled;
      tmux attach-session -t pfx;
    '';
    pfx-sfdc-run = "export NODE_OPTIONS=--openssl-legacy-provider; yarn --cwd ${pfx-client-folder}/packages/pricefx-sfcd-canvas start";
    pfx-module-run = "yarn --cwd ${pfx-client-folder}/packages/pricefx-modules start";
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
}
