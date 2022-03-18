require'nvim-treesitter.configs'.setup {
	ensure_installed  = { "bash", "c", "cpp", "lua", "go" },
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
}
