require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_position = "bottom",
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_defaults = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_ignore_patterns = {},
		shorten_path = true,
		winblend = 0,
		width = 0.75,
		preview_cutoff = 120,
		results_height = 1,
		results_width = 0.8,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	},

	extensions = {
		fzf = {
			fuzzy = true,
			ovveride_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
}

require('telescope').load_extension('fzf')

if os.execute('git status') == 0 then
	vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').git_files, {noremap = true, silent = true})
else
	vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').find_files, { noremap = true, silent = true })
end
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, { noremap = true })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { noremap = true })
vim.keymap.set('n', '<C-h>', require('telescope.builtin').help_tags, { noremap = true })
vim.env.FZF_DEFAULT_COMMAND='find .' -- Show hidden files
