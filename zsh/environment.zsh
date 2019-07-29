#!/usr/bin/env bash

export BROWSER="open"
# export PAGER=less

# export EDITOR="emacsclient -nw"
# export VISUAL="$EDITOR"

# kubectl: Always consider local `kube-config` file
# export KUBECONFIG="./kube-config"

# Go: Subdir within $PROJECTS
export GOPATH="$PROJECTS/go"

# Homebrew cask: install to directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Per-dir environment configuration
eval "$(direnv hook zsh)"

# NVM Setup
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
