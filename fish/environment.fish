# set -gx BASE_EDITOR "emacs -nw"
# # set -gx BASE_VISUAL code
# set -gx BASE_VISUAL emacs
set -gx BROWSER open
set -gx PAGER less

# set -gx EDITOR "$BASE_EDITOR -w"
# set -gx VISUAL "$BASE_VISUAL -w"
set -gx EDITOR "emacsclient -a ''"
set -gx VISUAL "emacsclient -a '' -n" # Don't wait for command completion

set -gx GIT_EDITOR "$EDITOR"

## kubectl: Always consider local `kube-config` file
# set -gx KUBECONFIG "./kube-config"

## Go: Subdir within $PROJECTS
set -gx GOPATH "$PROJECTS/go"

## Homebrew cask: install to directory
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

## Per-dir environment configuration
# eval (direnv hook fish)

## NVM Setup
set -gx NVM_DIR "$HOME/.nvm"

## Set locale properties
set -q LANG
or set -gx LANG "en_US.UTF-8"

set -q LC_ALL
or set -gx LC_ALL "en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434
set -gx LC_CTYPE "C"


## Set PATH
set -gx PATH \
    ## Always check $DOTFILES for binaries
    "$DOTFILES/bin" \
    ## Always check relative ./bin/ for executables
    "./bin" \
    ## Include downloaded go binaries in path
    "$GOPATH/bin" \
    ## Homebrew python
    "/usr/local/opt/python/libexec/bin" \
    ## Original PATH
    $PATH
