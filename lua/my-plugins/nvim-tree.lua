vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<cr>', {noremap = true})
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_special_files = { 'README,md', 'README.org', 'Makefile' }
--[[ vim.cmd([[
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }
]]
