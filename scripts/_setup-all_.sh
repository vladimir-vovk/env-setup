#!/usr/bin/env bash

. bash-utils.sh

./zsh

log "install command line tools..."
xcode-select --install

log "install brew package manager..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

./build-utils.sh
./shell-utils.sh
./ssh.sh
./git.sh
./javascript.sh
./tmux.sh
./wezterm.sh
./apps.sh
