--[[ -- Developpment
function _G.IDE()
  -- vim.cmd('8split term://sh')
  -- vim.cmd('NerdTreeToggle')
  -- vim.cmd('wincmd l')
  isTerminal = false
  for win in vim.api.nvim_list_bufs() do
  print(vim.api.nvim_buf_get_var(vim.api.nvim_list_bufs().win, 'buftype'))
  end
end
 ]]
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
-- vim.cmd('command! Ide lua IDE()')
