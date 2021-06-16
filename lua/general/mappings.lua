-- Leader key
vim.api.nvim_set_keymap('n', '<Space>', '<nop>', { noremap = true, silent = true })
vim.g.mapleader = ','

vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })

-- Easy CAPS
vim.api.nvim_set_keymap('i', '<c-u>', '<esc>viwUi', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-u>', 'viwU<esc>', { noremap = true })

-- TAB in normal mode will move to next buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<cr>', { noremap = true, silent = true })

-- TAB completion
-- function _G.smart_tab()
-- return vim.fn.pumvisible() == 1 and [[\\<C-n>]] or [[\\<Tab>]]
-- end
-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? \"\\<C-n>\" : \"\\<TAB>\"', { expr = true, noremap = true, silent = true })

-- Better tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- My configuration
--------------------

-- Window and buffer management
--------------------
vim.api.nvim_set_keymap('n', '<Leader>h', ':wincmd h<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':wincmd j<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':wincmd k<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':wincmd l<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-c>', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><space>', '/<++><cr>ca<', { noremap = true })

-- Registers
--------------------
vim.api.nvim_set_keymap('n', 'dD', '"_dd', { noremap = true })

-- Movements
--------------------
-- Make arrows useful
vim.api.nvim_set_keymap('n', '<down>', 'ddp', {})
vim.api.nvim_set_keymap('n', '<right>', 'dwea<space><esc>pxb', {})
vim.api.nvim_set_keymap('n', '<left>', 'dwbPa<space><esc>b', {})
vim.api.nvim_set_keymap('n', '<up>', 'ddkP', {})
-- Disable arrows
vim.api.nvim_set_keymap('i', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<right>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<right>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('n', '<cr>', 'i<cr><esc>k', {})
vim.api.nvim_set_keymap('n', 'E', 'gE', {})
vim.api.nvim_set_keymap('n', 'L', 'g$', {})
vim.api.nvim_set_keymap('n', 'g{', 'f{a', {})
vim.api.nvim_set_keymap('n', 'g}', 'F}i', {})

-- Make some room
--------------------
vim.api.nvim_set_keymap('n', 'go', 'o<esc>k', {})
vim.api.nvim_set_keymap('n', 'gO', 'O<esc>j', {})

-- Center the screen
--------------------
vim.api.nvim_set_keymap('n', 'G', 'Gzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzz', {})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {})
--
-- Shortcuts
--------------------
vim.api.nvim_set_keymap('n', '<Leader>fed', ':e $MYVIMRC<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>feR', ':luafile $MYVIMRC<cr>', { noremap = true })

-- FZF
--------------------
vim.api.nvim_set_keymap('n', '<Leader>f', ':FZF<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>w', 'yiw:Rg <C-r>"<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>\'', ':Marks<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>g', ':GFiles<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>r', ':Rg<cr>', {noremap = true})
