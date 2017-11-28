#!/usr/bin/env bash

## http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail

## Profiling
# zmodload zsh/zprof

## Verbosity
# set -x

## your project folder that we can `c [tab]` to
export PROJECTS="${PROJECTS:-$HOME/src}"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="${DOTFILES:-$PROJECTS/dotfiles}"

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
## Install iTerm2 shell integration if available
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"
source "$DOTFILES/zsh/path.zsh"
source "$DOTFILES/zsh/alias.zsh"
source "$DOTFILES/zsh/announce.zsh"

# zprof
