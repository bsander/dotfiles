set -g BASE_EDITOR vim
set -g BASE_VISUAL code
set -g BROWSER open
set -g PAGER less

set -g EDITOR "$BASE_EDITOR -w"
set -g VISUAL "$BASE_VISUAL -w"

## kubectl: Always consider local `kube-config` file
# set -g KUBECONFIG "./kube-config"

## Go: Subdir within $PROJECTS
set -g GOPATH "$PROJECTS/go"

## Homebrew cask: install to directory
set -g HOMEBREW_CASK_OPTS "--appdir=/Applications"

## Per-dir environment configuration
# eval (direnv hook fish)

## NVM Setup
set -g NVM_DIR "$HOME/.nvm"

## Set locale properties
set -q LANG
or set -g LANG "en_US.UTF-8"

set -q LC_ALL
or set -g LC_ALL "en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434
set -g LC_CTYPE "C"
