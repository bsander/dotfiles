function e
    ## Open current directory when no arguments are given
    if not count $argv >/dev/null
        e .
        return
    end
    eval $VISUAL $argv
end

alias .r="exec $SHELL -l"
alias .c="cd \$DOTFILES" # cd into this dotfiles repository
alias .e="e \$DOTFILES" # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .f="\$DOTFILES/bin/dotbot" # Run update script

## Frequently used apps
abbr --add b brew
abbr --add bs "brew search"
abbr --add bi "brew info"
abbr --add bii "brew install"

abbr --add g git
abbr --add gg "tig status"

abbr --add d docker
abbr --add dr "docker run --rm -it"

abbr --add dc docker compose
abbr --add dcr "docker compose run --rm"
abbr --add dcs "docker compose stop"
abbr --add dcu "docker compose up -d"
abbr --add dcuu "docker compose up"
abbr --add dcl "docker compose logs --follow --tail=20"

function dcu --wraps="docker compose up -d"
    docker compose up -d $argv && docker compose logs --follow --tail=20 $argv
end

abbr --add dcl "docker compose logs --follow --tail=20"
abbr --add dcd "docker compose down --timeout 0"
abbr --add dcdd "docker compose down --timeout 0 --remove-orphans --rmi all --volumes"

# abbr --add k kubectl
# abbr --add kx kubectx

abbr --add y yarn
abbr --add yr "yarn run"
abbr --add yw "yarn workspace"
abbr --add yww "yarn workspaces run"

## Substitute apps
abbr --add cat bat
abbr --add grep rg
abbr --add find fd
alias ls="eza --group-directories-first --sort=name"
alias ll="eza --group-directories-first --sort=name --long --grid --header"
abbr --add lt "eza --group-directories-first --sort=name --tree --git-ignore --show-symlinks --level 2"

## Typos
abbr --add brwe brew
