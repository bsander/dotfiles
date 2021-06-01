
-- prevent typo when pressing `wq` or `q`
-- vim.cmd [[
--   cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
--   cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
--   cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
--   cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
-- ]]

-- change cwd to current directory
-- vim.cmd [[cd %:p:h]]

-- order matters
local modules = {
  "settings",    -- `set` stuff
  "plugins",
  "mappings",
--  "modules._appearances", -- colourscheme shenanigans
--  "modules._util",        -- some useful utils
--  "modules._mappings",    -- general mappings
--  "modules._statusline",  -- my custom statusline
--  "modules.lsp",          -- lsp stuff
}

vim.cmd [[colorscheme morning]]

local errors = {}
for _, v in pairs(modules) do
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
