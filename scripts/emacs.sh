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

finish
