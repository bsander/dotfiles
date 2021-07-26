local g = vim.g
local env = vim.env

env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"
env.FZF_DEFAULT_OPTS = "--cycle --reverse --exact --inline-info --tiebreak=begin,length,index"

g.fzf_preview_window = {"down:50%:+{2}-/2", "ctrl-o"}
g.fzf_layout = {window = {width = 0.8, height = 0.8}}
g.fzf_history_dir = "~/.local/share/fzf-history"

-- Load LSP-Fuzzy only after the above values are set
require("lspfuzzy").setup {}

local fzf = require("fzf")
local fzf_helpers = require("fzf.helpers")

-- Navigate recent directories and cd into them
function _G.FZFProject()
  coroutine.wrap(
    function()
      local choice =
        fzf.fzf(
        fzf_helpers.cmd_line_transformer(
          "zoxide query --list",
          function(x)
            return x
          end
        )
      )
      if choice then
        vim.cmd(string.format("cd %s", choice[1]))
        vim.cmd(":FZFFiles")
      end
    end
  )()
end
