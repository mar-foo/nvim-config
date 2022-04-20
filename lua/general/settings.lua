vim.g.mapleader = ','

local set = vim.api.nvim_set_option

set('autoindent', true)                     -- Good auto indent
set('background', 'dark')                   -- tell vim what the background color looks like
set('clipboard', 'unnamedplus')             -- Copy paste between vim and everything else
set('conceallevel', 0)                      -- So that I can see `` in markdown files
set('cul', true)                            -- Enable highlighting of the current line
set('cursorline', false)
set('encoding', 'utf-8')                    -- The encoding displayed
set('fileencoding', 'utf-8')                -- The encoding written to file
set('hidden', true)
set('laststatus', 2)                        -- Always display the status line
set('mouse', 'a')                           -- Enable your mouse
set('pumheight', 10)                        -- Makes popup menu smaller
set('ruler', true)                          -- Show the cursor position all the time
set('shiftwidth', 8)                        -- Change the number of space characters inserted for indentation
set('smartindent', true)                    -- Makes indenting smart
set('softtabstop', 8)
set('splitbelow', true)                     -- Horizontal splits will automatically be below
set('splitright', true)                     -- Vertical splits will automatically be to the right
set('syntax', 'enable')
set('t_Co', '256')                          -- Support 256 colors
set('tabstop', 8)
set('textwidth', 79)
set('timeoutlen', 500)                      -- By default timeoutlen is 1000 ms
set('updatetime', 300)                      -- Faster completion
set('wrap', false)                          -- Display long lines as just one line

vim.api.nvim_exec('set formatoptions-=cro', true)              -- Stop newline continution of comments

-- My configuration
--------------------
set('ignorecase', true)
set('smartcase', true)
set('scrolloff', 8)
set('hlsearch', false)

vim.cmd([[
set colorcolumn=80
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
	autocmd FileType c :setlocal equalprg=cb
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
