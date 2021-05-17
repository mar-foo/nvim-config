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
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
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
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
      }
  }
}

vim.api.nvim_set_keymap('n', '<space>ff', ':lua require(\'telescope.builtin\').find_files({hidden = true})<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>fg', ':Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>b', ':Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>fh', ':Telescope help_tags<cr>', { noremap = true })
vim.env.FZF_DEFAULT_COMMAND='find .' -- Show hidden files
