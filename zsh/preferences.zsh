#!/usr/bin/env bash

## Don't expand globs to all matches on <tab>, but cycle.
setopt GLOB_COMPLETE
setopt extended_glob

# sort globs numerically
setopt numeric_glob_sort

# allow modifiers before regex ()
setopt ksh_glob

# a$abc ==> aa ab ac
setopt rc_expand_param

# lazy case for globs
setopt no_case_glob

# don't require a dot
setopt glob_dots

# lazy case for regex matches
setopt no_case_match

# can use qualifirs by themselves
setopt bare_glob_qual

# glob directories end in "/"
setopt mark_dirs

# append type chars to files
setopt list_types

# don't err on null globs
setopt null_glob

# extended brace expansion
setopt brace_ccl

## Switching directories for lazy people
setopt auto_cd

## Share history file amongst all Zsh sessions, ignoring dupes
HISTFILE="$DOTFILES/zhistory.txt"   # The path to the history file.
HISTSIZE=10000                      # The maximum number of events to save in the internal history.
SAVEHIST=10000                      # The maximum number of events to save in the history file.
setopt BANG_HIST                    # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY             # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY           # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY                # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST       # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS             # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS         # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS            # Do not display a previously found event.
setopt HIST_IGNORE_SPACE            # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS            # Do not write a duplicate event to the history file.
setopt HIST_VERIFY                  # Do not execute immediately upon history expansion.
setopt HIST_BEEP                    # Beep when accessing non-existent history.

## (Esc-h) Fast Manpage access
autoload run-help

# Make zsh know about hosts already accessed by SSH (redundant?)
# zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

## Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

## Cache completion
zstyle ':completion::complete:*' use-cache 1

## Menu Selection
# zstyle ':completion:*' menu yes select
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

## Use colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Use "waiting dots" in completion
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

## Use colors in ls https://geoff.greer.fm/lscolors/
LSCOLORS="gafxcxdxbxegedabagacad"
LS_COLORS="di=36;40:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
CLICOLOR=true

## Keys for history navigation
# if zplug check zsh-users/zsh-history-substring-search; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
# fi

## Pick item but stay in the menu (=:lowercase `+`)
zmodload zsh/complist
bindkey -M menuselect "+" accept-and-menu-complete
bindkey -M menuselect "=" accept-and-menu-complete

## Reverse autocomplete cycling order (shift tab)
bindkey -M menuselect '^[[Z' reverse-menu-complete

# ## Globalias space key reversal
# bindkey -M emacs "^ " globalias
# bindkey -M viins "^ " globalias
# bindkey -M emacs " " magic-space
# bindkey -M viins " " magic-space

## OSX keybindings: http://floatleft.com/notebook/mac-like-text-navigation-in-zsh/
# Delete char
bindkey "^[[3~" delete-char
# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word
# Skip to start/end of line with cmd-arrow
bindkey '[E' beginning-of-line
bindkey '[F' end-of-line
# Delete word with opt-backspace/opt-delete
bindkey '[G' backward-kill-word
bindkey '[H' kill-word
# Delete line with cmd-backspace
bindkey '[I' kill-whole-line

# ## Quote stuff that looks like URLs automatically. (doesn't appear to work)
# autoload -U url-quote-magic
# zstyle ':urlglobber' url-other-schema ftp git gopher http https magnet
# zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='  # dropped { }
# zle -N self-insert url-quote-magic

## (^Xe) Edit command line in $VISUAL
autoload edit-command-line
zle -N edit-command-line
bindkey "^Xe" edit-command-line
bindkey "^X^E" edit-command-line

## allow comments with #
setopt interactive_comments

## List jobs in the long format by default.
setopt LONG_LIST_JOBS

## do not autoselect the first completion entry
unsetopt menu_complete

## show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_menu

# Allow completion from within a word/phrase
# ex: completes to Desktop/ from Dktop with cursor before k)
setopt complete_in_word

# autocorrect misspelled command
setopt correct_all

# remove extra slashes if needed
setopt auto_remove_slash

# smart insert spaces " "
setopt auto_param_keys

# conserve space
setopt list_packed

## Word characters (alt-backspace will not break on these)
WORDCHARS='*?.[]~=&;!#$%^(){}<>'

## (^Q): Push current line to the next prompt
setopt NO_FLOW_CONTROL
bindkey '^q' push-line-or-edit


## Prompt configuration
GEOMETRY_PROMPT_PLUGINS=(exec_time git node)
GEOMETRY_PROMPT_SUFFIX="$ "
PROMPT_GEOMETRY_COLORIZE_ROOT=true
PROMPT_GEOMETRY_GIT_TIME=false