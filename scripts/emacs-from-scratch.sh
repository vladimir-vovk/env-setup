#!/usr/bin/env bash

. bash-utils.sh

start "emacs from scratch"

log "install emacs-plus..."
run brew tap d12frosted/emacs-plus
run brew install emacs-plus@30

source="$HOME/env-setup/dotfiles/emacs-from-scratch/.emacs.d"
dest="$HOME"
link_config $source $dest

log "link Emacs to Applications folder"
run osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@30/Emacs.app" at posix file "/Applications" with properties {name:"Emacs.app"}'

info "run 'M-x package-refresh-contents' to update packages info"

finish
