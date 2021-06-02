local g = vim.g
local o = vim.opt

-- disable builtin plugins I don't use
g.loaded_gzip         = 1
g.loaded_tar          = 1
g.loaded_tarPlugin    = 1
g.loaded_zipPlugin    = 1
g.loaded_2html_plugin = 1
g.loaded_netrw        = 1
g.loaded_netrwPlugin  = 1
g.loaded_matchit      = 1
g.loaded_matchparen   = 1
g.loaded_spec         = 1


o.autoindent     = true -- enable autoindent
o.autoread = true -- Auto-refresh unchanged files when content changes
o.background = "light"
o.backup         = false -- disable backup
o.cursorline     = true -- enable cursorline
o.expandtab      = true -- use spaces instead of tabs
o.autowrite      = true -- autowrite buffer when it's not focused
o.hidden         = true -- keep hidden buffers
o.hlsearch       = true -- don't highlight matching search
o.ignorecase     = true -- case insensitive on search
o.lazyredraw     = true -- lazyredraw to make macro faster
o.list           = true -- display listchars
o.number         = false -- show line number in gutter 
o.relativenumber = false -- use relative file numbers
o.showmode       = false -- don't show mode
o.smartcase      = true -- improve searching using '/'
o.smartindent    = true -- smarter indentation
o.smarttab       = true -- make tab behaviour smarter
o.splitbelow     = true -- split below instead of above
o.splitright     = true -- split right instead of left
o.startofline    = false -- don't go to the start of the line when moving to another file
o.swapfile       = false -- disable swapfile
o.termguicolors  = true -- truecolours for better experience
o.wrap           = false -- dont wrap lines
o.writebackup    = false -- disable backup
o.backupcopy     = "yes" -- fix weirdness for stuff that replaces the entire file when hot reloading
o.completeopt    = { "menu", "menuone", "noselect", "noinsert" } -- better completion
o.encoding       = "UTF-8" -- set encoding
o.fillchars      = {
  vert = "│",
  eob = " ",
  fold = " ",
} -- make vertical split sign better
o.foldmethod     = "marker"
  -- foldexpr       = "nvim_treesitter#foldexpr()",
  -- foldlevel      = 0, -- don't fold anything if I don't tell it to do so
  -- foldnestmax    = 1, -- only allow 1 nested folds, it can be confusing if I have too many
o.foldopen       = "percent,search" -- don't open fold if I don't tell it to do so
  -- foldcolumn     = "1", -- enable fold column for better visualisation
o.inccommand     = "split" -- incrementally show result of command
-- o.listchars      = { eol = "↲", tab= "» " } -- set listchars
o.mouse          = "a" -- enable mouse support
o.shortmess      = "csa" -- disable some stuff on shortmess
o.signcolumn     = "yes" -- enable sign column all the time, 4 column
-- o.shell          = "/usr/bin/bash" -- use bash instead of zsh
-- o.colorcolumn    = { "80" } -- 80 chars color column
o.colorcolumn    = { } -- no color column
o.laststatus     = 2 -- always enable statusline
o.pumheight      = 10 -- limit completion items
o.re             = 0 -- set regexp engine to auto
o.scrolloff      = 2 -- make scrolling better
o.sidescroll     = 2 -- make scrolling better
o.shiftwidth     = 2 -- set indentation width
o.sidescrolloff  = 15 -- make scrolling better
o.tabstop        = 2 -- tabsize
o.timeoutlen     = 400 -- faster timeout wait time
o.updatetime     = 100 -- set faster update time
