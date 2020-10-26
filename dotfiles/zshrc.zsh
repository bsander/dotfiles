#!/usr/bin/env bash

## http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail

## Profiling
zmodload zsh/zprof

## Verbosity
# set -x

## your project folder that we can `c [tab]` to
export PROJECTS="${PROJECTS:-$HOME/src}"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="${DOTFILES:-$PROJECTS/dotfiles}"

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck source=/dev/null
[[ -a "$HOME/.localrc" ]] && source "$HOME/.localrc"

# set -x
## Autoload functions and completions
# shellcheck disable=SC2206

z4h source "$DOTFILES/zsh/010-zstyle.zsh"
z4h source "$DOTFILES/zsh/020-install-plugins.zsh"

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h source "$DOTFILES/zsh/100-announce.zsh"
z4h init || return

z4h source "$DOTFILES/zsh/030-environment-variables.zsh"
z4h source "$DOTFILES/zsh/040-path.zsh"
z4h source "$DOTFILES/zsh/050-load-plugins.zsh"
z4h source "$DOTFILES/zsh/060-key-bindings.zsh"
z4h source "$DOTFILES/zsh/070-functions-aliases.zsh"
z4h source "$DOTFILES/zsh/080-shell-options.zsh"
