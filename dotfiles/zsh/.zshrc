# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell-carrot"
# ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gitfast
  macos
  python
  brew
  docker
  extract
  zsh-autosuggestions
  zsh-completions
  zsh-history-substring-search
  zsh-syntax-highlighting
  wd
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Setup brew path
export PATH="/usr/local/bin:${PATH}"

# Path to brew installed python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Virtualenvwrapper
# export WORKON_HOME=$HOME/.venvs
# export PROJECT_HOME=$HOME/projects
# source /usr/local/bin/virtualenvwrapper.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='gls -G'
alias ll='gls -la --group-directories-first --color=auto'
alias g='git'
alias e='/opt/homebrew/bin/emacsclient'

# nvm
export NVM_DIR="$HOME/.nvm"
. "$HOME/.nvm/nvm.sh"

export PATH="$HOME/.yarn/bin:$PATH"

# go
export GOPATH="$HOME/projects/go"
export PATH="$HOME/projects/go/bin:$PATH"

# zsh highlight
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pure prompt
# npm install --global pure-prompt
# autoload -U promptinit; promptinit
# prompt pure

# Android
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK=$ANDROID_HOME/ndk/25.0.8775105
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Android emulator
alias emul='~/Library/Android/sdk/emulator/emulator'
alias emul-ls='~/Library/Android/sdk/emulator/emulator -list-avds'
alias emul-nexus='~/Library/Android/sdk/emulator/emulator -avd Nexus_5_API_S -netdelay none -netspeed full &'
alias emul-pixel3='~/Library/Android/sdk/emulator/emulator -avd Pixel_3_XL_API_28 -netdelay none -netspeed full &'
alias emul-note8='~/Library/Android/sdk/emulator/emulator -avd Samsung_Note_8_API_28 -netdelay none -netspeed full &'
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}

alias ei='~/Library/Android/sdk/platform-tools/adb -e install ./android/app/build/outputs/apk/devrelease/app-devrelease.apk'
alias es='~/Library/Android/sdk/platform-tools/adb shell am start -a android.intent.action.MAIN -n com.svimobilecore.dev/.MainActivity
'

# flutter
export PATH="$PATH:$HOME/Library/flutter/bin"

# Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# TODO manage secrets in a separate encrypted file
# GitLab access token
# export CI_JOB_TOKEN=
# export NPM_TOKEN=

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# the fuck
# eval $(thefuck --alias)

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# moving through history with up and down keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# zoxide
eval "$(zoxide init zsh)"

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Maestro
export PATH=$PATH:$HOME/.maestro/bin
