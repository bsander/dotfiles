# set -gx BASE_EDITOR "emacs -nw"
# # set -gx BASE_VISUAL code
# set -gx BASE_VISUAL emacs
set -gx BROWSER open
set -gx PAGER less

# set -gx EDITOR "$BASE_EDITOR -w"
# set -gx VISUAL "$BASE_VISUAL -w"
set -gx EDITOR nvim
set -gx VISUAL nvim

set -q GIT_EDITOR
or set -gx GIT_EDITOR "nvim --wait"

set -gx NVIM_LISTEN_ADDRESS /tmp/nvimsocket

# FZF global options
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
set -gx FZF_DEFAULT_OPTS '--height=40% --exact --margin 1,4'

## kubectl: Always consider local `kube-config` file
# set -gx KUBECONFIG "./kube-config"

## Go: Subdir within $PROJECTS
set -gx GOPATH "$PROJECTS/go"

## Per-dir environment configuration
# eval (direnv hook fish)

# ## NVM Setup
# set -gx NVM_DIR "$HOME/.nvm"
# set -gx nvm_prefix /usr/local/opt/nvm

# ## Set locale properties
# set -q LANG
# or set -gx LANG "en_US.UTF-8"

# set -q LC_ALL
# or set -gx LC_ALL "en_US.UTF-8"

## Fix for `tr: Illegal byte sequence`: https://unix.stackexchange.com/a/141434
set -gx LC_CTYPE C

## Ripgrep config file
set -gx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

## docker compose build faster
set -gx COMPOSE_BAKE 1
# set -gx BUILDKIT_PROGRESS plain
set -gx COMPOSE_DOCKER_CLI_BUILD 1
set -gx DOCKER_BUILDKIT 1

## Homebrew
set -gx HOMEBREW_NO_ENV_HINTS 1
