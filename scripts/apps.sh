#!/usr/bin/env bash

. bash-utils.sh
. dmg-install.sh

start "apps"

brew install audacity background-music kap vlc 
brew install firefox
brew install google-chrome
brew install google-chrome@canary
brew install gimp
brew install --cask eogseq
brew install --cask telegram
brew install --cask tuxguitar

log "install Power Tab Editor..."
dmg-install https://github.com/powertab/powertabeditor/releases/download/2.0.21/powertabeditor-macos-2.0.21.dmg

log "install Rosetta 2..."
softwareupdate --install-rosetta

log "install Keynote..."
mas install 409183694

log "install Numbers..."
mas install 409203825

log "install Pages..."
mas install 409201541

log "install XCode..."
mas install 497799835

log "install GarageBand..."
mas install 682658836

finish
