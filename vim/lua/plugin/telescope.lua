local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<S-CR>"] = actions.send_selected_to_qflist + actions.open_qflist + actions.select_default,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["<Esc>"] = actions.close,
      },
    },
  }
}