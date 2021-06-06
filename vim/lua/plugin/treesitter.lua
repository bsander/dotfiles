require "nvim-treesitter.configs".setup {
  -- ensure_installed = "all",     -- one of "all", "language", or a list of languages
  ensure_installed = "maintained", -- one of "all", "language", or a list of languages
  highlight = {
    enable = true -- false will disable the whole extension
    -- use_languagetree = true, -- Use this to enable language injection (this is very unstable)
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "+",
      node_incremental = "]",
      scope_incremental = "grc",
      node_decremental = "["
    }
  },
  indent = {
    enable = true
  },
  refactor = {
    highlight_definitions = {enable = true},
    highlight_current_scope = {enable = false}
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["a,"] = "@parameter.outer",
        ["i,"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner" -- Doesn't work yet
        -- ["ac"] = "@comment.outer", -- Doesn't work yet https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
        -- ["ic"] = "@comment.inner", -- Doesn't exist?
      }
    }
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
