## your project folder that we can `c [tab]` to
set -q PROJECTS
or set -g PROJECTS "$HOME/src"

## shortcut to this dotfiles path is $DOTFILES
set -q DOTFILES
or set -g DOTFILES "$PROJECTS/dotfiles"

## Location of all fish shell config files
set -q FISH_HOME
or set -g FISH_HOME "$DOTFILES/fish"

## use .localrc for SUPER SECRET stuff that you don't want in your public,
## versioned repo.
test -f "$HOME/.localrc"
and source "$HOME/.localrc"

## Something shell-agnostic may exist in here
test -f "$HOME/.profile"
and source "$HOME/.profile"

## Define environment variables
test -f "$FISH_HOME/environment.fish"
and source "$FISH_HOME/environment.fish"

## Interactive shell operations
if status --is-interactive
    # Load aliases
    test -f "$FISH_HOME/aliases.fish"
    and source "$FISH_HOME/aliases.fish"
end
