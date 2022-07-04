if Read_file(os.getenv('HOME') .. '/.cache/themechange/current') == 'dark\n' then
	vim.o.background = 'dark'
else
	vim.o.background = 'light'
end

vim.o.termguicolors = true

vim.cmd('colorscheme gruvbox')
vim.cmd('hi Normal guibg=none')
vim.cmd('hi EndOfBuffer guibg=none')

require('theme.nerd')
