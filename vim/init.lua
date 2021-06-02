
-- order matters
local modules = {
  "settings",    -- `set` stuff
  "plugins",
  "mappings",
}

vim.cmd [[colorscheme one-nvim]]

local errors = {}
for _, v in pairs(modules) do
  if package.loaded and package.loaded[v] then
    package.loaded[v] = nil
  end
  local ok, err = pcall(require, v)
  if not ok then
    table.insert(errors, err)
  end
end

if not vim.tbl_isempty(errors) then
  for _, v in pairs(errors) do
    print(v)
  end
end
