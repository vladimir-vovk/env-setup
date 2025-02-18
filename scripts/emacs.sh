#!/usr/bin/env bash

. bash-utils.sh

start "emacs"

log "install emacs-plus..."
run brew tap d12frosted/emacs-plus
run brew install emacs-plus@30

log "install spacemacs..."
run git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

source="$HOME/env-setup/dotfiles/emacs/.spacemacs"
dest="$HOME/.spacemacs"
link_config $source $dest

log "link Emacs to Applications folder"
run osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@30/Emacs.app" at posix file "/Applications" with properties {name:"Emacs.app"}'

finish
