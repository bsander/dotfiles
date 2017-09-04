#!/usr/bin/env bash

export EDITOR="code"
export VISUAL="$EDITOR -w"
export BROWSER="open"

# Enrise Gitlab url
export GITLAB_URL="https://gitlab.enrise.com"

# kubectl: Always consider local `kube-config` file
export KUBECONFIG="./kube-config:$HOME/.kube/config"

# Go: Subdir within $PROJECTS
export GOPATH="$PROJECTS/go"

# Homebrew cask: install to directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
