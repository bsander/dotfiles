#!/usr/bin/env bash

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
z4h source "$Z4H/chitoku-k/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh"

## Load this after url quote magic
z4h source "$Z4H/knu/zsh-manydots-magic/manydots-magic"
autoload -Uz manydots-magic
manydots-magic

eval "$(zoxide init zsh --hook prompt)"

## FNM (like NVM) - https://github.com/Schniz/fnm
eval "$(fnm env --shell zsh)"
