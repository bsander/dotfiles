#!/usr/bin/env bash

## Frequent actions
e ()  { ${BASE_VISUAL:-$VISUAL} "${@:-.}"; }
c () { cd $(fd --hidden --type d . "$PROJECTS" 2> /dev/null | fzf +m || echo "." ) }

## Dotfiles related
alias .reload='exec $SHELL -l' # Reload shell environment
alias .pub="pbcopy < ~/.ssh/id_rsa.pub" # Copy SSH public key
alias .ssh="e ~/.ssh/config" # Edit SSH configuration
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .options="setopt ksh_option_print && setopt"
alias .zcomp="rm -f ~/.zcompdump && compinit"
alias .tips="grep -v '^#' '$DOTFILES/tipstricks.ini' | $PAGER"
alias .update="\$DOTFILES/bin/dotbot" # Run update script
.env () {
  env $(< .env | rg -v '^\s*#') "$@"
}

## Misc. ops
alias serve="http-server -o" # Statically serve directory

# Print and copy last n commands
last () { fc -ln -"${1:-1}" | awk '{$1=$1}1' | tee >(pbcopy); }

gcd() {
  cd "$(git rev-parse --show-toplevel)"
}

gdc() {
  docker-compose -f "$HOME/.docker-compose.yml" "$@"
}

## Global aliases (use anywhere)
alias -g P='| $PAGER'
alias -g E='| $EDITOR'
alias -g F='| fzf --reverse --no-sort'


## Frequently used apps
alias b=brew
alias bc="brew cask"
alias bci="brew cask info"
alias bcI="brew cask install"
alias bi="brew info"
alias -s bi="brew info"
alias bI="brew install"
alias bs="brew search"

alias g=git

alias d=docker
alias dr="docker run --rm -it"

alias dc=docker-compose
alias dcr="docker-compose run --rm"
alias dcs="docker-compose stop"
alias dcu="docker-compose up -d"
# alias dcud="docker-compose up -d"
alias dcl="docker-compose logs --follow --tail=20"
alias dcd="docker-compose down --timeout 0"
alias dcD="docker-compose down --timeout 0 --volumes --remove-orphans"
alias dcdd="docker-compose down --timeout 0 --volumes --remove-orphans"

# Force of habit - consistency with vim
alias gg="tig status"

alias y=yarn
alias yr="yarn run"
alias yw="yarn workspace"
alias yww="yarn workspaces run"

alias ssh="z4h ssh"

## Substitute apps
alias cat=bat
alias grep=rg
alias find=fd
alias ls="exa --group-directories-first --sort=name --classify"
alias ll="ls --long --header"
alias tree="ls --tree"
alias stree="tree --level=2"


## Typos
alias brwe=brew



