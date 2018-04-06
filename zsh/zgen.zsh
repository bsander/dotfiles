#!/usr/bin/env bash

export ZGEN_DIR="$DOTFILES/repos/zgen"
export ZGEN_RESET_ON_CHANGE=("$DOTFILES/dotfiles/zshrc.zsh" "$DOTFILES/zsh/zgen.zsh" "$DOTFILES/zsh/plumbing.zsh")
source "$ZGEN_DIR/zgen.zsh"

if ! zgen saved; then
  ## Optimized and extended zsh-syntax-highlighting
  zgen load "zdharma/fast-syntax-highlighting"

  ## Up and Down keys search for typed input in history
  zgen load "zsh-users/zsh-history-substring-search"

  ## Integrated terminal workflow with Zshell
  ## Disabled: pinfo command not found
  # zgen load "zdharma/zconvey"

  ## geometry is a minimal, fully customizable and composable zsh prompt theme
  # zgen load "geometry-zsh/geometry"

  # ## My own theme
  # zgen load "mafredri/zsh-async"
  # zgen load "$DOTFILES/repos/zsh-prompt/pure.zsh"

  ## Spaceship theme
  zgen oh-my-zsh
  # zgen load "denysdovhan/spaceship-zsh-theme" spaceship
  # zgen load "bsander/spaceship-zsh-theme" spaceship
  zgen load "$PROJECTS/spaceship-zsh-theme/spaceship.zsh"

  ## (^B) Browse interactive variables and other structures of Zshell
  zgen load "zdharma/zui"
  zgen load "zdharma/zbrowse"

  ## Additional completion definitions for Zsh.
  zgen load "zsh-users/zsh-completions"

  ## Zsh session restoration (crashes on reload???)
  zgen load "psprint/zsnapshot"

  ## (^F) Complete options from manual pages
  zgen load "psprint/zzcomplete"

  ## An oh-my-zsh plugin to help remembering those aliases you defined once
  # zgen load "djui/alias-tips" # Useless, suggests command that was just executed.

  ## Auto-expand aliases (do I want this?)
  # zgen oh-my-zsh plugins/globalias
  # zgen load "jarmo/expand-aliases-oh-my-zsh"

  ## Prefix cmd with sudo
  zgen oh-my-zsh "plugins/sudo"

  ## Ubuntu’s command-not-found equivalent for Homebrew on macOS (needs brew package too)
  ## Disabled due to slow.
  # zgen oh-my-zsh plugins/command-not-found

  ## Safe pasting (strip last newline)
  zgen oh-my-zsh "plugins/safe-paste"

  ## (^G) Per directory history for zsh, as well as global history (Annoying)
  # zgen oh-my-zsh "plugins/per-directory-history"

  ## Cryptographic agents
  zgen oh-my-zsh "plugins/gpg-agent"
  zgen oh-my-zsh "plugins/ssh-agent"

  ## Color ls and many command outputs
  zgen load "unixorn/warhol.plugin.zsh"

  ## (^R) Multi-word, syntax highlighted history searching for Zsh
  zgen load "zdharma/history-search-multi-word"


  ## Playground / Disabled / Inactive
  # zgen load "psprint/zsh-navigation-tools"
  # zgen load "psprint/zsh-editing-workbench"

  ## Save for next time
  zgen save
fi

## Somehow, completions appear to work when they are loaded after zgen has called compinit.
zgen oh-my-zsh "plugins/kubectl"
zgen oh-my-zsh "plugins/gitfast"
zgen load "lukechilds/zsh-better-npm-completion"
zgen load "docker/cli" contrib/completion/zsh/_docker
zgen load "docker/compose" contrib/completion/zsh/_docker-compose

## translates "..." into "../.."
## "If you are enabling url-quote-magic, make sure to load url-quote-magic first and then load manydots-magic."
## https://github.com/knu/zsh-manydots-magic#how-to-set-up
zgen load 'knu/zsh-manydots-magic' manydots-magic
