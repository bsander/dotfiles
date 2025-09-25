-- Modern Neovim settings
local opt = vim.opt
local g = vim.g

-- General
opt.mouse = 'a'                           -- Enable mouse support
opt.clipboard = 'unnamedplus'             -- Use system clipboard
opt.swapfile = false                      -- Don't use swapfile
opt.completeopt = 'menuone,noselect'      -- Better completion
opt.timeoutlen = 400                      -- Faster timeout wait time

-- UI
opt.number = true                         -- Show line numbers
opt.relativenumber = false                 -- Relative line numbers
opt.cursorline = true                     -- Highlight current line
opt.termguicolors = true                  -- True color support
opt.background = 'light'                  -- Set background for colorscheme
opt.signcolumn = 'yes:1'                  -- Always show sign column
opt.cmdheight = 1                         -- Command line height
opt.showmode = false                      -- Don't show mode (already in statusline)
opt.laststatus = 3                        -- Global statusline
opt.pumheight = 10                        -- Popup menu height
opt.scrolloff = 8                         -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8                     -- Keep 8 columns left/right of cursor
-- opt.colorcolumn = '80'                    -- Show column at 80 chars

-- Splits
opt.splitbelow = true                     -- Split new windows below current
opt.splitright = true                     -- Split new windows right of current

-- Files
opt.backup = false                        -- Don't create backup files
opt.writebackup = false                   -- Don't create backup before overwriting
opt.undofile = true                       -- Enable persistent undo
opt.autoread = true                       -- Auto reload files changed outside vim
opt.autowrite = true                      -- Auto write files when switching buffers

-- Search
opt.hlsearch = true                       -- Highlight search matches
opt.ignorecase = true                     -- Case insensitive search
opt.smartcase = true                      -- Case sensitive if uppercase present
opt.inccommand = 'split'                  -- Show incremental search in split

-- Indentation
opt.expandtab = true                      -- Convert tabs to spaces
opt.shiftwidth = 2                        -- Number of spaces for each indent
opt.tabstop = 2                           -- Number of spaces for tab
opt.softtabstop = 2                       -- Number of spaces for tab in editing
opt.autoindent = true                     -- Copy indent from current line
opt.smartindent = true                    -- Smart indentation

-- Folding
opt.foldmethod = 'expr'                   -- Use expression for folding
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use treesitter for folding
opt.foldlevel = 99                        -- Start with all folds open
opt.foldenable = false                    -- Disable folding on startup

-- List chars
opt.list = true                           -- Show some invisible characters
opt.listchars = {
  tab = '» ',
  extends = '›',
  precedes = '‹',
  nbsp = '·',
  trail = '·'
}

-- Fill chars (for splits, folds, etc)
opt.fillchars = {
  vert = '│',
  fold = ' ',
  eob = ' ', -- suppress ~ at EndOfBuffer
  diff = '╱', -- alternatives = ⣿ ░ ─ ╱
  msgsep = '‾',
  foldopen = '▾',
  foldsep = '│',
  foldclose = '▸'
}

-- Disable some built-in plugins
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1

-- Flash yank highlight
vim.api.nvim_create_augroup('HighlightOnYank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'HighlightOnYank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Search',
      timeout = 200,
      on_visual = true,
    })
  end,
})

-- Auto reload files when they change
vim.api.nvim_create_augroup('AutoReadOnFocus', {})
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  group = 'AutoReadOnFocus',
  pattern = '*',
  command = 'silent! checktime',
})

-- Better formatting options
opt.formatoptions:remove({ 'c', 'r', 'o' }) -- Don't auto-comment new lines

-- Spelling
opt.spelllang = 'en_us'
opt.spell = false -- Disabled by default, can be toggled

-- Session options
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
