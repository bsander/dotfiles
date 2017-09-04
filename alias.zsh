#!/usr/bin/env bash

## Frequent actions
e ()  { "$EDITOR" "${@:-.}"; }
alias rgf="rg --files -g"

## Dotfiles related
alias .r='exec $SHELL -l' # Reload shell environment
alias .pub="pbcopy < ~/.ssh/id_rsa.pub" # Copy SSH public key
alias .ssh="e ~/.ssh/config" # Edit SSH configuration
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"


# ZSH completion/globbing madness
# alias curl="noglob curl"

## Misc. ops
alias tig="tig status" # Always open tig in status view
alias serve="http-server -o" # Statically serve directory

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
    # ( set -x; kubectl proxy --address='0.0.0.0' --accept-hosts '(docker.for.mac.|)localhost' ) &;
    # sleep 10 && # 6h 21600
    # echo "Killing kubectl proxy.." &&
    # killall kubectl
  ) &
 sleep 0.5
}
ksn() {
  kubectl config set-context $(kubectl config current-context) --namespace "$@"
}
