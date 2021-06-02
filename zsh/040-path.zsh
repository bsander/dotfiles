## FNM (like NVM) - https://github.com/Schniz/fnm
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --shell zsh)"
source "/opt/homebrew/etc/profile.d/z.sh"

path=(
  "$DOTFILES/bin"
  "$HOME/.fnm" # Node version manager
  "$GOPATH/bin"
  "/usr/local/opt/python/libexec/bin"
  "/usr/local/bin"
  "./bin"
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/build-tools/30.0.1"
  "$HOME/.cargo/bin"
  $path
)

fpath=(
  "$DOTFILES/zsh/functions"
  "$DOTFILES/zsh/completions"
  "$(brew --prefix)/share/zsh/site-functions"
  $fpath
)

autoload ${fpath[1]}/*(:t)
