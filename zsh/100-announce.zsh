#!/usr/bin/env bash

## Print a random line from tips 'n tricks file
grep -v '^#' "$DOTFILES/tipstricks.ini" | "$(command -v gshuf || command -v shuf)" -n 1 -
