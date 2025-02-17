#!/usr/bin/env bash

. bash-utils.sh

start "test script"

source="$HOME/env-setup/tmux/.config/tmux/tmux.conf"
dest="$XDG_CONFIG_HOME/tmux/tmux.conf"
link_config $source $dest

finish
