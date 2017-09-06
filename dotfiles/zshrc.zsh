#!/usr/bin/env bash

## http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail

## Profiling
# zmodload zsh/zprof

## your project folder that we can `c [tab]` to
export PROJECTS="${PROJECTS:-$HOME/src}"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="${DOTFILES:-$PROJECTS/df-fresh}"

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
[[ -a "$HOME/.localrc" ]] && source "$HOME/.localrc"

# set -x
## Autoload functions and completions
fpath=("$DOTFILES/zsh/functions" "$DOTFILES/zsh/completions" $fpath)
autoload -U "$DOTFILES/zsh"/functions/*(:t)
autoload -U "$DOTFILES/zsh"/completions/*(:t)

# source "$DOTFILES/zsh/zplug.zsh"
source "$DOTFILES/zsh/zgen.zsh"
source "$DOTFILES/zsh/plumbing.zsh"
# source "$DOTFILES/zsh/completion.zsh"
source "$DOTFILES/zsh/preferences.zsh"
source "$DOTFILES/zsh/environment.zsh"
source "$DOTFILES/zsh/path.zsh"
source "$DOTFILES/zsh/alias.zsh"
source "$DOTFILES/zsh/announce.zsh"

# zprof
