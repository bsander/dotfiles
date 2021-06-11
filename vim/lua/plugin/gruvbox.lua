GruvboxMod = function()
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_contrast_light = "hard"
  if vim.opt.background:get() == "light" then
    vim.env.BAT_THEME = "gruvbox-light"
    vim.g.gruvbox_sign_column = "bg0"
    vim.g.gruvbox_colors = {
      bg0 = {"#eeeeee", 238},
      bg1 = {"#cccccc", 238}
    }
  else
    vim.env.BAT_THEME = "gruvbox-dark"
    vim.g.gruvbox_colors = nil
  end
end

vim.cmd([[
augroup GruvboxMod
  autocmd!
  autocmd ColorSchemePre gruvbox lua GruvboxMod()
augroup END
]])

-- Autoset colorscheme on startup
vim.cmd [[colorscheme gruvbox]]
