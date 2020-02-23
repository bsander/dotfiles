#!/usr/bin/env bash

## Set locale properties
[[ -z "$LANG" ]] && export LANG="en_US.UTF-8"
[[ -z "$LC_ALL" ]] && export LC_ALL="en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434 
export LC_CTYPE="C"
