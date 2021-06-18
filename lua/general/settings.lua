vim.g.mapleader = ','

vim.api.nvim_set_option('syntax', 'enable')
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('wrap', false)                          -- Display long lines as just one line
vim.api.nvim_set_option('encoding', 'utf-8')                    -- The encoding displayed
vim.api.nvim_set_option('pumheight', 10)                        -- Makes popup menu smaller
vim.api.nvim_set_option('fileencoding', 'utf-8')                -- The encoding written to file
vim.api.nvim_set_option('ruler', true)              			      -- Show the cursor position all the time
vim.api.nvim_set_option('mouse', 'a')                           -- Enable your mouse
vim.api.nvim_set_option('splitbelow', true)                     -- Horizontal splits will automatically be below
vim.api.nvim_set_option('splitright', true)                     -- Vertical splits will automatically be to the right
vim.api.nvim_set_option('t_Co', '256')                          -- Support 256 colors
vim.api.nvim_set_option('conceallevel', 0)                      -- So that I can see `` in markdown files
-- vim.api.nvim_set_option('tabstop', 2)                           -- Insert 2 spaces for a tab
vim.api.nvim_set_option('shiftwidth', 4)                        -- Change the number of space characters inserted for indentation
-- vim.api.nvim_set_option('smarttab', true)                       -- Makes tabbing smarter will realize you have 2 vs 4
vim.api.nvim_set_option('expandtab', true)                      -- Converts tabs to spaces
vim.api.nvim_set_option('smartindent', true)                    -- Makes indenting smart
vim.api.nvim_set_option('autoindent', true)                     -- Good auto indent
vim.api.nvim_set_option('laststatus', 2)                                           -- Always display the status line
vim.api.nvim_exec('set number relativenumber', true)
vim.api.nvim_set_option('cul', true)                            -- Enable highlighting of the current line
vim.api.nvim_set_option('background', 'dark')                   -- tell vim what the background color looks like
vim.api.nvim_set_option('showtabline', 2)                       -- Always show tabs
--set noshowmode                                                -- We don't need to see things like -- INSERT -- anymore
vim.api.nvim_set_option('updatetime', 300)                      -- Faster completion
vim.api.nvim_set_option('timeoutlen', 500)                      -- By default timeoutlen is 1000 ms
vim.api.nvim_set_option('clipboard', 'unnamedplus')             -- Copy paste between vim and everything else
-- vim.api.nvim_set_option('colorcolumn', 80)                    -- 80 character lines
vim.api.nvim_set_option('textwidth', 79)

--set autochdir                                                 -- Your working directory will always be the same as your working directory
vim.api.nvim_set_option('acd', true)
--vim.api.nvim_set_option('iskeyword+', '-                     	-- treat dash separated words as a word text object--
vim.api.nvim_exec('set formatoptions-=cro', true)              -- Stop newline continution of comments

-- My configuration
--------------------
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)
vim.api.nvim_set_option('scrolloff', 8)
vim.api.nvim_set_option('hlsearch', false)

vim.cmd([[
set colorcolumn=80
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"set listchars='tab:\\|\ '
"set list
set smarttab
"==========Autocommands==========
autocmd InsertEnter * norm zz
autocmd BufWritePre * %s/\s\+$//e " Remove trailing whitespace
autocmd FileType * setlocal formatoptions-=cro

"==========C++==========
autocmd BufWritePre *.cpp,*.h,*.html,*.css :normal gg=G<CR>
autocmd BufWritePre *.cpp %s/}$/};/e

"==========Latex==========
autocmd FileType tex,plaintex nmap <silent><buffer> ,r :-1read ~/Documents/Personal/Latex/Templates/relazione.tex<CR>
autocmd FileType tex,plaintex nmap <silent><buffer> ,a :-1read ~/Documents/Personal/Latex/Templates/template.tex<CR>
autocmd FileType tex,plaintex imap <silent><buffer> ,e <ESC>:-1read ~/Documents/Personal/Latex/Templates/equation.tex<CR>
autocmd FileType tex,plaintex imap <silent><buffer> ,d <ESC>:-1read ~/Documents/Personal/Latex/Templates/definition.tex<CR>
autocmd FileType tex,plaintex imap <silent><buffer> ,t <ESC>:-1read ~/Documents/Personal/Latex/Templates/theorem.tex<CR>
autocmd FileType tex,plaintex imap <silent><buffer> ,p <ESC>:-1read ~/Documents/Personal/Latex/Templates/deriv_parziale.tex<CR>
autocmd FileType tex,plaintex nnoremap <buffer><Leader>s :w<CR> :!pdflatex %<CR><CR>
autocmd FileType tex,plaintex nnoremap <buffer><Leader>S :w<CR> :!pdflatex %<CR>
autocmd FileType tex,plaintex nmap <buffer><Leader>p :!zathura %:r.pdf &<CR>
autocmd FileType tex,plaintex imap <buffer> aa \`{a}
autocmd FileType tex,plaintex imap <buffer> ee \`{e}
autocmd FileType tex,plaintex imap <buffer> oo \`{o}
autocmd FileType tex,plaintex imap <buffer> ii \`{i}
autocmd FileType tex,plaintex imap <buffer> uu \`{u}
autocmd FileType tex,plaintex imap <buffer> EE \`{E}

"==========Groff=============
autocmd FileType nroff nmap <buffer><Leader>s :w<CR> :!groff -e -ms % -T pdf > %:r.pdf<CR>
autocmd FileType nroff nmap <buffer><Leader>p :!zathura %:r.pdf & disown<CR>
autocmd FileType nroff imap <buffer> ee \[`e]
autocmd FileType nroff imap <buffer> aa \[`a]
autocmd FileType nroff imap <buffer> ii \[`i]
autocmd FileType nroff imap <buffer> oo \[`o]
autocmd FileType nroff imap <buffer> uu \[`u]
autocmd BufNew,Filetype xmath :-1read ~/Documents/Personal/groff_template.ms
autocmd FileType xmath :set filetype=nroff
]])
