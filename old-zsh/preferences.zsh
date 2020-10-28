#!/usr/bin/env zsh

## Don't expand globs to all matches on <tab>, but cycle.
setopt GLOB_COMPLETE
setopt extended_glob

## Don't auto-quote variables passed on the commandline
setopt SH_WORD_SPLIT

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

setopt no_complete_aliases

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

## case-insensitive (uppercase from lowercase) completion
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

## case-insensitive,partial-word and then substring completion
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Cache completion
zstyle ':completion::complete:*' use-cache 0

## Menu Selection
zstyle ':completion:*' menu select
## Don't show `./` and `../` in completions
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' verbose true
zstyle ':completion:*' completer _complete _match _approximate

# Typos
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

## Use colors in completion
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes yes

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}


## Set preferred keybinding mode
bindkey -v # Vi mode
# bindkey -e # Emacs mode

## Use "waiting dots" in completion
expand-or-complete-with-dots() {
  echo -n "\\e[31m…\\e[0m"
  zle expand-or-complete
  zle redisplay
}
zstyle ':completion:*' show-completer true
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

## Use colors in ls https://geoff.greer.fm/lscolors/
# LSCOLORS="gafxcxdxbxegedabagacad"
# LS_COLORS="di=36;40:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# CLICOLOR=true

## Keys for history navigation
bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down
bindkey -M viins '^K' history-substring-search-up
bindkey -M viins '^J' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## Pick item but stay in the menu (=:lowercase `+`)
zmodload zsh/complist
bindkey -M menuselect "," accept-and-menu-complete

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
bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word
# Skip to start/end of line with cmd-arrow
bindkey '[E' beginning-of-line
bindkey '[F' end-of-line
# bindkey '^[[D' beginning-of-line
# bindkey '^[[C' end-of-line
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
## Allow copying the current command line to clipboard
# https://unix.stackexchange.com/a/290214
copy-to-clipboard() {
    zle kill-buffer
    print -rn -- $CUTBUFFER | pbcopy
    zle yank
}
zle -N copy-to-clipboard
bindkey "^Xc" copy-to-clipboard
bindkey -M vicmd "yy" copy-to-clipboard

## allow comments with #
setopt interactive_comments

## List jobs in the long format by default.
setopt LONG_LIST_JOBS

## show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_menu

# Allow completion from within a word/phrase
# ex: completes to Desktop/ from Dktop with cursor before k)
setopt complete_in_word

# don't autocorrect misspelled commands
unsetopt correct_all

# remove extra slashes if needed
setopt auto_remove_slash

# smart insert spaces " "
setopt auto_param_keys

# conserve space
setopt list_packed

## Word characters (alt-backspace will not break on these)
WORDCHARS='*?$'

## (^Q): Push current line to the next prompt
setopt NO_FLOW_CONTROL
bindkey '^q' push-line-or-edit

## do not autoselect the first completion entry
unsetopt menu_complete

## Warn of running background jobs belonging to this sesison on exit
setopt CHECK_JOBS
## Disown background jobs instead of killing them (disabled)
# setopt NO_HUP

export PROMPT_EOL_MARK='%'
