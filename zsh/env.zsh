#!/usr/bin/env bash

## This file is sourced at each zsh invocation
## https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

## Set PATH

# Go: Subdir within $PROJECTS
export GOPATH="$PROJECTS/go"

# https://stackoverflow.com/a/28296325
export ANDROID_HOME="$HOME/Library/Android/sdk"

eval "$(PATH= /usr/libexec/path_helper -s)"
export PATH="$DOTFILES/bin:$GOPATH/bin:$ANDROID_HOME/platform-tools:/opt/homebrew/opt/openjdk@11/bin:$PATH"
# "$ANDROID_HOME/build-tools/30.0.1"
# "$HOME/.cargo/bin"

eval "$(/opt/homebrew/bin/brew shellenv)"
command -v fnm >/dev/null 2>&1 && eval "$(fnm env --shell zsh)"

export FPATH="$DOTFILES/zsh/functions:$DOTFILES/zsh/completions:$(brew --prefix)/share/zsh/site-functions:$FPATH"

# Load files from $DOTFILES/zsh/functions when needed
[[ -n "$ZSH_VERSION" ]] && autoload "${fpath[1]}/*(:t)"

## Set locale properties
[[ -z "$LANG" ]] && export LANG="en_US.UTF-8"
[[ -z "$LC_ALL" ]] && export LC_ALL="en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434
[[ -z "$LC_CTYPE" ]] && export LC_CTYPE="C"

## Indicate no trailing newline on command output
PROMPT_EOL_MARK='%K{red} %k'

export BROWSER="open"

## Preprocess some file content for input with bat/less
# export PAGER=
eval "$(batpipe)"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR="code"
# export EDITOR="nvim"
export VISUAL="$EDITOR"
## Instead of GIT_EDITOR, see git config --global core.editor instead
# export GIT_EDITOR=

# Neovim remote socket
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# FZF global options
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
# export FZF_DEFAULT_OPTS="--height=40%"
export FZF_DEFAULT_OPTS="--height=40% --cycle --reverse --exact --inline-info --tiebreak=begin,length,index"

# bat syntax highlighting respects active colorscheme
export BAT_THEME="base16"

# Homebrew cask: install to system-wide applications directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ENV_HINTS=1

# ripgrep (rg) configuration
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# vicmd/viins swwitch mode timeout
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
export KEYTIMEOUT=1

## Don't show Prompt autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=()

## Word characters (alt-backspace will not break on these)
export WORDCHARS='*?$'

## DO NOT TRACK collection https://consoledonottrack.com/
export DO_NOT_TRACK=1
export HOMEBREW_NO_ANALYTICS=1
export AZURE_CORE_COLLECT_TELEMETRY=0
export SAM_CLI_TELEMETRY=0
