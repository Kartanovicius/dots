#!/run/current-system/sw/bin/sh

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
replaceBySymLink ~/.config/hypr ~/Yogurt/config/hypr
replaceBySymLink ~/.config/ranger ~/Yogurt/config/ranger
replaceBySymLink ~/.config/waybar ~/Yogurt/config/waybar
replaceBySymLink ~/.config/htop ~/Yogurt/config/htop
replaceBySymLink ~/.config/wofi ~/Yogurt/config/wofi
replaceBySymLink ~/.config/kitty ~/Yogurt/config/kitty
replaceBySymLink ~/.config/rofi ~/Yogurt/config/rofi
replaceBySymLink ~/.config/mako ~/Yogurt/config/mako
replaceBySymLink ~/.config/hypr ~/Yogurt/config/hypr
replaceBySymLink ~/.config/nvim ~/Yogurt/config/nvim

# Allias
replaceBySymLink ~/.bash_aliases ~/Yogurt/other/bash_aliases
replaceBySymLink ~/.bashrc ~/Yogurt/other/bashrc

# others
replaceBySymLink ~/bash-tools ~/Yogurt/other/bash-tools
