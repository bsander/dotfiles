#!/usr/bin/env bash

## zsh opts
setopt auto_cd
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

## Keys for history navigation
if zplug check zsh-users/zsh-history-substring-search; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi

## Prompt configuration
export GEOMETRY_PROMPT_PLUGINS=(exec_time git node)
export GEOMETRY_PROMPT_SUFFIX="$ "
export PROMPT_GEOMETRY_COLORIZE_ROOT=true
export PROMPT_GEOMETRY_GIT_TIME=false
