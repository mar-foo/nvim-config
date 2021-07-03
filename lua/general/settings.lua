vim.g.mapleader = ','

local set = vim.api.nvim_set_option

set('syntax', 'enable')
set('hidden', true)
set('wrap', false)                          -- Display long lines as just one line
set('encoding', 'utf-8')                    -- The encoding displayed
set('pumheight', 10)                        -- Makes popup menu smaller
set('fileencoding', 'utf-8')                -- The encoding written to file
set('ruler', true)              			      -- Show the cursor position all the time
set('mouse', 'a')                           -- Enable your mouse
set('splitbelow', true)                     -- Horizontal splits will automatically be below
set('splitright', true)                     -- Vertical splits will automatically be to the right
set('t_Co', '256')                          -- Support 256 colors
set('conceallevel', 0)                      -- So that I can see `` in markdown files
-- set('tabstop', 2)                           -- Insert 2 spaces for a tab
set('shiftwidth', 4)                        -- Change the number of space characters inserted for indentation
-- set('smarttab', true)                       -- Makes tabbing smarter will realize you have 2 vs 4
set('expandtab', true)                      -- Converts tabs to spaces
set('smartindent', true)                    -- Makes indenting smart
set('autoindent', true)                     -- Good auto indent
set('laststatus', 2)                                           -- Always display the status line
vim.api.nvim_exec('set number relativenumber', true)
set('cul', true)                            -- Enable highlighting of the current line
set('background', 'dark')                   -- tell vim what the background color looks like
-- set('showtabline', 2)                       -- Always show tabs
--set noshowmode                                                -- We don't need to see things like -- INSERT -- anymore
set('updatetime', 300)                      -- Faster completion
set('timeoutlen', 500)                      -- By default timeoutlen is 1000 ms
set('clipboard', 'unnamedplus')             -- Copy paste between vim and everything else
-- set('colorcolumn', 80)                    -- 80 character lines
set('textwidth', 79)

--set('iskeyword+', '-                     	-- treat dash separated words as a word text object--
vim.api.nvim_exec('set formatoptions-=cro', true)              -- Stop newline continution of comments

-- My configuration
--------------------
set('ignorecase', true)
set('smartcase', true)
set('scrolloff', 8)
set('hlsearch', false)

-- Netrw
--------------------
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.g.netrw_winsize=30

vim.cmd([[
set colorcolumn=80
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set smarttab

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
autocmd BufNew,Filetype xmath :-1read ~/Documents/Personal/groff_template.ms
autocmd FileType xmath :set filetype=nroff
  augroup END

"==========Email==========
augroup mail
  autocmd BufEnter neomutt-* read /home/mario/.local/share/signature.txt
  augroup END

"==========Golang==========
  augroup golang
  autocmd FileType go nmap <buffer> <leader>? :GoDoc
  augroup END
]])
