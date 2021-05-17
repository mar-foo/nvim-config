" source: https://chrisatmachine.com/Neovim/02-vim-general-setup/
" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
"set laststatus=0                       " Always display the status line
set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
"set noshowmode                         " We don't need to see things like -- INSERT -- anymore
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set colorcolumn=80                      " 80 character lines
set textwidth=79
"set autochdir                          " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vim alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !doas tee %

" Package manager https://github.com/wbthomason/packer.nvim
lua<<EOF
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = '/home/mario/.config/nvim/pack/packer/start'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
EOF

" My configuration
set ignorecase
set smartcase
set incsearch
set scrolloff=8
set nohlsearch

"==========Autocommands==========
autocmd InsertEnter * norm zz
autocmd BufWritePre * %s/\s\+$//e " Remove trailing whitespace

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
