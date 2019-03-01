## https://spacefish.matchai.me/docs/Options.html#char

set SPACEFISH_PROMPT_ORDER exec_time exit_code jobs user dir git \
    node docker rust haskell kubecontext line_sep vi_mode char

set SPACEFISH_DIR_PREFIX ''

set SPACEFISH_GIT_PREFIX ''
set SPACEFISH_GIT_SYMBOL (string join ' ' (git rev-parse --short HEAD) " ")
set SPACEFISH_GIT_STATUS_PREFIX ' '
set SPACEFISH_GIT_STATUS_SUFFIX ' '
set SPACEFISH_GIT_STATUS_UNTRACKED (tint: white "✦ ")
set SPACEFISH_GIT_STATUS_ADDED (tint: green "● ")
set SPACEFISH_GIT_STATUS_MODIFIED (tint: magenta "⊙ ")
set SPACEFISH_GIT_STATUS_RENAMED (tint: magenta "↪ ")
set SPACEFISH_GIT_STATUS_DELETED (tint: red "✘ ")
set SPACEFISH_GIT_STATUS_STASHED (tint: blue "⚑ ")
set SPACEFISH_GIT_STATUS_UNMERGED (tint: red "⁉ ")
set SPACEFISH_GIT_STATUS_AHEAD (tint: yellow "⇡ ")
set SPACEFISH_GIT_STATUS_BEHIND (tint: yellow "⇣ ")
set SPACEFISH_GIT_STATUS_DIVERGED (tint: red "⇡ "⇣)

set SPACEFISH_NODE_DEFAULT_VERSION (node -v)
set SPACEFISH_KUBECONTEXT_SHOW false

set SPACEFISH_JOBS_SYMBOL ⏳

set SPACEFISH_EXIT_CODE_SHOW true
set SPACEFISH_EXIT_CODE_SYMBOL '×'

set SPACEFISH_CHAR_SYMBOL '$'
