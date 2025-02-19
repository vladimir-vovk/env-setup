#!/usr/bin/env bash

. $HOME/env-setup/scripts/bash-utils.sh

start "save current configs"

log "backup old configs..."
backup ./Library

log "copy current configs..."
dir="Library/Application Support/Code/User"
mkdir -p "$dir"
cp "$HOME/$dir/settings.json" "$HOME/env-setup/dotfiles/vscode/$dir"
cp "$HOME/$dir/keybindings.json" "$HOME/env-setup/dotfiles/vscode/$dir"

finish
