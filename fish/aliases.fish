## Dotfiles related
# Reload shell environments
alias .r="exec $SHELL -l"
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .f="\$DOTFILES/bin/dotbot" # Run update script

## Frequently used apps
abbr --add --global b brew

abbr --add --global g git

abbr --add --global d docker
alias dr="docker run --rm --interactive --tty"

abbr --add --global dc docker-compose
alias dcl="docker-compose logs --follow --tail=20"
alias dcd="docker-compose down --timeout 0"

abbr --add --global k kubectl
abbr --add --global kx kubectx

abbr --add --global y yarn

## Typos
abbr --add --global brwe brew
abbr --add --global ypc ypx

## Substitute apps
alias cat=bat
alias grep=rg
alias find=fd
# alias tree=lt
alias ls="exa --group-directories-first --sort=name"
alias ll="exa --long --grid --header --group-directories-first --sort=name"
