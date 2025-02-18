# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'ask'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Don't start tmux.
zstyle ':z4h:' start-tmux 'no'

# Move prompt to the bottom when zsh starts and on Ctrl+L.
zstyle ':z4h:' prompt-at-bottom 'no'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
# zstyle ':z4h:ssh:htpc.local'   enable 'yes'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
# zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example.
z4h install ohmyzsh/ohmyzsh || return
z4h install knu/zsh-manydots-magic || return
# z4h install sainnhe/dotfiles || return
# z4h install chitoku-k/fzf-zsh-completions || return
# z4h install bigH/git-fuzzy || return

## Print a random line from tips & tricks file (announce)
rg -v '^#|^\s*$' "$DOTFILES/tipstricks.ini" | "$(command -v gshuf || command -v shuf)" -n 1 -

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
# This has already happened in zshenv.zsh

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# Batch file renamer
autoload -Uz zmv

# Apply magic quoting to urls as arguments
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# # Trim newlines from pastes so that they don't get executed
# z4h source "$Z4H/ohmyzsh/ohmyzsh/plugins/safe-paste/safe-paste.plugin.zsh"

# # Auto-expand aliases (otherwise use Ctrl-Space)
z4h source "$Z4H/ohmyzsh/ohmyzsh/plugins/globalias/globalias.plugin.zsh"

## FZF Completions
# z4h source "$Z4H/chitoku-k/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh"

## Load this after url quote magic
z4h source "$Z4H/knu/zsh-manydots-magic/manydots-magic"
autoload -Uz manydots-magic
manydots-magic

## Z: jumping to recently used directories
eval "$(zoxide init zsh --hook prompt)"

## SSH-agent
eval "$(ssh-agent -s)" >/dev/null

# Define key bindings.
## Useful commands:
# bindkey -- list current keybindings
# zle -al -- list possible commands
#
# codes: \e = escape, ^ = ctrl

# Copy current command to clipboard
copy-to-clipboard() {
    zle kill-buffer
    print -rn -- $CUTBUFFER | pbcopy
    zle yank
}
zle -N copy-to-clipboard

bindkey '\ey' copy-to-clipboard

bindkey '\e0' beginning-of-line
bindkey '\eI' beginning-of-line
bindkey '\e$' end-of-line
bindkey '\eA' end-of-line
bindkey '\eD' kill-line
bindkey '^b' backward-word
bindkey '^w' forward-word
bindkey '^l' forward-char
bindkey '^h' backward-char

z4h bindkey undo Ctrl+/ Shift+Tab # undo the last command line change
z4h bindkey redo Option+/           # redo the last undone command line change

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function mcd() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

## Dotfiles related
alias c=zi
alias .r='exec $SHELL'          # Reload shell environment
# alias .pub="pbcopy < ~/.ssh/id_rsa.pub" # Copy SSH public key
# alias .ssh="e ~/.ssh/config"            # Edit SSH configuration
alias .c="cd \$DOTFILES"                # cd into this dotfiles repository
alias .e="e \$DOTFILES"                 # Edit this dotfiles repository
alias .ce="cd \$DOTFILES; e"
alias .zcomp="rm -f ~/.zcompdump && compinit"
alias .tips="grep -v '^#' '$DOTFILES/tipstricks.ini' | $PAGER"
alias .up="(cd $DOTFILES; make update; )" # Run update script

## Misc. ops
alias serve="http-server -o" # Statically serve directory

# Print and copy last n commands
last() { fc -ln -"${1:-1}" | awk '{$1=$1}1' | tee >(pbcopy); }

gcd() {
  cd "$(git rev-parse --show-toplevel)"
}

## Global aliases (use anywhere)
alias -g P='| $PAGER'
alias -g E='| $EDITOR'
alias -g F='| fzf --reverse --no-sort'

## Frequently used apps
alias b=brew
alias bi="brew info"
alias bs="brew search"
alias bI=bii # Backwards compatibility

bii() {
  brew install "${@:-!$}"
}

alias g=git

alias d=docker
alias dr="docker run --rm -it"

alias dc="docker compose"
alias dcr="docker compose run --rm"
alias dcs="docker compose stop"
alias dcu="docker compose up -d"
# alias dcud="docker compose up -d"
alias dcl="docker compose logs --follow --tail=20"
alias dcd="docker compose down --timeout 0"
alias dcD="docker compose down --timeout 0 --volumes --remove-orphans"
alias dcdd="docker compose down --timeout 0 --volumes --remove-orphans"

# Force of habit - consistency with vim
alias gg="tig status"

alias y=yarn
alias yr="yarn run"
alias yw="yarn workspace"
alias yww="yarn workspaces run"

# alias ssh="z4h ssh"

## Substitute apps
alias vim=nvim
alias cat=bat
alias grep=rg
alias find=fd
alias ping=gping
alias dig=dog
alias http=xh
alias curl=curlie
alias nvm=fnm

## Typos
alias brwe=brew

unalias ls
ls() {
  eza --group-directories-first --sort=name --classify "$@"
}
alias ll="ls --long --header --all"

tree() {
  eza --group-directories-first --sort=name --classify --tree --git-ignore "$@"
}

alias lt="tree --level=2"


# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots # no special treatment for file names with a leading dot
setopt no_auto_menu # require an extra TAB press to open the completion menu

source /Users/sanderb/.config/broot/launcher/bash/br
