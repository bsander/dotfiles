local g = vim.g
local map = vim.api.nvim_set_keymap

-- Leader: <Space>
g.mapleader = " "
-- Local leader: , (comma)
g.maplocalleader = ","

-- map the leader key to nothing
map("n", "<Space>", "", {})

local options = {noremap = true, silent = false}

-- Navigate wrapped lines
map("n", "j", "gj", options)
map("n", "k", "gk", options)
-- Redo last action
map("n", "U", "<C-r>", options)
-- Clear current search
map("n", "<S-Esc>", ':let @/ = ""<CR><Esc>', options)
-- Consistency in search direction
-- Conflicts with pulse plugin https://github.com/inside/vim-search-pulse
-- -- map("n", "n", "/<CR>", options)
-- map("n", "N", "?<CR>", options)
-- map("n", "?", "/<CR>", options)
-- Swap 0 and ^
map("n", "0", "^", options)
map("n", "^", "0", options)
-- Normalize replace
map("n", "R", "cl", options)
map("v", "R", "c", options)
-- Disable macro recording
map("n", "q", "<NOP>", options)
map("n", "Q", "<NOP>", options)
map("n", "Q", "<NOP>", options)

-- [m]ove instead of [d]elete
map("", "m", "d", options)
map("", "mm", "dd", options)
map("", "M", "D", options)
-- make d actually delete using black hole register
map("", "dd", '"_dd', options)
map("", "d", '"_d', options)
map("", "D", '"_D', options)
map("x", "p", '"_dP', options) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
map("v", "p", '"_dP', options)
-- Yank to global clipboard with `g`
map("", "gy", '"+y', {noremap = false})
map("n", "gyy", '"+yy', {noremap = false})
map("n", "gY", '"+Y', {noremap = false})
map("", "gm", '"+m', {noremap = false})
map("n", "gmm", '"+mm', {noremap = false})
map("n", "gM", '"+M', {noremap = false})
map("n", "gp", '"+p', {noremap = false})
map("n", "gP", '"+P', {noremap = false})
map("x", "gp", '"_d"+P', options) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
map("v", "gp", '"_d"+P', options)

-- Completions
map("i", "<C-Space>", "compe#complete()", {noremap = true, expr = true})
map("i", "<CR>", 'compe#confirm("<CR>")', {noremap = true, expr = true})
map("i", "<C-x>", 'compe#close("<C-x>")', {noremap = true, expr = true})

-- Navigate in insert mode
map("!", "<C-h>", "<Left>", options)
map("!", "<C-l>", "<Right>", options)
map("!", "<C-k>", "<Up>", options)
map("!", "<C-j>", "<Down>", options)
map("!", "<C-a>", "<Home>", options)
map("!", "<C-e>", "<End>", options)
map("!", "<C-d>", "<Delete>", options)
map("!", "<C-c>", "<Esc>", options) -- CTRL-C doesn't trigger the InsertLeave autocmd

-- Move lines around
map("n", "K", [[:m-2<CR>]], options)
map("n", "J", [[:m+<CR>]], options)
map("v", "K", [[:m '<-2<CR>gv=gv]], options)
map("v", "J", [[:m '>+<CR>gv=gv]], options)
-- Duplicate lines
map("n", "<Leader>xk", [[:t-<CR>]], options)
map("n", "<Leader>xj", [[:t+0<CR>]], options)
map("v", "<Leader>xj", [[:t '<-1<CR>gv=gv]], options)
map("v", "<Leader>xk", [[:t '>+0<CR>gv=gv]], options)
-- Join lines
map("", "H", "k:join<CR>", options)
map("", "L", "<CMD>join<CR>", options)

-- Editing and sourcing of Neovim config
map("n", "<leader>ve", ":edit $MYVIMRC<CR>", options)
map("n", "<leader>vs", ":write | luafile $MYVIMRC<CR>", options)
map("n", "<leader>vi", ":PackerInstall<CR>", options)
map("n", "<leader>vu", ":PackerSync<CR>", options)

-- Save files
map("n", "gs", "<CMD>write<CR>", options)
map("", "<D-s>", "<CMD>write<CR>", options) -- Cmd+s on mac for habit
map("n", "<leader>fs", "<CMD>write<CR>", options)
map("n", "<leader>fS", "':saveas ' . expand('%:p')", {noremap = true, expr = true})
map("n", "<leader>fR", ":Rename ", options)
map("n", "<leader>fa", ":wall<CR>", options)

-- Delete files
map("n", "<leader>fD", ':call delete(expand("%")) | BufferClose!<CR>', options)

-- Find files
-- map("n", "<leader>fr", ":Telescope oldfiles<CR>", options) -- Recently opened
map("n", "<leader>fr", ":FZFHistory<CR>", options) -- Recently opened
map("n", "<leader>fg", ":GFiles?<CR>", options) -- Changed files in Git
-- map("n", "<leader>ff", ":Telescope find_files<CR>", options) -- in cwd
map("n", "<leader>ff", ":FZFFiles<CR>", options) -- in cwd
map(
  "n",
  "<leader>fp",
  [[<cmd>lua require'telescope'.extensions.z.list{ cmd = {'zoxide', 'query', '--list', '--score'} }<CR>]],
  options
) -- go to directory from `z`
map("n", "<leader>fb", ":Telescope file_browser<CR>", options) -- Browse files

-- Lists of files
map("n", "<leader>fq", ":FZFQuickFix<CR>", options) -- Navigate quickfix content
map("n", "<leader>fl", ":FZFLocList<CR>", options) -- Navigate loclist content

-- Find inside files
-- map("n", "<leader>/", ":Telescope live_grep<CR>", options) -- in cwd
map("n", "<leader>/", ":FZFRg<CR>", options) -- in cwd
-- map("n", "<leader>;", ":Telescope current_buffer_fuzzy_find<CR>", options) -- Current buffer
map("n", "<leader>;", ":FZFBLines<CR>", options) -- Current buffer

-- Navigate buffers
-- map("n", "<leader><Tab>", ":Telescope buffers<CR>", options)
map("n", "<leader><Tab>", ":Buffers<CR>", options)
map("n", "<Tab>", "<CMD>BufferNext<CR>", options)
map("n", "<S-Tab>", "<CMD>BufferPrevious<CR>", options)

-- New buffer
map("n", "<Leader>bn", "<CMD>enew<CR>", options)
map("n", "<Leader>fn", "<CMD>enew<CR>", options) -- or mnemonically "file new"

-- Close buffers
map("n", "<Leader>bd", "<CMD>BufferClose<CR>", options)
map("n", "<Leader>bD", "<CMD>BufferClose!<CR>", options)
map("n", "<Leader>bM", "<CMD>BufferCloseAllButCurrent<CR>", options) -- Close other buffers

-- Reload buffer
map("n", "<Leader>br", "<CMD>edit<CR>", options)
map("n", "<Leader>bR", "<CMD>edit!<CR>", options)

-- Commands
-- map("n", "<Leader><Leader>", "<CMD>Telescope command_history<CR>", options)
map("n", "<Leader><Leader>", "<CMD>History:<CR>", options)
map("n", "<Leader>h", "<CMD>Telescope help_tags<CR>", options)
map("n", "::", "<CMD>Telescope commands<CR>", options)

-- Messages
map("n", "<Leader>bm", "<CMD>Bufferize messages<CR>", options)

-- "Windows"
map("n", "<Leader>wd", "<C-W>c", options) -- Close window
map("n", "<Leader>wM", "<C-W>o", options) -- Maximize window
-- Focus window
map("n", "<Leader>wh", "<C-W>h", options) -- Focus window left
map("n", "<Leader>wj", "<C-W>j", options) -- Focus window down
map("n", "<Leader>wk", "<C-W>k", options) -- Focus window up
map("n", "<Leader>wl", "<C-W>l", options) -- Focus window right
-- Move window
map("n", "<Leader>wH", "<C-W>H", options) -- Move window left
map("n", "<Leader>wJ", "<C-W>J", options) -- Move window down
map("n", "<Leader>wK", "<C-W>K", options) -- Move window up
map("n", "<Leader>wL", "<C-W>L", options) -- Move window right

-- Toggles between hover doc
-- Kinda slow
function ToggleHover()
  local lsp = require("lspsaga.hover")
  if lsp.has_saga_hover() then
    return lsp.close_hover_window()
  else
    return lsp.render_hover_doc()
  end
end

-- LSP
-- This can be smarter: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
map("n", "gh", "<CMD>lua ToggleHover()<CR>", options) -- Toggle hover doc
map("n", "<C-n>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', options) -- scroll down hover doc
map("n", "<C-N>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', options) -- scroll up hover doc
-- map('n', 'gh', '<CMD>lua vim.lsp.buf.hover()<CR>', options) -- Show hover information
-- map("n", "gH", "<CMD>lua vim.lsp.buf.signature_help()<CR>", options) -- Signature help?
map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", options) -- Go to definition
map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", options) -- Go to implementation(s)
map("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", options) -- Type definition
-- map('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', options) -- Go to references
map("n", "gr", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], options) -- Go to references
-- map('n', 'gR', '<CMD>lua vim.lsp.buf.rename()<CR>', options) -- Rename
map("n", "gR", '<CMD>lua require("lspsaga.rename").rename()<CR>', options) -- Rename
-- map('n', 'g.', '<CMD>lua vim.lsp.buf.code_action()<CR>', options) -- Code action
map("n", "g.", '<CMD>lua require("lspsaga.codeaction").code_action()<CR>', options) -- Code action
map("v", "g.", '<CMD>lua require("lspsaga.codeaction").range_code_action()<CR>', options) -- Code action

-- Navigate errors/diagnostics
map("n", "gH", "<CMD>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", options) -- Code action
map("n", "[e", "<CMD>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", options) -- Code action
map("n", "]e", "<CMD>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", options) -- Code action

-- Git
map("n", "<Leader>gg", "<CMD>Neogit<CR>", options)

-- Toggles and UI
-- map("n", "<Leader>tc", "<CMD>Telescope colorscheme<CR>", options)
map("n", "<Leader>tc", "<CMD>Colors<CR>", options)
map("n", "<Leader>tn", "<CMD>set invnumber<CR>", options)
map("n", "<Leader>tw", "<CMD>set invwrap<CR>", options)

-- Commenting
map("n", "gca", "<Plug>NERDCommenterAppend", options)

-- Quit
map("n", "<Leader>qq", "<CMD>confirm qall<CR>", options)
map("n", "<Leader>QQ", "<CMD>qall!<CR>", options)
