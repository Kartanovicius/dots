#!/bin/bash
#
# Script for NodeJs install

# font http://patorjk.com/software/taag/#p=display&f=Rectangles&t=Node
#  _____       _     
# |   | |___ _| |___ 
# | | | | . | . | -_|
# |_|___|___|___|___|

function install_node() {
  local node_version="$1"
  local node_url="https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz"
  local node_file="$(basename ${node_url})"

  # Check if desired version already installed
  if [ -d ~/.app/node-${node_version}-linux-x64 ]; then
    echo "Node.js version ${node_version} is already installed."
    return
  fi

  mkdir -p ~/.app
  cd ~/.app
  wget ${node_url}
  tar -xf ${node_file}
  rm ${node_file}
  rm -rf node
  mv "node-${node_version}-linux-x64" node
  node -v
  npm config set prefix ~/.npm-global
}

echo "Which version of Node.js do you want to install?"
# Get all LTS version codenames
lts_versions=$(curl -s https://nodejs.org/dist/index.json | jq -r 'map(select(.lts))[].lts' | uniq)
options=("Latest" "${lts_versions}" "Other" "Cancel")

select option in ${options[@]}; do
  case ${option} in
    Latest)
      node_version="$(curl -s https://nodejs.org/dist/index.json | jq -r 'map(select(.lts))[0].version')"
      install_node "${node_version}"
      break
      ;;
    # TODO: instead of hardcoded codenames use lts_versions
    Hydrogen|Gallium|Fermium|Erbium|Dubnium|Carbon|Boron|Argon)
      select version in $(curl -sL "https://nodejs.org/dist/index.json" | jq -r --arg option "$option" '.[] | select(.lts == $option) | .version'); do
        install_node "${version}"
        break
      done
      break
      ;;
    Other)
      read -p "Please enter the Node.js version you want to install: v" node_version
      install_node "v${node_version}"
      break
      ;;
    Cancel)
      echo "Installation cancelled"
      break
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
done
