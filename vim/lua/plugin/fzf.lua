local g = vim.g
local env = vim.env

env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"
env.FZF_DEFAULT_OPTS = "--cycle --reverse --exact --inline-info --tiebreak=begin,length,index"

g.fzf_preview_window = {"down:50%:+{2}-/2", "ctrl-o"}
g.fzf_layout = {window = {width = 0.8, height = 0.8}}
g.fzf_history_dir = "~/.local/share/fzf-history"

-- Load LSP-Fuzzy only after the above values are set
require("lspfuzzy").setup {}
