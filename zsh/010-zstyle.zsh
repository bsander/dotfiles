# Periodic auto-update on Zsh startup: 'ask' or 'no'.
zstyle ':z4h:' auto-update 'ask'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '3'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard 'mac'
# When fzf menu opens on TAB, another TAB moves the cursor down ('tab:down')
# or accepts the selection and triggers another TAB-completion ('tab:repeat')?
zstyle ':z4h:fzf-complete' fzf-bindings 'tab:repeat'
# When fzf menu opens on Shift+Down, TAB moves the cursor down ('tab:down')
# or accepts the selection and triggers another Shift+Down ('tab:repeat')?
zstyle ':z4h:cd-down' fzf-bindings 'tab:down'
# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Send these files over to the remote host when connecting over ssh.
# Multiple files can be listed here.
zstyle ':z4h:ssh:*' send-extra-files '~/.iterm2_shell_integration.zsh'
# Disable automatic teleportation of z4h over ssh when connecting to some-host.
# This makes `ssh some-host` equivalent to `command ssh some-host`.
zstyle ':z4h:ssh:some-host' passthrough 'yes'

# Move the cursor to the end when Up/Down fetches a command from history?
zstyle ':zle:up-line-or-beginning-search' leave-cursor 'yes'
zstyle ':zle:down-line-or-beginning-search' leave-cursor 'yes'
