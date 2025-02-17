#!/usr/bin/env bash

. bash-utils.sh

start "ssh"

source="$HOME/env-setup/dotfiles/ssh/.ssh/config"
dest="$HOME/.ssh/config"
link_config $source $dest

finish
