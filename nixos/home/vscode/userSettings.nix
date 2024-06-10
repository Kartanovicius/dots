{}: {
  "window.zoomLevel" = 1;
  "editor.suggestSelection" = "first";
  "terminal.integrated.gpuAcceleration" = "on";
  "workbench.iconTheme" = "icons";
  "emmet.includeLanguages" = {
    "\"vue-html\"=" = "\"html\"";
    "\"vue\"" = "\"html\"";
  };
  "editor.autoClosingBrackets" = "always";
  "[scss]" = {
    "editor.defaultFormatter" = "HookyQR.beautify";
  };
  "editor.tabSize" = 2;
  "git.autofetch" = true;
  "typescript.updateImportsOnFileMove.enabled" = "always";
  "editor.formatOnSave" = true;
  "git.suggestSmartCommit" = false;
  "javascript.updateImportsOnFileMove.enabled" = "always";
  "files.exclude" = {
    "**/.git" = false;
    "**/.gitt" = true;
  };
  "json.schemas" = [ ];
  "[json]" = {
    "editor.defaultFormatter" = "vscode.json-language-features";
  };
  "[groovy]" = {
    "editor.defaultFormatter" = "NicolasVuillamy.vscode-groovy-lint";
  };
  "editor.fontFamily" = "Fira Code";
  "editor.fontLigatures" = true;
  "editor.fontWeight" = "500";
  "[nix]" = {
    "editor.defaultFormatter" = "jnoortheen.nix-ide";
  };
  "nix.serverPath" = "nixpkgs-fmt";
  "nixpkgs-fmt.path" = "";
  "nix.serverSettings" = { };
  "workbench.colorTheme" = "Plastic - deprioritised punctuation";
  "git.confirmSync" = false;
  "prettier.bracketSameLine" = true;
  "prettier.printWidth" = 1000;
  "pricefx.deployImmediatelyAfterSave" = true;
  "[jsonc]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "eslint.codeActionsOnSave.rules" = null;
  "prettier.resolveGlobalModules" = true;
  "eslint.format.enable" = true;
  "editor.defaultFormatter" = "null";
  "[typescriptreact]" = {
    "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
  };
  "ltex.additionalRules.enablePickyRules" = true;
  "ltex.statusBarItem" = true;
  "editor.lineHeight" = 2;
  "[typescript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[html]" = {
    "editor.defaultFormatter" = "vscode.html-language-features";
  };
  "workbench.productIconTheme" = "fluent-icons";
  "open-php-html-js-in-browser.selectedBrowser" = "Chromium";
  "liveServer.settings.donotShowInfoMsg" = true;
  "[css]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "svelte.enable-ts-plugin" = true;
  "[svelte]" = {
    "editor.defaultFormatter" = "svelte.svelte-vscode";
  };
  "gitlens.ai.experimental.provider" = "openai";
  "gitlens.ai.experimental.openai.model" = "gpt-4-1106-preview";
  "editor.minimap.enabled" = false; # removes minimap
  "editor.renderWhitespace" = "none"; # removes indent guides
  "editor.renderLineHighlight" = "none"; # removes line highlight
  "editor.overviewRulerBorder" = false; # removes border from overview ruler (located on the right, same position as the scrollbar)
  "editor.hideCursorInOverviewRuler" = true; # hides cursor mark in the overview ruler
  "editor.folding" = true; # removes the folding feature
  "editor.occurrencesHighlight" = false; # removes highlights occurrences (still works when you select a word)
  "editor.matchBrackets" = false; # removes the highlight of matching brackets (I use Subtle Match Brackets extension for this)
  "editor.glyphMargin" = false; # removes the space used mainly for debugging indicators
  "explorer.openEditors.visible" = 0; # removes the activity bar (the 4 icons at the left of the screen), so now you will have to open the explorer, git, debugger and extension with shortcuts or through the Command Palette
  "workbench.editor.showIcons" = false; # removes icon from opened files in tabs
  "workbench.editor.tabCloseButton" = "off"; # removes cross icon from tabs
  "workbench.statusBar.visible" = true; # removes the status bar
  "indenticator.color.dark" = "rgba(255,255,255,.1)"; # adds a subtle indent guide (needs Indenticator extension)
  "workbench.colorCustomizations" = {
    # object that allows you to customize your color theme: https:#code.visualstudio.com/docs/getstarted/theme-color-reference
    "tab.activeBorder" = "#0000"; # removes border to highlight active tabs (the colors formats are: #RGB, #RGBA, #RRGGBB or #RRGGBBAA)
  };
  # "workbench.activityBar.location"= "hidden";
  "editor.guides.indentation" = false;
  "[dart]" = {
    "editor.formatOnSave" = true;
    "editor.formatOnType" = true;
    "editor.rulers" = [ 80 ];
    "editor.selectionHighlight" = false;
    "editor.suggestSelection" = "first";
    "editor.tabCompletion" = "onlySnippets";
    "editor.wordBasedSuggestions" = "off";
  };
  "[less]" = {
    "editor.defaultFormatter" = "Wscats.eno";
  };
  "git.ignoreRebaseWarning" = true;
  "editor.codeActionsOnSave" = { };
  "editor.unicodeHighlight.allowedLocales" = {
    "fr" = true;
  };
  "redhat.telemetry.enabled" = true;
  "[xml]" = {
    "editor.defaultFormatter" = "DotJoshJohnson.xml";
  };
  "dart.checkForSdkUpdates" = false;
  "[javascript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "diffEditor.ignoreTrimWhitespace" = false;
  "[yaml]" = {
    "editor.defaultFormatter" = "redhat.vscode-yaml";
  };
}
