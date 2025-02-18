#!/usr/bin/env bash

# Downloads and install a .dmg from a URL
#
# Usage
# $ dmg-install [url]
# 
# For example, for installing alfred.app
# $ dmg-install http://cachefly.alfredapp.com/alfred_1.3.1_261.dmg
#
# Author: https://gist.github.com/afgomez/4172338
#         Alejandro Fernández Gómez

dmg-install() {
  if [[ $# -lt 1 ]]; then
    echo "Usage: dmg-install [url]"
    exit 1
  fi
  
  url=$*
  
  # Generate a random file name
  tmp_file=/tmp/`openssl rand -base64 10 | tr -dc '[:alnum:]'`.dmg
  apps_folder='/Applications'
  
  # Download file
  echo " Downloading $url..."
  curl -# -L -o $tmp_file $url
  
  echo " Mounting image..."
  volume=`yes | hdiutil mount $tmp_file | tail -n1 | perl -nle '/(\/Volumes\/[^ ]+)/; print $1'`
  
  # Locate .app folder and move to /Applications
  app=`find $volume/. -name *.app -maxdepth 1 -type d -print0`
  echo " Copying `echo $app | awk -F/ '{print $NF}'` into $apps_folder..."
  cp -ir "$app" $apps_folder
  
  # Unmount volume, delete temporal file
  echo " Cleaning up..."
  hdiutil unmount $volume -quiet
  rm $tmp_file
  
  echo " Done!"
}
