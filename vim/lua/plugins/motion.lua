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
}
