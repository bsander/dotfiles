## Some docs
## - http://fishshell.com/docs/current/
## - https://fishshell.com/docs/current/commands.html


## your project folder that we can `c [tab]` to
set -q PROJECTS
or set -gx PROJECTS "$HOME/src"

## shortcut to this dotfiles path is $DOTFILES
set -q DOTFILES
or set -gx DOTFILES "$PROJECTS/dotfiles"

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

## Setup fisher package manager https://github.com/jorgebucaran/fisher
test -f "$FISH_HOME/fisher.fish"
and source "$FISH_HOME/fisher.fish"

## Interactive shell operations
if status --is-interactive
    ## Load aliases
    test -f "$FISH_HOME/aliases.fish"
    and source "$FISH_HOME/aliases.fish"

    ## Load prompt settings
    test -f "$FISH_HOME/prompt.fish"
    and source "$FISH_HOME/prompt.fish"

    ## More stuff not heavy enough for their own files yet

    ## Setup keybindings
    set -g fish_key_bindings hybrid_bindings
    bind . expand-dot-to-parent-directory-path

    ## Setup some git subcommand completions
    ## This utilizes the alias hack from __fish_git_using_command
    set -g __fish_git_alias_co checkout
    set -g __fish_git_alias_rb rebase
    set -g __fish_git_alias_rbo rebase
    set -g __fish_git_alias_rbi rebase
    set -g __fish_git_alias_rbif rebase
    set -g __fish_git_alias_du diff
end
set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
