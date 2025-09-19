if status is-interactive
    # Commands to run in interactive sessions can go here
end

# IntelliShell
set -gx INTELLI_HOME "/Users/sb/Library/Application Support/org.IntelliShell.Intelli-Shell"
# set -gx INTELLI_SEARCH_HOTKEY \c@
# set -gx INTELLI_VARIABLE_HOTKEY \cl
# set -gx INTELLI_BOOKMARK_HOTKEY \cb
# set -gx INTELLI_FIX_HOTKEY \cx
# set -gx INTELLI_SKIP_ESC_BIND 0
# alias is="intelli-shell"
fish_add_path "$INTELLI_HOME/bin"
intelli-shell init fish | source

# uv
fish_add_path "/Users/sb/.local/bin"
