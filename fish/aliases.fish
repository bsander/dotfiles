## Dotfiles related
## Reload shell environments
# alias .r="exec $SHELL -l" ## Fails in kitty due to wrong $SHELL
alias .r="exec fish -l"
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .f="\$DOTFILES/bin/dotbot" # Run update script

function e
    ## Open current directory when no arguments are given
    if not count $argv >/dev/null
        e .
        return
    end
    eval $VISUAL $argv
end

## Frequently used apps
abbr --add --global b brew
abbr --add --global bc "brew cask"
abbr --add --global bci "brew cask info"
abbr --add --global bcI "brew cask install"
abbr --add --global bi "brew info"
abbr --add --global bI "brew install"
abbr --add --global bs "brew search"

abbr --add --global g git

abbr --add --global d docker
abbr --add --global dr "docker run --rm -it"

abbr --add --global dc docker-compose
abbr --add --global dcr "docker-compose run --rm"
abbr --add --global dcs "docker-compose stop"
# abbr --add --global dcu "docker-compose up -d && dcl"
function dcu
    docker-compose up -d $argv && docker-compose logs --follow --tail=20
end
abbr --add --global dcl "docker-compose logs --follow --tail=20"
abbr --add --global dcd "docker-compose down --timeout 0"

# Force of habit - consistency with vim
abbr --add --global gg "tig status"

abbr --add --global k kubectl
abbr --add --global kx kubectx

abbr --add --global y yarn
abbr --add --global yr "yarn run"
abbr --add --global yw "yarn workspace"
abbr --add --global ywr "yarn workspaces run"

## Substitute apps
abbr --add --global cat bat
abbr --add --global grep rg
abbr --add --global find fd
# alias tree=lt
alias ls="exa --group-directories-first --sort=name"
alias ll="exa --long --grid --header --group-directories-first --sort=name"

## Typos
abbr --add --global brwe brew
