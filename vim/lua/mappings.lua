local g = vim.g
local map = vim.api.nvim_set_keymap

local silent = true
local noremap = {noremap = true, silent = silent}
local remap = {noremap = false, silent = silent}

-- Leader: <Space>
g.mapleader = " "
-- Local leader: , (comma)
g.maplocalleader = ","

-- map the leader key to nothing
map("n", "<Space>", "", {})

-- Navigate wrapped lines
map("n", "j", "gj", noremap)
map("n", "k", "gk", noremap)
-- Redo last action
map("n", "U", "<C-r>", noremap)
-- Clear current search
map("n", "<Esc>", "<CMD>nohlsearch<CR>", noremap)
-- map("n", "<S-Esc>", ':let @/ = ""<CR><Esc>', options)
-- Consistency in search direction
map("n", "n", "/<CR>", noremap)
map("n", "N", "?<CR>", noremap)
map("n", "?", "/<CR>", noremap)
-- FZF find word under cursor
map("n", "g*", "<CMD>FzfLua grep_cword<CR>", noremap)
-- Swap 0 and ^
map("n", "0", "^", noremap)
map("n", "^", "0", noremap)
-- Normalize replace
map("n", "R", "cl", noremap)
map("v", "R", "c", noremap)
-- Disable macro recording
map("n", "q", "<NOP>", noremap)
map("n", "Q", "<NOP>", noremap)
map("n", "Q", "<NOP>", noremap)

-- [Y]ank until end of line
map("", "Y", "y$", noremap)
-- -- [m]ove instead of [d]elete
map("", "m", "d", noremap)
map("", "mm", "dd", noremap)
map("", "M", "D", noremap)
-- map("x", "p", '"_dP', options) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
-- map("v", "p", '"_dP', options)
-- Yank to global clipboard with `g`
map("", "gy", '"+y', noremap)
map("n", "gyy", '"+yy', noremap)
map("n", "gY", '"+Y', remap)
map("", "gm", '"+m', noremap)
map("n", "gmm", '"+mm', remap)
map("n", "gM", '"+M', remap)
map("", "gp", '"+p', noremap)
map("n", "gP", '"+P', noremap)
-- map("x", "gp", '"_d"+P', remap) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
-- map("v", "gp", '"_d"+P', remap)

-- Completions
-- map("i", "<C-Space>", "compe#complete()", {noremap = true, expr = true})
-- map("i", "<CR>", 'compe#confirm("<CR>")', {noremap = true, expr = true})
-- map("i", "<C-x>", 'compe#close("<C-x>")', {noremap = true, expr = true})

-- Locate treesitter objects
-- omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
map("o", "?", ":<C-U>lua require('tsht').nodes()<CR>", remap)
-- vnoremap <silent> m :lua require('tsht').nodes()<CR>
map("v", "?", ":<C-U>lua require('tsht').nodes()<CR>", noremap)
-- Navigate in insert mode
map("i", "<C-h>", "<Left>", noremap)
map("i", "<C-l>", "<Right>", noremap)
map("i", "<C-k>", "<Up>", noremap)
map("i", "<C-j>", "<Down>", noremap)
map("i", "<C-a>", "<Home>", noremap)
map("i", "<C-e>", "<End>", noremap)
map("i", "<C-d>", "<Delete>", noremap)
map("i", "<C-c>", "<Esc>", noremap) -- CTRL-C doesn't trigger the InsertLeave autocmd
-- -- Intuitive surround in insert mode
-- map("i", "''", "<C-s>'", roptions)
-- map("i", '""', '<C-s>"', roptions)
-- map("i", "``", "<C-s>`", roptions)
-- map("i", "((", "<C-s>)", roptions)
-- map("i", "))", "<C-s><C-s>(", roptions)
-- map("i", "{{", "<C-s>{", roptions)
-- map("i", "}}", "<C-s><C-s>{", roptions)
-- map("i", "[[", "<C-s>[", roptions)
-- map("i", "]]", "<C-s><C-s>[", roptions)
-- map("i", "<<", "<><Left>", options)

-- Move lines around
map("n", "K", [[:m-2<CR>]], noremap)
map("n", "J", [[:m+<CR>]], noremap)
map("v", "K", [[:m '<-2<CR>gv=gv]], noremap)
map("v", "J", [[:m '>+<CR>gv=gv]], noremap)
-- Duplicate lines
map("n", "<Leader>xk", [[:t-<CR>]], noremap)
map("n", "<Leader>xj", [[:t+0<CR>]], noremap)
map("v", "<Leader>xj", [[:t '<-1<CR>gv=gv]], noremap)
map("v", "<Leader>xk", [[:t '>+0<CR>gv=gv]], noremap)
-- Join lines
map("", "H", "k:join<CR>", noremap)
map("", "L", "<CMD>join<CR>", noremap)
-- Swap line elements
map("", "<Leader>xC", "<CMD>ISwap<CR>", noremap)
map("", "<Leader>xc", "<CMD>ISwapWith<CR>", noremap)

-- Intuitive word-operator motions
-- map("", "vw", "viw", roptions)
-- map("", "mw", "miw", roptions)
-- map("", "dw", "diw", roptions)
-- map("", "cw", "ciw", roptions)
map("", "go", "o<Esc>[] cc", remap)
map("", "gO", "O<Esc>[] cc", remap)

--- Quick navigations
-- "[ " "] ": Add blank line
map("", "[<Space>", "<cmd>call append(line('.')-1, '')<CR>", noremap)
map("", "]<Space>", "<cmd>call append(line('.'), '')<CR>", noremap)
map("", "[]<Space>", "[ ] ", remap)
-- [e ]e: Errors
map("", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", noremap)
map("", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", noremap)
-- [q ]q: Quickfix list
map("", "[q", "<cmd>cprevious<CR>", noremap)
map("", "]q", "<cmd>cnext<CR>", noremap)
--  [cc ]cc: Comment above/below
map("", "[c", "O<Esc>gcA", remap)
map("", "]cc", "o<Esc>gcA", remap)
-- [f ]f: Folding
-- [[f ]]f: Recursive folding

-- Editing and sourcing of Neovim config
map(
  "n",
  "<leader>ve",
  "<CMD>lua require('fzf-lua').files({ cwd = vim.fn.fnamemodify(vim.env.DOTFILES or vim.env.MYVIMRC, ':p:h') })<CR>",
  noremap
)
map("n", "<leader>vs", [[<CMD>write<CR><CMD>PackerCompile<CR><CMD>luafile $MYVIMRC<CR>]], noremap)
map("n", "<leader>vi", ":PackerInstall<CR>", noremap)
map("n", "<leader>vu", ":PackerSync<CR>", noremap)

-- Save files
map("n", "gs", "<CMD>write<CR>", noremap)
map("", "<D-s>", "<CMD>write<CR>", noremap) -- Cmd+s on mac for habit
map("n", "<leader>fs", "<CMD>write<CR>", noremap)
map("n", "<leader>fS", "':saveas ' . expand('%:p')", {noremap = true, expr = true})
map("n", "<leader>fR", ":Rename ", noremap)
map("n", "<leader>fa", ":wall<CR>", noremap)

-- Delete files
map("n", "<leader>fD", ':call delete(expand("%")) | Bclose!<CR>', noremap)

-- Find files
map("n", "<leader>fr", "<CMD>lua require('fzf-lua').oldfiles({ cwd_only = true	})<CR>", noremap) -- Recently opened
map("n", "<leader>fR", ":FzfLua oldfiles<CR>", noremap) -- Recently opened
map("n", "<leader>fg", ":FzfLua git_status<CR>", noremap) -- Changed files in Git
map("n", "<leader>ff", ":FzfLua files<CR>", noremap) -- in cwd
map("n", "<leader>fp", [[<cmd>lua FZFProject()<CR>]], noremap) -- go to directory from `z`
map("n", "<leader>f/", [[<cmd>lua FZFGrepDir()<CR>]], noremap) -- go to directory from `z`
-- map("n", "<leader>fb", ":Telescope file_browser<CR>", options) -- Browse files
map("n", "<leader>ft", ":NvimTreeFindFileToggle<CR>", noremap) -- Browse files

-- Lists of files
map("n", "<leader>fq", ":FzfLua quickfix<CR>", noremap) -- Navigate quickfix content
map("n", "<leader>fl", ":FzfLua loclist<CR>", noremap) -- Navigate loclist content

-- Find inside files
map("n", "<leader>/", "<CMD>lua require('fzf-lua').grep({ fzf_cli_args = '--nth 2..', search = '' })<CR>", noremap) -- in cwd
map(
  "n",
  "<leader>;",
  "<CMD>lua require('fzf-lua').grep_curbuf({ fzf_opts = { ['--with-nth'] =  '2,4..'}, search = '' })<CR>",
  noremap
) -- Current buffer

-- Navigate buffers
map("n", "<leader><Tab>", ":FzfLua buffers<CR>", noremap)
map("n", "<C-->", "<CMD>bprevious<CR>", noremap)
map("n", "<C-=>", "<CMD>bnext<CR>", noremap)
-- map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", options)
map("n", "<Tab>", "<CMD>bnext<CR>", noremap)
-- map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", options)
map("n", "<S-Tab>", "<CMD>bprevious<CR>", noremap)

-- New buffer
map("n", "<Leader>bn", "<CMD>enew<CR>", noremap)
map("n", "<Leader>fn", "<CMD>enew<CR>", noremap) -- or mnemonically "file new"

-- Close buffers
map("n", "<Leader>bd", "<CMD>Bdelete<CR>", noremap)
map("n", "<Leader>bD", "<CMD>Bdelete!<CR>", noremap)
-- map("n", "<Leader>bo", "<CMD>BufferCloseAllButCurrent<CR>", options) -- Close other buffers
map("n", "<Leader>bo", "<CMD>BufferLineCloseLeft<CR><CMD>BufferLineCloseRight<CR>", noremap) -- Close other buffers

-- Reload buffer
map("n", "<Leader>br", "<CMD>edit<CR>", noremap)
map("n", "<Leader>bR", "<CMD>edit!<CR>", noremap)

-- Git
-- map("n", "<Leader>gb", ":Git blame<CR>", options)
map("n", "<Leader>gb", ":TigBlame<CR>", noremap)
-- <Leader>gm: Git messenger (show line history info)

-- Commands
map("n", "<Leader><Leader>", "<CMD>FzfLua command_history<CR>", noremap)
map("n", "<Leader>hh", "<CMD>FzfLua help_tags<CR>", noremap)
map("n", "::", "<CMD>FzfLua commands<CR>", noremap)
map("n", "<Leader>hb", "<CMD>FzfLua keymaps<CR>", noremap)
map("n", "<Leader>hm", "<CMD>Bufferize verbose map<CR>", noremap) -- List all normal mode maps
map("n", "<Leader>hi", "<CMD>Bufferize verbose imap<CR>", noremap) -- List all insert mode maps

-- Messages
map("n", "<Leader>bm", "<CMD>Bufferize messages<CR>", noremap)

-- "Windows"
map("n", "<Leader>wd", "<C-W>c", noremap) -- Close window
map("n", "<Leader>wo", "<C-W>o", noremap) -- Maximize window
-- Focus window
map("n", "<Leader>wh", "<C-W>h", noremap) -- Focus window left
map("n", "<Leader>wj", "<C-W>j", noremap) -- Focus window down
map("n", "<Leader>wk", "<C-W>k", noremap) -- Focus window up
map("n", "<Leader>wl", "<C-W>l", noremap) -- Focus window right
-- Move window
map("n", "<Leader>wH", "<C-W>H", noremap) -- Move window left
map("n", "<Leader>wJ", "<C-W>J", noremap) -- Move window down
map("n", "<Leader>wK", "<C-W>K", noremap) -- Move window up
map("n", "<Leader>wL", "<C-W>L", noremap) -- Move window right

-- LSP
-- This can be smarter: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
map("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", noremap) -- Show hover information
map("n", "gH", "<CMD>lua vim.lsp.buf.signature_help()<CR>", noremap) -- Signature help?
map("n", "gR", "<CMD>lua vim.lsp.buf.rename()<CR>", noremap) -- Rename
-- map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", options) -- Go to definition
-- map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", options) -- Go to implementation(s)
-- map("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", options) -- Type definition
-- map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", options) -- Go to references
-- map("n", "g.", "<CMD>lua vim.lsp.buf.code_action()<CR>", options) -- Code action
map("n", "gd", "<CMD>FzfLua lsp_definitions<CR>", noremap) -- Go to definition
map("n", "gD", "<CMD>FzfLua lsp_declarations<CR>", noremap) -- Go to definition
map("n", "gi", "<CMD>FzfLua lsp_implementations<CR>", noremap) -- Go to implementation(s)
map("n", "gt", "<CMD>FzfLua lsp_typedefs<CR>", noremap) -- Type definition
map("n", "gr", "<CMD>FzfLua lsp_references<CR>", noremap) -- Go to references
map("n", "g.", "<CMD>FzfLua lsp_code_actions<CR>", noremap) -- Code action
map("n", "g;", "<CMD>lua require'fzf-lua'.lsp_document_symbols({ fzf_cli_args = '--with-nth 2..' }) <CR>", noremap) -- Code action
map("n", "g/", "<CMD>lua require'fzf-lua'.lsp_live_workspace_symbols({ fzf_cli_args = '--nth 2..' }) <CR>", noremap) -- Code action

-- Format buffer
map("n", "<Leader>F", "<CMD>Format<CR>", noremap)
-- Git
map("n", "<Leader>gg", "<CMD>TigStatus<CR>", noremap)

-- Toggles and UI
map("", "<Leader>tc", "<CMD>FzfLua colorschemes<CR>", noremap)
map("", "<Leader>tn", "<CMD>set invnumber<CR>", noremap)
map("", "<Leader>tw", "<CMD>set invwrap<CR>", noremap)
map("", "<Leader>tf", "<CMD>FzfLua filetypes<CR>", noremap)
map("", "<Leader>tq", "<CMD>TroubleToggle<CR>", noremap)
map("", "<Leader>tu", "<CMD>MundoToggle<CR>", noremap)
-- Navigate errors/diagnostics
map("", "<Leader>e", "<CMD>TroubleToggle lsp_document_diagnostics<CR>", noremap) -- Code action
map("", "<Leader>E", "<CMD>TroubleToggle lsp_workspace_diagnostics<CR>", noremap) -- Code action

--
map("n", "<Leader>tw", "<CMD>set invwrap<CR>", noremap)

-- -- Show cursor highlight
-- map(
--   "n",
--   "<Leader>cc",
--   [[<cmd>echo 'hi<' . synIDattr(synID(line('.'), col('.'), 1), 'name') . '> trans<' . synIDattr(synID(line('.'), col('.'), 0), 'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name') . '>'<CR>]],
--   options
-- )

-- Commenting
map("n", "gca", "gcA", remap)

-- Quit
map("n", "<Leader>qq", "<CMD>confirm qall<CR>", noremap)
map("n", "<Leader>QQ", "<CMD>qall!<CR>", noremap)
