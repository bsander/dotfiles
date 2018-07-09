#!/usr/bin/env bash

export BASE_EDITOR=vim
export BASE_VISUAL=code
export BROWSER="open"
export PAGER=slit

export EDITOR="$BASE_EDITOR -w"
export VISUAL="$BASE_VISUAL -w"

# Enrise Gitlab url
export GITLAB_URL="https://gitlab.enrise.com"

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
