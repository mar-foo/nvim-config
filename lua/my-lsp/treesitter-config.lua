require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
	ensure_installed  = { "bash", "c", "cpp", "haskell", "go", "lua", "org"},
	highlight = {
		enable = true,
		disable = {'org'},
		additional_vim_regex_highlight = {'org'}
	},
	indent = {
		enable = true
	},
}
