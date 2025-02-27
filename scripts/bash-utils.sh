#!/usr/bin/env bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No color

dry_run="false"

start() {
  echo ""
  echo " 🏎️   $1 💨"
  echo ""
}

finish() {
  echo ""
  printf " ${GREEN}✔${NC} done!\n"
  echo ""
}

info() {
  echo ""
  echo " ℹ️  $1"
  echo ""
}

run() {
  if [[ $dry_run == "false" ]]; then
    "$@"
  fi
}

log() {
  if [[ $dry_run == "true" ]]; then
    echo " > [DRY RUN]: $1"
  else
    echo " > $1"
  fi
}

backup() {
  run mv "$1" "$1.$(date +%Y-%m-%d_%H-%M-%S)"
}

cp_config() {
  source="$1"
  dest="$2"

  if [[ ! -e "$source" ]]; then
    log "!! Configuration file is not found !!"
    log "\"$source\" does not exist."
    log "! Make sure you have the \"env-setup\" folder inside your home directory."
  else
    if [[ -L "$dest" ]]; then
      log "remove old symbolic link to config..."
      run rm "$dest"
    elif [[ -f "$dest" ]]; then
      log "backup current config..."
      backup "$dest"
    fi

    log "copy config to \"$source\"..."
    run mkdir -p "$(dirname "$dest")"

    # if source is a file then copy to dest dir
    if [[ -f $source ]]; then
      run cp -rf "$source" "$dest"
    else
      # if source is a folder then copy to parent of the dest dir
      run cp -rf "$source" "$(dirname "$dest")"
    fi
  fi
}

link_config() {
  source="$1"
  dest="$2"

  if [[ ! -f "$source" && ! -d "$source" ]]; then
    log "!! Configuration file is not found !!"
    log "\"$source\" does not exist."
    log "! Make sure you have the \"env-setup\" folder inside your home directory."

    # if [ ! -f "$dest" ]; then
    #   log "create empty config..."
    #   run touch "$dest"
    # fi
  else
    if [[ -L "$dest" ]]; then
      log "remove old symbolic link to config..."
      run rm -rf "$dest"
    elif [[ -f "$dest" ]]; then
      log "backup current config..."
      backup "$dest"
    fi

    log "link config to \"$source\"..."
    run mkdir -p "$(dirname "$dest")"

    # link file to dest dir and folder to parent dest dir
    if [[ -f "$source" ]]; then
      run ln -s "$source" "$dest"
    else
      run ln -s "$source" "$(dirname "$dest")"
    fi
  fi
}

while [[ $# -gt 0 ]]; do
  if [[ "$1" == "--dry-run" ]]; then
    log "DRY RUN is ON"
    dry_run="true"
  fi
  shift
done

