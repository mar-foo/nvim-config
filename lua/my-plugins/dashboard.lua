vim.g.dashboard_default_executive ='fzf'

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader>ss', '<c-u>SessionSave<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sl', '<c-u>SessionLoad<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tc', ':DashboardChangeColorscheme<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fa', ':DashboardFindWord<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':DashboardJumpMark<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cn', ':DashboardNewFile<cr>', { noremap = true, silent = true })
