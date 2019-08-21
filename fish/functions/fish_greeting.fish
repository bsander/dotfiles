function fish_greeting
  grep -v '^#' "$DOTFILES/tipstricks.ini" | shuf -n 1 -
end

