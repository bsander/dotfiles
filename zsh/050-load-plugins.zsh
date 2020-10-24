#!/usr/bin/env bash

autoload -Uz zmv

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

z4h source "$Z4H/knu/zsh-manydots-magic/manydots-magic"
autoload -Uz manydots-magic
manydots-magic
