local map = vim.api.nvim_set_keymap

-- Easy ESC
map('i', 'jk', '<esc>', { noremap = true, silent = true })
map('i', 'kj', '<esc>', { noremap = true, silent = true })

-- TAB in normal mode will move to next buffer
map('n', '<TAB>', ':bnext<cr>', { noremap = true, silent = true })

---------- My configuration ----------

-- Window and buffer management
--------------------
map('n', '<Leader>h', ':wincmd h<cr>', { noremap = true })
map('n', '<Leader>j', ':wincmd j<cr>', { noremap = true })
map('n', '<Leader>k', ':wincmd k<cr>', { noremap = true })
map('n', '<Leader>l', ':wincmd l<cr>', { noremap = true })
map('n', '<Leader>v', ':vsplit<cr>:FZF<cr>', { noremap = true })
map('n', '<Leader>d', ':bd!<cr>', { noremap = true })
map('n', '<Leader><space>', '/<++><cr>ca<', { noremap = true })

-- Terminal
--------------------
map('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
map('t', 'jk', '<C-\\><C-n>', { noremap = true })

-- Registers
--------------------
map('n', 'dD', '"_dd', { noremap = true })

---------- Movements ----------

-- Make arrows useful
map('n', '<down>', 'ddp', {})
map('n', '<right>', 'dwea<space><esc>pxb', {})
map('n', '<left>', 'dwbPa<space><esc>b', {})
map('n', '<up>', 'ddkP', {})

-- Disable arrows
map('i', '<down>', '<nop>', {})
map('i', '<right>', '<nop>', {})
map('i', '<left>', '<nop>', {})
map('i', '<up>', '<nop>', {})
map('v', '<down>', '<nop>', {})
map('v', '<right>', '<nop>', {})
map('v', '<left>', '<nop>', {})
map('v', '<up>', '<nop>', {})

-- Make some room
--------------------
map('n', 'go', 'o<esc>k', {})
map('n', 'gO', 'O<esc>j', {})

-- Center the screen
--------------------
map('n', 'G', 'Gzz', { noremap = true })
map('n', 'n', 'nzz', {})
map('n', 'N', 'Nzz', {})

-- Useful remaps
--------------------
map('n', '<cr>', 'i<cr><esc>k', {})
map('n', 'E', 'gE', {})
map('n', 'L', 'g$', {})

-- Shortcuts
--------------------
map('n', '<Leader>cc', ':e $MYVIMRC<cr>', { noremap = true })
map('n', '<Leader>cr', ':luafile $MYVIMRC<cr>', { noremap = true })

-- Custom Functions
--------------------
map('n', '<Leader>T', ':ThemeSwap<cr>', { noremap = true })

---------- Plugins ----------

-- FZF
--------------------
map('n', '<Leader>f', ':FZF ~<cr>', {noremap = true})
map('n', '<Leader><Leader>', ':FZF<cr>', {noremap = true})
-- map('n', '<Leader>w', 'yiw:Rg <C-r>"<cr>', {noremap = true})
map('n', '<Leader>\'', ':Marks<cr>', {noremap = true})
map('n', '<Leader>g', ':GFiles<cr>', {noremap = true})
map('n', '<Leader>w', ':Rg<cr>', {noremap = true})
