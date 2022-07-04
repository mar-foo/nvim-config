require'nvim-treesitter.configs'.setup {
	ensure_installed  = { "bash", "c", "cpp", "haskell", "go", "lua"},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',

				['ic'] = '@class.inner'
			}
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>n'] = '@parameter.inner'
			},
			swap_previous = {
				['<leader>p'] = '@parameter.inner'
			}
		}
	},
	move = {
		enable = true,
		set_jumps = true,
		goto_next_start = {
			[']f'] = '@function.outer',
			[']c'] = '@class.outer'
		},
		goto_next_end = {
			[']F'] = '@function.outer',
			[']c'] = '@class.outer'
		},
		goto_previous_start = {
			['[f'] = '@function.outer',
			['[c'] = '@class.outer'
		},
		goto_previous_end = {
			['[F'] = '@function.outer',
			['[C'] = '@class.outer'
		}
	}
}
