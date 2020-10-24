#!/usr/bin/env bash

export BROWSER="open"
# export PAGER=less


export EDITOR="nvim"
export VISUAL="vimr -n" # Don't wait for command completion
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export GIT_EDITOR="${GIT_EDITOR:-$EDITOR}"


# FZF global options
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS='--height=40%'

# kubectl: Always consider local `kube-config` file
# export KUBECONFIG="./kube-config"

# Go: Subdir within $PROJECTS
export GOPATH="$PROJECTS/go"

# Homebrew cask: install to directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# https://stackoverflow.com/a/28296325
# export ANDROID_HOME=/Applications/ADT/sdk
export ANDROID_HOME="/Users/sanderb/Library/Android/sdk"

# # Per-dir environment configuration
# eval "$(direnv hook zsh)"

# NVM Setup
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export ZSH_THEME=gruvbox

# vicmd/viins swwitch mode timeout
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=1
