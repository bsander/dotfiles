-- Modern keymaps configuration
local keymap = vim.keymap.set

-- Better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better window navigation
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize windows
keymap('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize window up' })
keymap('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize window down' })
keymap('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize window left' })
keymap('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize window right' })

-- Buffer navigation
keymap('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
keymap('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })

-- Better indenting
keymap('v', '<', '<gv', { desc = 'Indent left' })
keymap('v', '>', '>gv', { desc = 'Indent right' })

-- Move text up and down
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
keymap('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
keymap('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Stay in indent mode
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Replace visual selection
keymap('v', 'p', '"_dP', { desc = 'Paste without yanking' })

-- Better yanking
keymap('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Centered search results
keymap('n', 'n', 'nzz', { desc = 'Next search result (centered)' })
keymap('n', 'N', 'Nzz', { desc = 'Previous search result (centered)' })
keymap('n', '*', '*zz', { desc = 'Search word under cursor (centered)' })
keymap('n', '#', '#zz', { desc = 'Search word under cursor backwards (centered)' })
keymap('n', 'g*', 'g*zz', { desc = 'Search partial word under cursor (centered)' })
keymap('n', 'g#', 'g#zz', { desc = 'Search partial word under cursor backwards (centered)' })

-- Centered page navigation
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Quick save
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
keymap('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Save all files' })

-- Quick quit
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
keymap('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit all without saving' })

-- File operations
keymap('n', '<leader>fn', '<cmd>enew<CR>', { desc = '[F]ile [N]ew' })

-- Window management
keymap('n', '<leader>wv', '<C-w>v', { desc = '[W]indow [V]ertical split' })
keymap('n', '<leader>wh', '<C-w>s', { desc = '[W]indow [H]orizontal split' })
keymap('n', '<leader>we', '<C-w>=', { desc = '[W]indow [E]qualize' })
keymap('n', '<leader>wx', '<cmd>close<CR>', { desc = '[W]indow [X]Close' })
keymap('n', '<leader>wo', '<C-w>o', { desc = '[W]indow [O]nly (close others)' })

-- Tab management
keymap('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab [O]pen' })
keymap('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab [X]Close' })
keymap('n', '<leader>tn', '<cmd>tabn<CR>', { desc = '[T]ab [N]ext' })
keymap('n', '<leader>tp', '<cmd>tabp<CR>', { desc = '[T]ab [P]revious' })
keymap('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = '[T]ab [F]ile in new tab' })

-- Location and quickfix lists
keymap('n', '<leader>co', '<cmd>copen<CR>', { desc = '[C]quickfix [O]pen' })
keymap('n', '<leader>cc', '<cmd>cclose<CR>', { desc = '[C]quickfix [C]lose' })
keymap('n', '<leader>cn', '<cmd>cnext<CR>', { desc = '[C]quickfix [N]ext' })
keymap('n', '<leader>cp', '<cmd>cprev<CR>', { desc = '[C]quickfix [P]revious' })

keymap('n', '<leader>lo', '<cmd>lopen<CR>', { desc = '[L]ocation [O]pen' })
keymap('n', '<leader>lc', '<cmd>lclose<CR>', { desc = '[L]ocation [C]lose' })
keymap('n', '<leader>ln', '<cmd>lnext<CR>', { desc = '[L]ocation [N]ext' })
keymap('n', '<leader>lp', '<cmd>lprev<CR>', { desc = '[L]ocation [P]revious' })

-- Toggle options
keymap('n', '<leader>tn', '<cmd>set number!<CR>', { desc = '[T]oggle [N]umber' })
keymap('n', '<leader>tr', '<cmd>set relativenumber!<CR>', { desc = '[T]oggle [R]elative number' })
keymap('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = '[T]oggle [S]pell' })
keymap('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = '[T]oggle [W]rap' })

-- Insert mode shortcuts
keymap('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
keymap('i', '<C-j>', '<Down>', { desc = 'Move cursor down' })
keymap('i', '<C-k>', '<Up>', { desc = 'Move cursor up' })
keymap('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
keymap('i', '<C-a>', '<Home>', { desc = 'Move to beginning of line' })
keymap('i', '<C-e>', '<End>', { desc = 'Move to end of line' })

-- Command mode shortcuts
keymap('c', '<C-h>', '<Left>', { desc = 'Move cursor left' })
keymap('c', '<C-j>', '<Down>', { desc = 'Move cursor down' })
keymap('c', '<C-k>', '<Up>', { desc = 'Move cursor up' })
keymap('c', '<C-l>', '<Right>', { desc = 'Move cursor right' })
keymap('c', '<C-a>', '<Home>', { desc = 'Move to beginning of line' })
keymap('c', '<C-e>', '<End>', { desc = 'Move to end of line' })

-- Neo-tree
keymap('n', '<leader>ft', '<cmd>Neotree toggle<CR>', { desc = '[F]ile [T]ree toggle' })
keymap('n', '<leader>fr', '<cmd>Neotree reveal<CR>', { desc = '[F]ile [R]eveal in tree' })

-- Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Add blank line shortcuts
keymap('n', ']<Space>', 'o<Esc>', { desc = 'Add blank line below' })
keymap('n', '[<Space>', 'O<Esc>', { desc = 'Add blank line above' })

-- Join lines but keep cursor position
keymap('n', 'J', 'mzJ`z', { desc = 'Join lines' })

-- Terminal
keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Escape terminal mode' })

-- CUSTOM KEYBINDINGS FROM OLD CONFIG

-- Custom text operations (m = move/delete instead of d)
keymap('', 'm', 'd', { noremap = true, desc = 'Move/delete (replaces d)' })
keymap('', 'mm', 'dd', { noremap = true, desc = 'Move/delete line' })
keymap('', 'M', 'D', { noremap = true, desc = 'Move/delete to end of line' })

-- Global clipboard operations with 'g' prefix
keymap('', 'gy', '"+y', { noremap = true, desc = 'Yank to system clipboard' })
keymap('n', 'gyy', '"+yy', { noremap = true, desc = 'Yank line to system clipboard' })
keymap('n', 'gY', '"+Y', { desc = 'Yank to end to system clipboard' })
keymap('', 'gm', '"+m', { desc = 'Move to system clipboard' })
keymap('n', 'gmm', '"+mm', { desc = 'Move line to system clipboard' })
keymap('n', 'gM', '"+M', { desc = 'Move to end to system clipboard' })
keymap('', 'gp', '"+p', { noremap = true, desc = 'Paste from system clipboard' })
keymap('n', 'gP', '"+P', { noremap = true, desc = 'Paste before from system clipboard' })

-- Redo with U
keymap('n', 'U', '<C-r>', { noremap = true, desc = 'Redo last action' })

-- Swap 0 and ^ for better navigation
keymap('n', '0', '^', { noremap = true, desc = 'Go to first non-blank character' })
keymap('n', '^', '0', { noremap = true, desc = 'Go to beginning of line' })

-- Normalize replace behavior
keymap('n', 'R', 'cl', { noremap = true, desc = 'Replace character' })
keymap('v', 'R', 'c', { noremap = true, desc = 'Replace selection' })

-- Disable macro recording
keymap('n', 'q', '<NOP>', { noremap = true, desc = 'Disabled macro recording' })
keymap('n', 'Q', '<NOP>', { noremap = true, desc = 'Disabled Ex mode' })

-- Custom line movement (different from default)
keymap('n', 'K', ':m-2<CR>', { noremap = true, desc = 'Move line up' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, desc = 'Move selection up' })
-- Note: J for moving down conflicts with join, kept original join with mz trick

-- Join lines with H and L
keymap('', 'H', 'k:join<CR>', { noremap = true, desc = 'Join with line above' })
keymap('', 'L', '<CMD>join<CR>', { noremap = true, desc = 'Join with line below' })

-- Duplicate lines
keymap('n', '<Leader>xk', ':t-<CR>', { noremap = true, desc = 'Duplicate line above' })
keymap('n', '<Leader>xj', ':t+0<CR>', { noremap = true, desc = 'Duplicate line below' })
keymap('v', '<Leader>xj', ":t '<-1<CR>gv=gv", { noremap = true, desc = 'Duplicate selection below' })
keymap('v', '<Leader>xk', ":t '>+0<CR>gv=gv", { noremap = true, desc = 'Duplicate selection above' })

-- Custom go operations
keymap('', 'go', 'o<Esc>[]cc', { desc = 'Insert line below and enter insert' })
keymap('', 'gO', 'O<Esc>[]cc', { desc = 'Insert line above and enter insert' })

-- Advanced save operations
keymap('n', 'gs', '<CMD>write<CR>', { noremap = true, desc = 'Save file' })
keymap('', '<D-s>', '<CMD>write<CR>', { noremap = true, desc = 'Save file (Cmd+s)' })
keymap('n', '<leader>fs', '<CMD>write<CR>', { noremap = true, desc = 'Save file' })
keymap('n', '<leader>fS', ":saveas " .. vim.fn.expand('%:p'), { noremap = true, expr = true, desc = 'Save as' })
keymap('n', '<leader>fR', ':Rename ', { noremap = true, desc = 'Rename file' })
keymap('n', '<leader>fa', ':wall<CR>', { noremap = true, desc = 'Save all files' })

-- Delete file
keymap('n', '<leader>fD', ":call delete(expand('%')) | bdelete!<CR>", { noremap = true, desc = 'Delete file and close buffer' })

-- Buffer operations (extending existing ones)
keymap('n', '<leader>bo', '<CMD>%bd|e#|bd#<CR>', { noremap = true, desc = 'Close other buffers' })
keymap('n', '<leader>br', '<CMD>edit<CR>', { noremap = true, desc = 'Reload buffer' })
keymap('n', '<leader>bR', '<CMD>edit!<CR>', { noremap = true, desc = 'Force reload buffer' })
keymap('n', '<leader>by', '<CMD>%y<CR>', { noremap = true, desc = 'Yank entire buffer to nvim registry' })
keymap('n', '<leader>bY', '<CMD>%y+<CR>', { noremap = true, desc = 'Yank entire buffer to system clipboard' })

-- Messages buffer (using Bufferize)
keymap('n', '<leader>bm', '<CMD>Bufferize messages<CR><CMD>wincmd p<CR>', { noremap = true, desc = 'Show messages in buffer' })

-- Extended window operations
keymap('n', '<leader>wd', '<C-W>c', { noremap = true, desc = 'Close window' })
keymap('n', '<leader>wh', '<C-W>h', { noremap = true, desc = 'Focus window left' })
keymap('n', '<leader>wj', '<C-W>j', { noremap = true, desc = 'Focus window down' })
keymap('n', '<leader>wk', '<C-W>k', { noremap = true, desc = 'Focus window up' })
keymap('n', '<leader>wl', '<C-W>l', { noremap = true, desc = 'Focus window right' })
keymap('n', '<leader>wH', '<C-W>H', { noremap = true, desc = 'Move window left' })
keymap('n', '<leader>wJ', '<C-W>J', { noremap = true, desc = 'Move window down' })
keymap('n', '<leader>wK', '<C-W>K', { noremap = true, desc = 'Move window up' })
keymap('n', '<leader>wL', '<C-W>L', { noremap = true, desc = 'Move window right' })

-- Additional insert mode navigation (extending existing)
keymap('i', '<C-d>', '<Delete>', { noremap = true, desc = 'Delete character forward' })
keymap('i', '<C-c>', '<Esc>', { noremap = true, desc = 'Exit insert mode (triggers InsertLeave)' })

-- Enhanced search consistency (overriding defaults for workflow)
keymap('n', 'n', '/<CR>', { noremap = true, desc = 'Search forward' })
keymap('n', 'N', '?<CR>', { noremap = true, desc = 'Search backward' })
keymap('n', '?', '/<CR>', { noremap = true, desc = 'Search forward (consistent)' })

-- Quick navigation enhancements
keymap('', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, desc = 'Previous diagnostic' })
keymap('', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, desc = 'Next diagnostic' })
keymap('', '[q', '<cmd>cprevious<CR>', { noremap = true, desc = 'Previous quickfix' })
keymap('', ']q', '<cmd>cnext<CR>', { noremap = true, desc = 'Next quickfix' })
keymap('', '[c', 'O<Esc>gcA', { desc = 'Comment above' })
keymap('', ']cc', 'o<Esc>gcA', { desc = 'Comment below' })
keymap('', '[]<Space>', '[]<Space>', { desc = 'Add blank lines above and below' })

-- Advanced quit operations
keymap('n', '<Leader>qq', '<CMD>confirm qall<CR>', { noremap = true, desc = 'Quit all with confirmation' })
keymap('n', '<Leader>QQ', '<CMD>qall!<CR>', { noremap = true, desc = 'Force quit all' })

-- Comment mappings (extending)
keymap('n', 'gca', 'gcA', { desc = 'Comment at end of line' })