#!/usr/bin/env bash

. bash-utils.sh
. dmg-install.sh

start "Visual Studio Code"

brew install --cask visual-studio-code

log "install extensions..."
run $HOME/env-setup/dotfiles/vscode/install-extensions.sh

log "copy settings..."
config="Library/Application\ Support/Code/User/settings.json"
source="$HOME/env-setup/dotfiles/vscode/$config"
dest="$HOME/$config"
cp_config "$source" "$dest"

log "copy keybindings..."
config="Library/Application\ Support/Code/User/keybindings.json"
source="$HOME/env-setup/dotfiles/vscode/$config"
dest="$HOME/$config"
cp_config "$source" "$dest"

finish
