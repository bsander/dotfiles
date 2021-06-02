local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  file_panel = {
    use_icons = false, -- Requires nvim-web-devicons
  },
  key_bindings = {
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<C-j>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
      ["<C-k>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<C-h>"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<Leader>t"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]         = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]    = cb("next_entry"),
      ["k"]         = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]      = cb("prev_entry"),
      ["<cr>"]      = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]         = cb("select_entry"),
      ["R"]         = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<C-j>"]     = cb("select_next_entry"),
      ["<C-k>"]   = cb("select_prev_entry"),
      ["<C-h>"] = cb("focus_files"),
      ["<Leader>t"] = cb("toggle_files"),
    }
  }
}
