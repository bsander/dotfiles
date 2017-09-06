#!/usr/bin/env bash

export ZPLUG_HOME="$DOTFILES/repos/zplug"
# export ZPLUG_THREADS=1
source "$ZPLUG_HOME/init.zsh"

## A next-generation plugin manager for zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

## Up and Down keys search for typed input in history
zplug "zsh-users/zsh-history-substring-search"

## (^R) Multi-word, syntax highlighted history searching for Zsh
zplug "zdharma/history-search-multi-word"

## Integrated terminal workflow with Zshell
zplug "psprint/zconvey"

## geometry is a minimal, fully customizable and composable zsh prompt theme
zplug "geometry-zsh/geometry"

# ## Prezto prompts
# zplug "mafredri/zsh-async"
# zplug "modules/prompt", from:prezto

# ## A full-featured & carefully designed adaptive prompt for Bash & Zsh
# zplug "nojhan/liquidprompt"

## (^B) Browse interactive variables and other structures of Zshell
zplug "zdharma/zui"
zplug "zdharma/zbrowse"

# Optimized and extended zsh-syntax-highlighting
zplug "zdharma/fast-syntax-highlighting"

# ## Additional completion definitions for Zsh.
zplug "zsh-users/zsh-completions"

## Zsh session restoration
zplug "psprint/zsnapshot"

## (^F) Complete options from manual pages
zplug "psprint/zzcomplete"

## Docker completion
zplug "docker/cli", use:contrib/completion/zsh
zplug "docker/compose", use:contrib/completion/zsh

## "..." translates into "../.."
zplug 'knu/zsh-manydots-magic', use:manydots-magic, defer:2

## An oh-my-zsh plugin to help remembering those aliases you defined once
# zplug "djui/alias-tips"

zplug "b4b4r07/zplug-doctor", use:zplug-doctor

## Playground / Disabled / Inactive
# zplug "psprint/zsh-navigation-tools"
# zplug "psprint/zsh-editing-workbench"
## Quote url characters in the right context
zplug "zsh-users/zsh", use:"Functions/Zle/{bracketed-paste,bracketed-paste-magic}", defer:2
# zplug "zsh-users/zsh", use:"Functions/Zle/url-quote-magic", defer:2



# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
  zplug install
fi

# source plugins and add commands to the PATH
zplug load
# zplug load --verbose
