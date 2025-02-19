#!/usr/bin/env bash

. bash-utils.sh

start "neovim"

log "install neovim..."
run brew install neovim

log "link config..."
source="$HOME/env-setup/dotfiles/nvim/.config/nvim"
dest="$HOME/.config"
link_config $source $dest

finish
