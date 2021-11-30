-- Preview theme adapts to vim theme
vim.env.BAT_THEME = "base16"

-- *bones configs
local all_bones_config = {
  darkness = "stark",
  lightness = "bright",
  solid_line_nr = true,
  solid_float_border = true,
  darken_noncurrent_window = true,
  lighten_noncurrent_window = true
}

vim.g.zenbones = all_bones_config
vim.g.rosebones = all_bones_config
vim.g.forestbones = all_bones_config

-- GruvboxMod = function()
--   vim.g.gruvbox_contrast_dark = "hard"
--   vim.g.gruvbox_contrast_light = "hard"
--   if vim.opt.background:get() == "light" then
--     vim.env.BAT_THEME = "gruvbox-light"
--     vim.g.gruvbox_sign_column = "bg0"
--     vim.g.gruvbox_colors = {
--       bg0 = {"#eeeeee", 238},
--       bg1 = {"#cccccc", 238}
--     }
--   else
--     vim.env.BAT_THEME = "gruvbox-dark"
--     vim.g.gruvbox_colors = nil
--   end
-- end
--
-- vim.cmd([[
-- augroup GruvboxMod
--   autocmd!
--   autocmd ColorSchemePre gruvbox lua GruvboxMod()
-- augroup END
-- ]])
--

--- Autoset colorscheme on startup
vim.cmd [[colorscheme zenbones]]
