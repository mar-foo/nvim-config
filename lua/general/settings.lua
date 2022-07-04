vim.g.mapleader = ','

vim.o.autoindent = true                     -- Good auto indent
vim.o.background = 'dark'                   -- tell vim what the background color looks like
vim.o.clipboard = 'unnamedplus'             -- Copy paste between vim and everything else
vim.o.colorcolumn = 80
vim.o.conceallevel = 0                      -- So that I can see `` in markdown files
vim.o.cul = true                            -- Enable highlighting of the current line
vim.o.cursorline = false
vim.o.encoding = 'utf-8'                    -- The encoding displayed
vim.o.fileencoding = 'utf-8'                -- The encoding written to file
vim.o.hidden = true
vim.o.laststatus = 2                        -- Always display the status line
vim.o.mouse = 'a'                           -- Enable your mouse
vim.o.pumheight = 10                        -- Makes popup menu smaller
vim.o.ruler = true                          -- Show the cursor position all the time
vim.o.shiftwidth = 8                        -- Change the number of space characters inserted for indentation
vim.o.smartindent = true                    -- Makes indenting smart
vim.o.softtabstop = 8
vim.o.splitbelow = true                     -- Horizontal splits will automatically be below
vim.o.splitright = true                     -- Vertical splits will automatically be to the right
vim.o.syntax = 'enable'
vim.o.t_Co = '256'                          -- Support 256 colors
vim.o.tabstop = 8
vim.o.textwidth = 79
vim.o.timeoutlen = 500                      -- By default timeoutlen is 1000 ms
vim.o.updatetime = 300                      -- Faster completion
vim.o.wrap = false                          -- Display long lines as just one line

vim.api.nvim_exec('set formatoptions-=cro', true)              -- Stop newline continution of comments

-- My configuration
--------------------
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 8
vim.o.hlsearch = false

vim.cmd([[
filetype plugin indent on
set path+=**

"==========Autocommands==========
augroup misc
	autocmd InsertEnter * norm zz
	autocmd BufWritePre * %s/\s\+$//e " Remove trailing whitespace
	autocmd FileType * setlocal formatoptions-=cro
augroup END

"==========C++==========
augroup cpp
	autocmd BufWritePre *.cpp,*.h,*.html,*.css :normal gg=G<CR>
	autocmd BufWritePre *.cpp %s/}$/};/e
augroup END

"==========Latex==========
augroup latex
	autocmd FileType tex,plaintex nmap <silent><buffer> ,r :-1read ~/doc/pers/Latex/Templates/relazione.tex<CR>
	autocmd FileType tex,plaintex nmap <silent><buffer> ,a :-1read ~/doc/pers/Latex/Templates/template.tex<CR>
	autocmd FileType tex,plaintex imap <silent><buffer> ,e <ESC>:-1read ~/doc/pers/Latex/Templates/equation.tex<CR>
	autocmd FileType tex,plaintex imap <silent><buffer> ,d <ESC>:-1read ~/doc/pers/Latex/Templates/definition.tex<CR>
	autocmd FileType tex,plaintex imap <silent><buffer> ,t <ESC>:-1read ~/doc/pers/Latex/Templates/theorem.tex<CR>
	autocmd FileType tex,plaintex imap <silent><buffer> ,p <ESC>:-1read ~/doc/pers/Latex/Templates/deriv_parziale.tex<CR>
	autocmd FileType tex,plaintex nnoremap <buffer><Leader>s :w<CR> :!pdflatex %<CR><CR>
	autocmd FileType tex,plaintex nnoremap <buffer><Leader>S :w<CR> :!pdflatex %<CR>
	autocmd FileType tex,plaintex nmap <buffer><Leader>p :!zathura %:r.pdf &<CR>
	autocmd FileType tex,plaintex imap <buffer> aa \`{a}
	autocmd FileType tex,plaintex imap <buffer> ee \`{e}
	autocmd FileType tex,plaintex imap <buffer> oo \`{o}
	autocmd FileType tex,plaintex imap <buffer> ii \`{i}
	autocmd FileType tex,plaintex imap <buffer> uu \`{u}
	autocmd FileType tex,plaintex imap <buffer> EE \`{E}
augroup END

"==========Groff=============
augroup groff
	autocmd FileType nroff nmap <buffer><Leader>s :w<CR> :!groff -e -ms % -T pdf > %:r.pdf<CR>
	autocmd FileType nroff nmap <buffer><Leader>p :!zathura %:r.pdf & disown<CR>
	autocmd FileType nroff imap <buffer> ee \[`e]
	autocmd FileType nroff imap <buffer> aa \[`a]
	autocmd FileType nroff imap <buffer> ii \[`i]
	autocmd FileType nroff imap <buffer> oo \[`o]
	autocmd FileType nroff imap <buffer> uu \[`u]
	autocmd BufNew,Filetype xmath :-1read ~/doc/pers/groff_template.ms
	autocmd FileType xmath :set filetype=nroff
augroup END

"==========C==========
augroup C
	autocmd FileType c :setlocal cindent
augroup END

"==========Haskell==========
augroup Haskell
	autocmd FileType haskell :setlocal formatprg="hindent --indent-size=4"
	autocmd FileType haskell :setlocal equalprg="hindent --indent-size=4"
	autocmd FileType haskell :setlocal expandtab smarttab
	autocmd FileType haskell :setlocal tabstop=4 shiftwidth=4
augroup END

"==========Email==========
augroup mail
	autocmd BufEnter neomutt-* :$read /home/mario/.local/share/signature.txt
augroup END
]])
