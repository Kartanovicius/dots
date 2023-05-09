#!/bin/bash

function askBeforeReplace() {
  echo -e "$3"
  read continue

  if [ $continue == Y ]; then
    STATUS="36m[replaced]"
    rm -R $1
    ln -s $2 $1
  else
    STATUS="31m[ignored]"
  fi
}


# Script for linking system files into git repository
# $1: system configuration file or directory. This target wil be replaced by symlink
# $2: source of symlink
#
# [r] - replaced
# [n] - new link
# [i] - ignored

function replaceBySymLink {
  # Source file exits
  if [ -e $2 ]; then
    # Target is directory and not symlink
    if [ -d $1 ] && [ ! -L $1 ]; then
      askBeforeReplace $1 $2 "\033[01;36m$1 is a directory, delete it and replace by symlink? [Y/n]\033[00m"
    # Target is file and not symlink
    elif [ -f $1 ] && [ ! -L $1 ]; then
      askBeforeReplace $1 $2 "\033[01;36m$1 is a file, delete it and replace by symlink? [Y/n]\033[00m"
    # Target does not exits or is symlink
    else
      STATUS="32m[new]"
      if [ -L $1 ]; then
        STATUS="32m[symlink replaced]"
	rm $1
      fi
      ln -s $2 $1
    fi

    echo -e "\033[01;$STATUS\033[00m: $1 --> $2"
  else
    echo -e "\033[01;36m$2 Symlink target does not exist, skipping.\033[00m"
  fi
}

echo -e "\033[01;35mSymLink replacing\033[00m"

# .config
replaceBySymLink ~/.config/sway ~/Fedora/config/sway
replaceBySymLink ~/.config/waybar ~/Fedora/config/waybar
replaceBySymLink ~/.config/htop ~/Fedora/config/htop
replaceBySymLink ~/.config/wofi ~/Fedora/config/wofi
replaceBySymLink ~/.config/kitty ~/Fedora/config/kitty
replaceBySymLink ~/.config/rofi ~/Fedora/config/rofi

replaceBySymLink ~/.bash_aliases ~/Fedora/other/bash_aliases
replaceBySymLink ~/.bash_profile ~/Fedora/other/bash_profile
replaceBySymLink ~/.bash_pfx ~/Fedora/other/bash_pfx
replaceBySymLink ~/.bashrc ~/Fedora/other/bashrc

# others
replaceBySymLink ~/vscode-workspaces ~/Fedora/other/vscode-workspaces
replaceBySymLink ~/bash-tools ~/Fedora/other/bash-tools
