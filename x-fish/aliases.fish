## Dotfiles related
## Reload shell environments
alias .r="exec $SHELL -l"
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .f="\$DOTFILES/bin/dotbot" # Run update script

## z aliases
alias z="cd (__z --list 2>/dev/null | awk '{print \$2}' | fzf --exact --inline-info --reverse --no-sort )"
alias c="cd (__z --list 2>/dev/null | awk '{print \$2}' | grep $PROJECTS | fzf --exact --inline-info --reverse --no-sort )"

function e
    ## Open current directory when no arguments are given
    if not count $argv >/dev/null
        e .
        return
    end
    eval $VISUAL $argv
end

## Frequently used apps
abbr --add b brew
abbr --add bc "brew cask"
abbr --add bci "brew cask info"
abbr --add bcI "brew cask install"
abbr --add bi "brew info"
abbr --add bI "brew install"
abbr --add bs "brew search"

abbr --add g git

abbr --add d docker
abbr --add dr "docker run --rm -it"

abbr --add dc docker-compose
abbr --add dcr "docker-compose run --rm"
abbr --add dcs "docker-compose stop"
abbr --add dcu "docker-compose up"
abbr --add dcud "docker-compose up -d"
abbr --add dcl "docker-compose logs --follow --tail=20"

# function dcu
#     docker-compose up -d $argv && docker-compose logs --follow --tail=20 $argv
# end

abbr --add dcl "docker-compose logs --follow --tail=20"
abbr --add dcd "docker-compose down --timeout 0"

# Force of habit - consistency with vim
abbr --add gg "tig status"

abbr --add k kubectl
abbr --add kx kubectx

abbr --add y yarn
abbr --add yr "yarn run"
abbr --add yw "yarn workspace"
abbr --add yww "yarn workspaces run"


## Substitute apps
abbr --add cat bat
abbr --add grep rg
abbr --add find fd
# alias tree=lt
alias ls="exa --group-directories-first --sort=name"
alias ll="exa --long --grid --header --group-directories-first --sort=name"

## Typos
abbr --add brwe brew
