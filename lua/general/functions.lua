-- Theme
function _G.ThemeSwap()
  if vim.api.nvim_get_option('background') == 'dark' then
    vim.api.nvim_set_option('background', 'light')
  else
    vim.api.nvim_set_option('background', 'dark')
  end
  vim.cmd('luafile $HOME/.config/nvim/lua/theme/evil-lualine.lua')
  vim.g.colors_name = 'gruvbox'
end


-- Make functions executable in Ex mode
vim.cmd('command! ThemeSwap lua ThemeSwap()')
