#!/usr/bin/env bash

. bash-utils.sh

start "kitty"

log "install kitty..."
run brew install -cask kitty

log "link configs..."
source="$HOME/env-setup/dotfiles/kitty/.config/kitty"
dest="$HOME/.config"
link_config $source $dest

finish
