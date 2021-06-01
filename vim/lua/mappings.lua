local g = vim.g
local nnoremap = vim.keymap.nnoremap

-- map leader key to space
g.mapleader = " "
g.maplocalleader = ","

nnoremap { '<leader>h', function() print("Hello world, from lua") end }
