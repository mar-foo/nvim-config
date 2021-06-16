require'nvim-treesitter.configs'.setup {
	ensure_installed  = { "bash", "c", "cpp", "lua", "go" },
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
}
