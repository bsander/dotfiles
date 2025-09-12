-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Set up the leader key first
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Load configuration modules
require("config.settings")
require("config.keymaps")
require("config.lazy")

-- Start server for external tools
vim.cmd([[silent! call serverstart('/tmp/nvimsocket')]])