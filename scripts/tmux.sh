#!/usr/bin/env bash

. bash-utils.sh

start "tmux"

log "install tmux.."
brew install tmux

log "install tmux-plugin-manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source="$HOME/env-setup/dotfiles/tmux/.config/tmux/tmux.conf"
dest="$HOME/.config/tmux/tmux.conf"
link_config $source $dest

finish
