#!/usr/bin/env bash

. bash-utils.sh

start "git"

source="$HOME/env-setup/dotfiles/git/.gitconfig"
dest="$HOME/.gitconfig"
link_config $source $dest

source="$HOME/env-setup/dotfiles/git/.gitignore"
dest="$HOME/.gitignore"
link_config $source $dest

finish
