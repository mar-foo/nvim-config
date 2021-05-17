require'nvim-treesitter.configs'.setup {
	ensure_installed  = { "bash", "c", "cpp", "lua" },
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
}
