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
fpath=("$DOTFILES/zsh/functions" "$DOTFILES/zsh/completions" "$(brew --prefix)/share/zsh/site-functions" $fpath)
# # shellcheck source=../zsh/completion.zsh
# source "$DOTFILES/zsh/completion.zsh"
# autoload -U "$DOTFILES/zsh"/functions/*(:t)
# autoload -U "$DOTFILES/zsh"/completions/*(:t)

# shellcheck source=../zsh/zgen.zsh
source "$DOTFILES/zsh/zinit.zsh"

## compinit has now been called.

# shellcheck source=../zsh/plumbing.zsh
source "$DOTFILES/zsh/plumbing.zsh"
# shellcheck source=../zsh/preferences.zsh
source "$DOTFILES/zsh/preferences.zsh"
# shellcheck source=../zsh/environment.zsh
source "$DOTFILES/zsh/environment.zsh"
## Install iTerm2 shell integration if available
# shellcheck source=../zsh/path.zsh
source "$DOTFILES/zsh/path.zsh"
# shellcheck source=../zsh/alias.zsh
source "$DOTFILES/zsh/alias.zsh"
# shellcheck source=../zsh/announce.zsh
source "$DOTFILES/zsh/announce.zsh"

# # Setup prompt
# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
