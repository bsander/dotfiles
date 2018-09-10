#!/usr/bin/env bash

## Frequent actions
e ()  { ${BASE_VISUAL:-$VISUAL} "${@:-.}"; }
# alias ls="gls --color --group-directories-first -Fh"
alias g="git"
alias h=http
alias hp=http-prompt
# alias rgf="rg --files -g"

## Dotfiles related
alias .r='exec $SHELL -l' # Reload shell environment
alias .pub="pbcopy < ~/.ssh/id_rsa.pub" # Copy SSH public key
alias .ssh="e ~/.ssh/config" # Edit SSH configuration
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .options="setopt ksh_option_print && setopt"
alias .d="direnv allow"


# ZSH completion/globbing madness
# alias curl="noglob curl"

## Misc. ops
alias tig="tig status" # Always open tig in status view
alias serve="http-server -o" # Statically serve directory
# Print and copy last n commands
last () { fc -ln -$1 | awk '{$1=$1}1' | tee >(pbcopy); }

# Docker and docker-compose
alias d="docker"
alias dr="docker run --rm -it"
alias dc="docker-compose"
alias dcl="docker-compose logs -f --tail=20"

ds() {
  # Stop all running docker containers
  docker ps -a -q | gxargs --no-run-if-empty docker stop
}
dk() {
  # Kill all running docker containers
  docker ps -a -q | gxargs --no-run-if-empty docker kill
}
dx() {
  # remove all stopped containers
  docker ps -a -q --filter "status=exited" | gxargs --no-run-if-empty docker rm
}
dxi() {
  # Remove all dangling docker images
  docker images --filter "dangling=true" -q | gxargs --no-run-if-empty docker rmi
}

gdc() {
  docker-compose -f "$HOME/.docker-compose.yml" "$@"
}

# Kubernetes
alias k="kubectl"
alias kc="kubectl config get-contexts"
alias kn="kubectl config get-contexts"
alias ksc="kubectl config use-context"
alias kd="kp; open localhost:8001/ui"
alias kx="killall kubectl"
alias kd="open http://localhost:8001/ui"
alias kpd="kp;kd"
kp () {
  (
    set -x; kubectl proxy --address='0.0.0.0' --accept-hosts '(docker.for.mac.|)localhost'
  ) &
 sleep 0.5
}
ksn() {
  kubectl config set-context "$(kubectl config current-context)" --namespace "$@"
}

## development related
addtype () {
  set -x
  # See if type definitions exist already
  yarn add --dev "@types/${1:?}" || \
  # Try to generate them from the package
  ypx dts-gen -m "$1" -f "${2:-types}/$1.d.ts" || \
  # If all else fails, produce a generic declaration
  echo "declare module '$1'" > "${2:-types}/$1.d.ts"
}

alias stderred="DYLD_INSERT_LIBRARIES=\$HOME/.ghq/github.com/sickill/stderred/build/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:$DYLD_INSERT_LIBRARIES}"

## Speelcheck
alias brwe=brew
alias ypc=ypx

## Experimental CLI replacements
export EXA_GRID_ROWS=20
alias ls="exa --group-directories-first --sort=name"
alias ll="exa --long --grid --header --group-directories-first --sort=name"
lt () { exa --tree --group-directories-first --level="${1:-2}" --ignore-glob="$(git ign-glob || echo '^$')" "${@:2}"; }
alias cat=bat
alias grep=rg
alias find=fd
alias tree=lt
