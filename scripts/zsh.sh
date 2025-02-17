#!/usr/bin/env bash

. bash-utils.sh

start "zshell"

source="$HOME/env-setup/dotfiles/zsh/.zshrc"
dest="$HOME/.zshrc"
link_config source dest

log "install oh-my-zsh..."
run sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

log "copy custom oh-my-zsh themes..."
run \cp -f $HOME/env-setup/dotfiles/oh-my-zsh/.oh-my-zsh/themes/* $HOME/.oh-my-zsh/themes

log "clone custom oh-my-zsh plugins..."
run git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
run git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
run git clone https://github.com/zsh-users/zsh-completions.git $HOME/.oh-my-zsh/custom/plugins/zsh-completions
run git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search

finish
