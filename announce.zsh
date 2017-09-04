#!/usr/bin/env bash

## Print a random line from tips 'n tricks file
"$(command -v gshuf || command -v shuf)" -n 1 "$DOTFILES/tipstricks.txt" | head -n1
