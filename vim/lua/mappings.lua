local g = vim.g
local map = vim.api.nvim_set_keymap

-- Leader: <Space>
g.mapleader = " "
-- Local leader: , (comma)
g.maplocalleader = ","

-- map the leader key to nothing
map("n", "<Space>", "", {})

local options = {noremap = true, silent = false}
local roptions = {noremap = false, silent = false}

-- Navigate wrapped lines
map("n", "j", "gj", options)
map("n", "k", "gk", options)
-- Redo last action
map("n", "U", "<C-r>", options)
-- Clear current search
map("n", "<S-Esc>", ':let @/ = ""<CR><Esc>', options)
-- Consistency in search direction
map("n", "n", "/<CR>", options)
map("n", "N", "?<CR>", options)
map("n", "?", "/<CR>", options)
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

-- [Y]ank until end of line
map("", "Y", "y$", options)
map("", "gY", "gy$", roptions)
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
map("", "gy", '"+y', options)
map("n", "gyy", '"+yy', options)
map("n", "gY", '"+Y', options)
map("", "gm", '"+m', options)
map("n", "gmm", '"+mm', options)
map("n", "gM", '"+M', options)
map("n", "gp", '"+p', options)
map("n", "gP", '"+P', options)
map("x", "gp", '"_d"+P', options) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
map("v", "gp", '"_d"+P', options)

-- Completions
-- map("i", "<C-Space>", "compe#complete()", {noremap = true, expr = true})
-- map("i", "<CR>", 'compe#confirm("<CR>")', {noremap = true, expr = true})
-- map("i", "<C-x>", 'compe#close("<C-x>")', {noremap = true, expr = true})

-- Locate treesitter objects
-- omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
map("o", "?", ":<C-U>lua require('tsht').nodes()<CR>", roptions)
-- vnoremap <silent> m :lua require('tsht').nodes()<CR>
map("v", "?", ":<C-U>lua require('tsht').nodes()<CR>", options)
-- Navigate in insert mode
map("i", "<C-h>", "<Left>", options)
map("i", "<C-l>", "<Right>", options)
map("i", "<C-k>", "<Up>", options)
map("i", "<C-j>", "<Down>", options)
map("i", "<C-a>", "<Home>", options)
map("i", "<C-e>", "<End>", options)
map("i", "<C-d>", "<Delete>", options)
map("i", "<C-c>", "<Esc>", options) -- CTRL-C doesn't trigger the InsertLeave autocmd
-- Intuitive surround in insert mode
map("i", "''", "<C-s>'", roptions)
map("i", '""', '<C-s>"', roptions)
map("i", "``", "<C-s>`", roptions)
map("i", "((", "<C-s>)", roptions)
map("i", "))", "<C-s><C-s>(", roptions)
map("i", "{{", "<C-s>{", roptions)
map("i", "}}", "<C-s><C-s>{", roptions)
map("i", "[[", "<C-s>[", roptions)
map("i", "]]", "<C-s><C-s>[", roptions)
map("i", "<<", "<><Left>", roptions)

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
-- Swap line elements
map("", "<Leader>xC", "<CMD>ISwap<CR>", options)
map("", "<Leader>xc", "<CMD>ISwapWith<CR>", options)

-- Intuitive word-operator motions
-- map("", "vw", "viw", roptions)
-- map("", "mw", "miw", roptions)
-- map("", "dw", "diw", roptions)
-- map("", "cw", "ciw", roptions)
map("", "go", "o<Esc>[] cc", roptions)
map("", "gO", "O<Esc>[] cc", roptions)

--- Quick navigations
-- "[ " "] ": Add blank line
map("", "[<Space>", "<cmd>call append(line('.')-1, '')<CR>", options)
map("", "]<Space>", "<cmd>call append(line('.'), '')<CR>", options)
map("", "[]<Space>", "[ ] ", roptions)
-- [e ]e: Errors
map("", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", options)
map("", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", options)
-- [q ]q: Quickfix list
map("", "[q", "<cmd>cprevious<CR>", options)
map("", "]q", "<cmd>cnext<CR>", options)
--  [cc ]cc: Comment above/below
map("", "[c", "O<Esc>gcA", roptions)
map("", "]cc", "o<Esc>gcA", roptions)
-- [f ]f: Folding
-- [[f ]]f: Recursive folding

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
map("n", "<leader>fr", ":FZFHistory<CR>", options) -- Recently opened
map("n", "<leader>fg", ":GFiles?<CR>", options) -- Changed files in Git
map("n", "<leader>ff", ":FZFFiles<CR>", options) -- in cwd
map("n", "<leader>fp", [[<cmd>lua FZFProject()<CR>]], options) -- go to directory from `z`
map("n", "<leader>f/", [[<cmd>lua FZFGrepDir()<CR>]], options) -- go to directory from `z`
map("n", "<leader>fb", ":Telescope file_browser<CR>", options) -- Browse files
map("n", "<leader>ft", ":CHADopen<CR>", options) -- Browse files

-- Lists of files
map("n", "<leader>fq", ":FZFQuickFix<CR>", options) -- Navigate quickfix content
map("n", "<leader>fl", ":FZFLocList<CR>", options) -- Navigate loclist content

-- Find inside files
map("n", "<leader>/", ":FZFRg<CR>", options) -- in cwd
map("n", "<leader>;", ":FZFBLines<CR>", options) -- Current buffer

-- Navigate buffers
map("n", "<leader><Tab>", ":Buffers<CR>", options)
map("n", "<C-->", "<CMD>bprevious<CR>", options)
map("n", "<C-=>", "<CMD>bnext<CR>", options)
-- map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", options)
map("n", "<Tab>", "<CMD>bnext<CR>", options)
-- map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", options)
map("n", "<S-Tab>", "<CMD>bprevious<CR>", options)

-- New buffer
map("n", "<Leader>bn", "<CMD>enew<CR>", options)
map("n", "<Leader>fn", "<CMD>enew<CR>", options) -- or mnemonically "file new"

-- Close buffers
map("n", "<Leader>bd", "<CMD>Bdelete<CR>", options)
map("n", "<Leader>bD", "<CMD>Bdelete!<CR>", options)
-- map("n", "<Leader>bo", "<CMD>BufferCloseAllButCurrent<CR>", options) -- Close other buffers
map("n", "<Leader>bo", "<CMD>BufferLineCloseLeft<CR><CMD>BufferLineCloseRight<CR>", options) -- Close other buffers

-- Reload buffer
map("n", "<Leader>br", "<CMD>edit<CR>", options)
map("n", "<Leader>bR", "<CMD>edit!<CR>", options)

-- Git
-- map("n", "<Leader>gb", ":Git blame<CR>", options)
map("n", "<Leader>gb", ":TigBlame<CR>", options)
-- <Leader>gm: Git messenger (show line history info)

-- Commands
map("n", "<Leader><Leader>", "<CMD>History:<CR>", options)
map("n", "<Leader>hh", "<CMD>Helptags<CR>", options)
map("n", "::", "<CMD>Commands<CR>", options)
map("n", "<Leader>hb", "<CMD>Maps<CR>", options)
map("n", "<Leader>hm", "<CMD>Bufferize verbose map<CR>", options) -- List all normal mode maps
map("n", "<Leader>hi", "<CMD>Bufferize verbose imap<CR>", options) -- List all insert mode maps

-- Messages
map("n", "<Leader>bm", "<CMD>Bufferize messages<CR>", options)

-- "Windows"
map("n", "<Leader>wd", "<C-W>c", options) -- Close window
map("n", "<Leader>wo", "<C-W>o", options) -- Maximize window
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

-- LSP
-- This can be smarter: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
map("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", options) -- Show hover information
map("n", "gH", "<CMD>lua vim.lsp.buf.signature_help()<CR>", options) -- Signature help?
map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", options) -- Go to definition
map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", options) -- Go to implementation(s)
map("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", options) -- Type definition
map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", options) -- Go to references
map("n", "gR", "<CMD>lua vim.lsp.buf.rename()<CR>", options) -- Rename
map("n", "g.", "<CMD>lua vim.lsp.buf.code_action()<CR>", options) -- Code action

-- Format buffer
map("n", "<Leader>F", "<CMD>Format<CR>", options)
-- Git
map("n", "<Leader>gg", "<CMD>TigStatus<CR>", options)

-- Toggles and UI
map("", "<Leader>tc", "<CMD>Colors<CR>", options)
map("", "<Leader>tn", "<CMD>set invnumber<CR>", options)
map("", "<Leader>tw", "<CMD>set invwrap<CR>", options)
map("", "<Leader>tf", "<CMD>Filetypes<CR>", options)
map("", "<Leader>tq", "<CMD>TroubleToggle<CR>", options)
-- Navigate errors/diagnostics
map("", "<Leader>e", "<CMD>TroubleToggle lsp_document_diagnostics<CR>", options) -- Code action
map("", "<Leader>E", "<CMD>TroubleToggle lsp_workspace_diagnostics<CR>", options) -- Code action

--
map("n", "<Leader>tw", "<CMD>set invwrap<CR>", options)

-- -- Show cursor highlight
-- map(
--   "n",
--   "<Leader>cc",
--   [[<cmd>echo 'hi<' . synIDattr(synID(line('.'), col('.'), 1), 'name') . '> trans<' . synIDattr(synID(line('.'), col('.'), 0), 'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name') . '>'<CR>]],
--   options
-- )

-- Commenting
map("n", "gca", "<Plug>NERDCommenterAppend", options)

-- Quit
map("n", "<Leader>qq", "<CMD>confirm qall<CR>", options)
map("n", "<Leader>QQ", "<CMD>qall!<CR>", options)
