#!/usr/bin/env bash

. bash-utils.sh

start "alacritty"

log "install alacritty..."
run brew install -cask alacritty

finish
