#!/usr/bin/env bash

## Set locale properties
[[ -z "$LANG" ]] && export LANG="en_US.UTF-8"
[[ -z "$LC_ALL" ]] && export LC_ALL="en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434
export LC_CTYPE="C"

## Indicate no trailing newline on command output
PROMPT_EOL_MARK='%K{red} %k'

export BROWSER="open"
# export PAGER=less # Z4H does this better
# export PAGER="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR="nvim"
# export VISUAL="vimr -n" # Don't wait for command completion
# export VISUAL="/Applications/FVim.app/Contents/MacOS/fvim-osx-launcher"
export VISUAL="vv"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export GIT_EDITOR="${GIT_EDITOR:-$EDITOR}"

# FZF global options
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
export FZF_DEFAULT_OPTS="--height=40%"
# export FZF_DEFAULT_OPTS="--height=40% --color=fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color=info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

export BAT_THEME="gruvbox-light"

# kubectl: Always consider local `kube-config` file
# export KUBECONFIG="./kube-config"

# Go: Subdir within $PROJECTS
export GOPATH="$PROJECTS/go"

# Homebrew cask: install to directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# https://stackoverflow.com/a/28296325
# export ANDROID_HOME=/Applications/ADT/sdk
export ANDROID_HOME="$HOME/Library/Android/sdk"

# # NVM Setup
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# vicmd/viins swwitch mode timeout
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=1

## Don't show Prompt autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=()

## Word characters (alt-backspace will not break on these)
export WORDCHARS='*?$'
