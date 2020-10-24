#!/usr/bin/env zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# Forget completions up to this point
zinit cdclear -q
zinit ice blockf

## geometry is a minimal, fully customizable and composable zsh prompt theme
# zinit load "geometry-zsh/geometry"

## (^B) Browse interactive variables and other structures of Zshell
zinit light "zdharma/zui"
zinit light "zdharma/zbrowse"

## Additional completion definitions for Zsh.
zinit light "zsh-users/zsh-completions"

## (^F) Complete options from manual pages
zinit light "zdharma/zzcomplete"

## An oh-my-zsh plugin to help remembering those aliases you defined once
# zinit load "djui/alias-tips" # Useless, suggests command that was just executed.

## Auto-expand aliases (do I want this?)
zinit snippet OMZ::plugins/globalias/globalias.plugin.zsh
# zinit oh-my-zsh plugins/globalias
# zinit load "jarmo/expand-aliases-oh-my-zsh"

# ## Prefix cmd with sudo
# zinit oh-my-zsh "plugins/sudo"

## Ubuntu’s command-not-found equivalent for Homebrew on macOS (needs brew package too)
## Disabled due to slow.
# zinit oh-my-zsh plugins/command-not-found

## Safe pasting (strip last newline)
zinit snippet OMZ::plugins/safe-paste/safe-paste.plugin.zsh
## (^G) Per directory history for zsh, as well as global history (Annoying)
# zinit oh-my-zsh "plugins/per-directory-history"

# ## Cryptographic agents
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zinit snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh

# ## Color ls and many command outputs
# zinit load "unixorn/warhol.plugin.zsh"

## (^R) Multi-word, syntax highlighted history searching for Zsh
zinit light "zdharma/history-search-multi-word"

# Gruvbox theme
# zinit light "sbugzu/gruvbox-zsh"

# Powerlevel10k prompt
zinit light romkatv/powerlevel10k
# zinit wait! lucid
# zinit snippet https://github.com/sainnhe/dotfiles/blob/master/.zsh-theme-gruvbox-material-dark

## Playground / Disabled / Inactive
# zinit load "psprint/zsh-navigation-tools"
# zinit load "psprint/zsh-editing-workbench"


## Somehow, completions appear to work when they are loaded after zinit has called compinit.
# zinit oh-my-zsh "plugins/kubectl"
# zinit oh-my-zsh "plugins/gitfast"
# zinit load "lukechilds/zsh-better-npm-completion"
# zinit load "greymd/docker-zsh-completion"
# zinit load "docker/cli" contrib/completion/zsh/_docker
# zinit load "docker/compose"

# ## translates "..." into "../.."
# ## "If you are enabling url-quote-magic, make sure to load url-quote-magic first and then load manydots-magic."
# ## https://github.com/knu/zsh-manydots-magic#how-to-set-up
zinit ice pick"manydots-magic"
zinit light 'knu/zsh-manydots-magic'


autoload -Uz compinit
compinit

# Replay forgotten completions
zinit cdreplay -q


# This stuff should be loaded last

## Optimized and extended zsh-syntax-highlighting
zinit light "zdharma/fast-syntax-highlighting"

## Up and Down keys search for typed input in history
zinit light "zsh-users/zsh-history-substring-search"

