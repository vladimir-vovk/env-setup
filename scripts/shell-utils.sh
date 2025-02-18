#!/usr/bin/env bash

. bash-utils.sh

start "shell utils"

log "install GNU utils..."
run brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

log "install fzf zoxide yazi..."
run brew install fzf zoxide yazi

log "install fonts..."
run brew install font-fira-code font-fira-code-nerd-font font-source-code-pro

log "install other..."
run brew install htop btop ffmpeg httpie lazygit ispell neofetch mas mc rsync scrcpy sevenzip tree yt-dlp ripgrep fd

finish
