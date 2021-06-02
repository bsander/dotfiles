local g = vim.g
local map = vim.api.nvim_set_keymap

-- Leader: <Space>
g.mapleader = " "
-- Local leader: , (comma)
g.maplocalleader = ","

-- map the leader key to nothing
map('n', '<Space>', '', {})

local options = {noremap = true, silent = false}

-- Redo last action
map('n', 'U', '<C-r>', options)
-- Clear current search
map('n', '<S-Esc>', ':let @/ = ""<CR><Esc>', options)
-- Consistency in search direction
map('n', 'n', '/<CR>', options)
map('n', 'N', '?<CR>', options)
map('n', '?', '/<CR>', options)
-- Swap 0 and ^
map('n', '0', '^', options)
map('n', '^', '0', options)
-- Normalize replace
map('n', 'R', 'cl', options)
map('v', 'R', 'c', options)
-- Disable macro recording
map('n', 'q', '<NOP>', options)
map('n', 'Q', '<NOP>', options)
map('n', 'Q', '<NOP>', options)

-- [m]ove instead of [d]elete
map('', 'm', 'd', options)
map('', 'mm', 'dd', options)
map('', 'M', 'D', options)
-- make d actually delete using black hole register
map('', 'dd', '"_dd', options)
map('', 'd', '"_d', options)
map('', 'D', '"_D', options)
map('x', 'p', '"_dP', options) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
map('v', 'p', '"_dP', options)
-- Yank to global clipboard with `g`
map('', 'gy', '"+y', {noremap = false})
map('n', 'gyy', '"+yy', {noremap = false})
map('n', 'gY', '"+Y', {noremap = false})
map('', 'gm', '"+m', {noremap = false})
map('n', 'gmm', '"+mm', {noremap = false})
map('n', 'gM', '"+M', {noremap = false})
map('n', 'gp', '"+p', {noremap = false})
map('n', 'gP', '"+P', {noremap = false})
map('x', 'gp', '"_d"+P', options) -- Keep yanked value after paste: https://stackoverflow.com/a/11993928
map('v', 'gp', '"_d"+P', options)

-- Navigate in insert mode
map('!', '<C-h>', '<Left>', options)
map('!', '<C-l>', '<Right>', options)
map('!', '<C-k>', '<Up>', options)
map('!', '<C-j>', '<Down>', options)
map('!', '<C-a>', '<Home>', options)
map('!', '<C-e>', '<End>', options)
map('!', '<C-d>', '<Delete>', options)
map('!', '<C-c>', '<Esc>', options) -- CTRL-C doesn't trigger the InsertLeave autocmd

-- Move lines around
map('n', 'K', [[:m-2<CR>]], options)
map('n', 'J', [[:m+<CR>]], options)
map('v', 'K', [[:m '<-2<CR>gv=gv]], options)
map('v', 'J', [[:m '>+<CR>gv=gv]], options)
-- Duplicate lines
map('n', '<Leader>xk', [[:t-<CR>]], options)
map('n', '<Leader>xj', [[:t+0<CR>]], options)
map('v', '<Leader>xj', [[:t '<-1<CR>gv=gv]], options)
map('v', '<Leader>xk', [[:t '>+0<CR>gv=gv]], options)
-- Join lines
map('n', 'H', 'k:join<CR>', options)
map('n', 'L', '<CMD>join<CR>', options)

-- Editing and sourcing of Neovim config
map('n', '<leader>ve', ':edit $MYVIMRC<CR>', options)
map('n', '<leader>vs', ':write | luafile $MYVIMRC<CR>', options)
map('n', '<leader>vi', ':PackerInstall<CR>', options)
map('n', '<leader>vu', ':PackerSync<CR>', options)

-- Save files
map('n', 'gs', '<CMD>update<CR>', options) -- quick save (only writes on change)
map('n', '<leader>fs', '<CMD>write<CR>', options)
-- map('n', '<leader>fS', ':saveas', options) -- how to implement this in lua? ':saveas ' . expand('%:p')
map('n', '<leader>fa', ':wall<CR>', options)

-- Delete files
map('n', '<leader>fD', ':call delete(expand("%")) | BufferClose!<CR>', options)

-- Find files
map('n', '<leader>fr', ':Telescope oldfiles<CR>', options) -- Recently opened
map('n', '<leader>ff', ':Telescope find_files<CR>', options) -- in cwd
map('n', '<leader>fp', [[<cmd>lua require'telescope'.extensions.z.list{ cmd = {'zoxide', 'query', '--list', '--score'} }<CR>]], options) -- go to directory from `z`

-- Find inside files
map('n', '<leader>/', ':Telescope live_grep<CR>', options) -- in cwd
map('n', '<leader>;', ':Telescope current_buffer_fuzzy_find<CR>', options) -- Current buffer

-- Navigate buffers
map('n', '<leader><Tab>', ':Telescope buffers<CR>', options)
map('n', '<Tab>', '<CMD>BufferNext<CR>', options)
map('n', '<S-Tab>', '<CMD>BufferPrevious<CR>', options)

-- New buffer
map('n', '<Leader>bn', '<CMD>enew<CR>', options)
map('n', '<Leader>fn', '<CMD>enew<CR>', options) -- or mnemonically "file new"

-- Close buffers
map('n', '<Leader>bd', '<CMD>BufferClose<CR>', options)
map('n', '<Leader>bD', '<CMD>BufferClose!<CR>', options)
map('n', '<Leader>bM', '<CMD>BufferCloseAllButCurrent<CR>', options) -- Close other buffers

-- Reload buffer
map('n', '<Leader>br', '<CMD>edit<CR>', options)
map('n', '<Leader>bR', '<CMD>edit!<CR>', options)

-- LSP
-- This can be smarter: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
map('n', 'gh', '<CMD>lua require("lspsaga.hover").render_hover_doc()<CR>', options) -- Show hover information
map('n', '<C-j>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', options) -- scroll down hover doc
map('n', '<C-k>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', options) -- scroll up hover doc
-- map('n', 'gh', '<CMD>lua vim.lsp.buf.hover()<CR>', options) -- Show hover information
map('n', 'gH', '<CMD>lua vim.lsp.buf.signature_help()<CR>', options) -- Signature help?
map('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', options) -- Go to definition
map('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', options) -- Go to implementation(s)
map('n', 'gt', '<CMD>lua vim.lsp.buf.type_definition()<CR>', options) -- Type definition
-- map('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', options) -- Go to references
map('n', 'gr', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], options) -- Go to references
map('n', 'gR', '<CMD>lua vim.lsp.buf.rename()<CR>', options) -- Rename
map('n', 'g.', '<CMD>lua vim.lsp.buf.code_action()<CR>', options) -- Code action


-- Quit
map('n', '<Leader>qq', '<CMD>confirm qall<CR>', options)
map('n', '<Leader>QQ', '<CMD>qall!<CR>', options)
