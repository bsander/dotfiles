#!/usr/bin/env bash

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

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
