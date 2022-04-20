require'nvim-treesitter.configs'.setup {
	ensure_installed  = { "bash", "c", "cpp", "haskell", "go", "lua" },
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
}
