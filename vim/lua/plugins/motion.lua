return {
  -- Enhanced motion plugin - base for flit
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  -- Repeat functionality for motions
  {
    "tpope/vim-repeat",
    keys = { "." },
  },

  -- Enhanced f/F/t/T motions building on leap
  {
    "ggandor/flit.nvim",
    dependencies = { "ggandor/leap.nvim", "tpope/vim-repeat" },
    keys = {
      { "f", mode = { "n", "x", "o" }, desc = "Flit forward to" },
      { "F", mode = { "n", "x", "o" }, desc = "Flit backward to" },
      { "t", mode = { "n", "x", "o" }, desc = "Flit forward till" },
      { "T", mode = { "n", "x", "o" }, desc = "Flit backward till" },
    },
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        labeled_modes = "nvo",
        clever_repeat = true,
        multiline = true,
        opts = {}
      }
    end,
  },

  -- Multiple cursor editing
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    keys = {
      { "<leader>ma", mode = { "n", "x" }, desc = "Match add cursor" },
      { "<leader>mA", mode = { "n", "x" }, desc = "Match add all cursors" },
      { "<leader>ms", mode = { "n", "x" }, desc = "Match skip cursor" },
      { "<leader>mj", mode = { "n", "x" }, desc = "Add cursor below" },
      { "<leader>mk", mode = { "n", "x" }, desc = "Add cursor above" },
      { "<leader>mJ", mode = { "n", "x" }, desc = "Skip cursor below" },
      { "<leader>mK", mode = { "n", "x" }, desc = "Skip cursor above" },
      { "<leader>mt", mode = { "n", "x" }, desc = "Toggle cursor mode" },
      { "<c-leftmouse>", mode = "n", desc = "Add cursor at mouse" },
      { "<c-leftdrag>", mode = "n", desc = "Drag cursor" },
      { "<c-leftrelease>", mode = "n", desc = "Release cursor drag" },
    },
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Match/skip cursors by word/selection
      set({"n", "x"}, "<leader>ma", function() mc.matchAddCursor(1) end)
      set({"n", "x"}, "<leader>mA", function() mc.matchAllAddCursors() end)
      set({"n", "x"}, "<leader>ms", function() mc.matchSkipCursor(1) end)

      -- Add/skip cursors vertically
      set({"n", "x"}, "<leader>mj", function() mc.lineAddCursor(1) end)
      set({"n", "x"}, "<leader>mk", function() mc.lineAddCursor(-1) end)
      set({"n", "x"}, "<leader>mJ", function() mc.lineSkipCursor(1) end)
      set({"n", "x"}, "<leader>mK", function() mc.lineSkipCursor(-1) end)

      -- Toggle cursor mode
      set({"n", "x"}, "<leader>mt", mc.toggleCursor)

      -- Mouse-based cursor management
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)
    end,
  },
}
