#!/usr/bin/env bash


source "$HOME/.profile"

# Always check $DOTFILES for binaries
PATH="$DOTFILES/bin:$PATH"
# Always check relative ./bin/ for executables
PATH="./bin:$PATH"
# Include downloaded go binaries in path
PATH="$GOPATH/bin:$PATH"
# Homebrew
PATH="/usr/local/bin:$PATH"
# Homebrew python
PATH="/usr/local/opt/python/libexec/bin:$PATH"
# Android dev
PATH="$PATH:$ANDROID_HOME/platform-tools"
PATH="$PATH:$ANDROID_HOME/build-tools/30.0.1"

export PATH
