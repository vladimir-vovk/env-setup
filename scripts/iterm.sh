#!/usr/bin/env bash

. bash-utils.sh

start "iterm"

log "install iterm..."
run brew install iterm2

source="$HOME/env-setup/dotfiles/iterm/Library/Preferences/com.googlecode.iterm2.plist"
dest="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
cp_config $source $dest

finish
