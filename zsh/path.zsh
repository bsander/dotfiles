#!/usr/bin/env bash

# Always check $DOTFILES for binaries
PATH="$DOTFILES/bin:$PATH"
# Always check relative ./bin/ for executables
PATH="./bin:$PATH"
# Include downloaded go binaries in path
PATH="$GOPATH/bin:$PATH"

export PATH