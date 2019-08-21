# set -gx BASE_EDITOR "emacs -nw"
# # set -gx BASE_VISUAL code
# set -gx BASE_VISUAL emacs
set -gx BROWSER open
set -gx PAGER less

# set -gx EDITOR "$BASE_EDITOR -w"
# set -gx VISUAL "$BASE_VISUAL -w"
set -gx EDITOR "nvim"
set -gx VISUAL "vimr" # Don't wait for command completion

set -q GIT_EDITOR
or set -gx GIT_EDITOR "$EDITOR"

set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket

# FZF global options
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
set -gx FZF_PREVIEW_FILE_CMD 'bat -r :10'
set -gx FZF_PREVIEW_DIR_CMD 'exa --tree --level 1 --group-directories-first'
set -gx FZF_CD_COMMAND 'fd --type d'
set -gx FZF_CD_WITH_HIDDEN_COMMAND 'fd --hidden --type d'

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
set -gx nvm_prefix /usr/local/opt/nvm

## Set locale properties
set -q LANG
or set -gx LANG "en_US.UTF-8"

set -q LC_ALL
or set -gx LC_ALL "en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434
set -gx LC_CTYPE "C"

## Ripgrep config file
set -gx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

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
