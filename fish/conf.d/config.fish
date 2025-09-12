## Some docs
## - https://fishshell.com/docs/current/
## - https://fishshell.com/docs/current/commands.html

## your project folder that we can `c [tab]` to
set -q PROJECTS
or set -gx PROJECTS "$HOME/src"

## shortcut to this dotfiles path is $DOTFILES
set -q DOTFILES
or set -gx DOTFILES "$PROJECTS/dotfiles"

## use .localrc for SUPER SECRET stuff that you don't want in your public,
## versioned repo.
test -f "$HOME/.localrc"
and source "$HOME/.localrc"

## Something shell-agnostic may exist in here
test -f "$HOME/.profile"
and source "$HOME/.profile"
