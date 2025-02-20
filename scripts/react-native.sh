#!/usr/bin/env bash

. bash-utils.sh
. dmg-install.sh

start "React Native"

brew install watchman

log "install command line tools..."
xcode-select --install

log "install ruby and CocoaPods..."
# brew install ruby
sudo gem install cocoapods

log "install XCode..."
mas install 497799835

log "install JDK..."
brew install --cask zulu@17

# Get path to where cask was installed to find the JDK installer
# brew info --cask zulu@17

# ==> zulu@17: <version number>
# https://www.azul.com/downloads/
# Installed
# /opt/homebrew/Caskroom/zulu@17/<version number> (185.8MB) (note that the path is /usr/local/Caskroom on non-Apple Silicon Macs)
# Installed using the formulae.brew.sh API on 2024-06-06 at 10:00:00

# Navigate to the folder
open /opt/homebrew/Caskroom/zulu@17/

log "'Double-Click to Install Azul Zulu JDK 17.pkg' package to install the JDK..."

log "install Android Studio..."
# dmg_install https://redirector.gvt1.com/edgedl/android/studio/install/2024.2.2.14/android-studio-2024.2.2.14-mac_arm.dmg 
open https://developer.android.com/studio/index.html

log "install Android SDK..."
open https://reactnative.dev/docs/set-up-your-environment?platform=android

finish
