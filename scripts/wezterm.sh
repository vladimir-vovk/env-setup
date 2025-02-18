#!/usr/bin/env bash

. bash-utils.sh

start "wezterm"

log "install wezterm..."
run brew install wezterm

source="$HOME/env-setup/dotfiles/wezterm/.wezterm.lua"
dest="$HOME/.wezterm.lua"
link_config $source $dest

finish
