#!/bin/bash

# ANSI color codes
BLUE="\033[34m"
GREEN="\033[32m"
RED_COLOR="\033[31m"
DIM_GREY="\033[2;37m"
DARK_GREY="\033[90m"
RED="\033[31m"
RESET="\033[0m"

# Current directory - abbreviated intelligently from home
dir="${PWD/#$HOME/~}"
if [[ ${#dir} -gt 40 ]]; then
    # If too long, show ~ + last 2 path components
    dir="~/.../${PWD##*/../../}"
fi

# Git info (local only, no remote calls)
git_info=""
if git rev-parse --is-inside-work-tree &>/dev/null; then
    # Get branch/worktree name
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "detached")

    # Get diff stats (local only)
    stats=$(git diff --shortstat 2>/dev/null)
    added=""
    deleted=""
    if [[ -n "$stats" ]]; then
        # Parse insertions and deletions
        if [[ "$stats" =~ ([0-9]+)\ insertion ]]; then
            added="${GREEN}+${BASH_REMATCH[1]}${RESET}"
        fi
        if [[ "$stats" =~ ([0-9]+)\ deletion ]]; then
            deleted="${RED_COLOR}-${BASH_REMATCH[1]}${RESET}"
        fi
    fi

    # Combine git info
    git_info=" $branch"
    [[ -n "$added" || -n "$deleted" ]] && git_info+=" [$added$deleted]"
fi

# Context window percentage (provided via env var by Claude Code)
context_val="${CLAUDE_CONTEXT_PERCENTAGE:-0}"
if (( context_val < 50 )); then
    context="${DIM_GREY}${context_val}%${RESET}"
elif (( context_val < 75 )); then
    context="${DARK_GREY}${context_val}%${RESET}"
else
    context="${RED}${context_val}%${RESET}"
fi

# Output: dir @ branch | context
echo -e "${BLUE}${dir}${RESET} @${git_info} | ${context}"
