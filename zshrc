#!/usr/bin/env bash

## http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail

## your project folder that we can `c [tab]` to
export PROJECTS="${PROJECTS:-~/src}"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="${DOTFILES:-$PROJECTS/df-fresh}"

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
[[ -a ~/.localrc ]] &&  source ~/.localrc

source "$DOTFILES/zplug.zsh"
# source "$DOTFILES/preferences.zsh"
# source "$DOTFILES/environment.zsh"
# source "$DOTFILES/path.zsh"
# source "$DOTFILES/alias.zsh"
# source "$DOTFILES/completion.zsh"
# source "$DOTFILES/announce.zsh"

