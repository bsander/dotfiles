## https://spacefish.matchai.me/docs/Options.html#char

function __sf_section_git_hash -d 'Show current git shorthash'
    __sf_util_set_default SPACEFISH_GIT_HASH_SHOW true
    __sf_util_set_default SPACEFISH_GIT_HASH_PREFIX ''
    __sf_util_set_default SPACEFISH_GIT_HASH_SUFFIX ' '
    __sf_util_set_default SPACEFISH_GIT_HASH_COLOR white

    # If SPACEFISH_GIT_HASH_SHOW is false, don't show the gIT_HASH section
    [ $SPACEFISH_GIT_HASH_SHOW = false ]
    and return

    # Return if the current working directory is not a Git repository
    [ -z (__sf_util_git_branch) ]
    and return

    __sf_lib_section \
        $SPACEFISH_GIT_HASH_COLOR \
        $SPACEFISH_GIT_HASH_PREFIX \
        (git rev-parse --short HEAD) \
        $SPACEFISH_GIT_HASH_SUFFIX
end

# set SPACEFISH_PROMPT_ORDER exec_time exit_code jobs user dir git_hash git \
#     node docker rust haskell kubecontext line_sep vi_mode char

set SPACEFISH_PROMPT_ORDER exec_time exit_code jobs user dir git_hash git \
    line_sep vi_mode char

set SPACEFISH_DIR_PREFIX ''

set SPACEFISH_GIT_PREFIX ''
set SPACEFISH_GIT_SYMBOL ' '
set SPACEFISH_GIT_STATUS_PREFIX ' '
set SPACEFISH_GIT_STATUS_SUFFIX ' '
set SPACEFISH_GIT_STATUS_UNTRACKED (tint: white '✦ ')
set SPACEFISH_GIT_STATUS_ADDED (tint: green '● ')
set SPACEFISH_GIT_STATUS_MODIFIED (tint: magenta '⊙ ')
set SPACEFISH_GIT_STATUS_RENAMED (tint: magenta '↪ ')
set SPACEFISH_GIT_STATUS_DELETED (tint: red '✘ ')
set SPACEFISH_GIT_STATUS_STASHED (tint: blue '⚑ ')
set SPACEFISH_GIT_STATUS_UNMERGED (tint: red '⁉ ')
set SPACEFISH_GIT_STATUS_AHEAD (tint: yellow '⇡ ')
set SPACEFISH_GIT_STATUS_BEHIND (tint: yellow '⇣ ')
set SPACEFISH_GIT_STATUS_DIVERGED (tint: red '⇡ '⇣)

set SPACEFISH_NODE_DEFAULT_VERSION (node -v)
set SPACEFISH_KUBECONTEXT_SHOW false

set SPACEFISH_JOBS_SYMBOL ⏳

set SPACEFISH_EXIT_CODE_SHOW true
set SPACEFISH_EXIT_CODE_SYMBOL '×'

set SPACEFISH_CHAR_SYMBOL '$'
