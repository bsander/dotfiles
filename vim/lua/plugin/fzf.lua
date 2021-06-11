local g = vim.g
local env = vim.env

env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"
env.FZF_DEFAULT_OPTS = "--cycle --reverse --exact --inline-info --tiebreak=begin,length,index"

g.fzf_preview_window = {"down:50%", "ctrl-p"}
g.fzf_layout = {window = {width = 0.8, height = 0.8}}
