


vim.cmd [[set shortmess+=c]]
vim.o.completeopt = "menuone,noinsert"

require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	allow_prefix_unmatch = false;
	max_abbr_width = 1000;
	max_kind_width = 1000;
	max_menu_width = 10000;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = false;
    ultisnips = true;
		nvim_lsp = true;
		nvim_lua = true;
		spell = false;
		treesitter = false;
	},
}

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-g>', 'compe#close(\'<C-g>\')', {noremap = true, silent = true, expr = true})
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

-- Snippets (not working)
--[[ vim.api.nvim_set_keymap('i', '<C-j>', 'vsnip#available(1) ? vsnip-expand-or-jump : \"\\<C-j>\"', { expr = true })
vim.api.nvim_set_keymap('s', '<C-j>', 'vsnip#available(1) ? vsnip-expand-or-jump : \"\\<C-j>\"', { expr = true })

vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#jumpable(1) ? vsnip-jump-next : \"\\<Tab>\"', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'vsnip#jumpable(1) ? vsnip-jump-next : \"\\<Tab>\"', { expr = true })
vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#jumpable(-1) ? vsnip-jump-prev : \"\\<Tab>\"', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'vsnip#jumpable(-1) ? vsnip-jump-prev : \"\\<Tab>\"', { expr = true }) ]]
--[[ vim.cmd([[
imap <expr><C-j> vsnip#available(1) ? vsnip-expand-or-jump : <C-j>
smap <expr><C-j> vsnip#available(1) ? vsnip-expand-or-jump : <C-j>
imap <expr><tab> vsnip#jumpable(1) ? vsnip-jump-next : <tab>
smap <expr><tab> vsnip#jumpable(1) ? vsnip-jump-next : <tab>
imap <expr><s-tab> vsnip#jumpable(1) ? vsnip-jump-prev : <tab>
smap <expr><s-tab> vsnip#jumpable(1) ? vsnip-jump-prev : <tab>
, true) ]]
