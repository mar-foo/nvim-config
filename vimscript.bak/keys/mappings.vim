" source: https://chrisatmachine.com/Neovim/02-vim-general-setup/
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in normal mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" My configuration
"==========Window and buffer management==========
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>c :wincmd c<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader><space> /<++><CR>ca<
nnoremap <Leader>d :bd!<CR>
nnoremap <Leader>o :only!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>b :ls<CR>
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>

"==========Registers==========
nmap dD "_dd

"==========Movements==========
nmap <down> ddp
nmap <right> dwea<Leader><ESC>pxb
nmap <left> dwbPa<Leader><ESC>b
nmap <up> ddkP
imap <down> <Nop>
imap <right> <Nop>
imap <left> <Nop>
imap <up>  <Nop>
vmap <down> <Nop>
vmap <right> <Nop>
vmap <left> <Nop>
vmap <up> <Nop>
nmap <CR> i<CR><ESC>k
nmap E gE
nnoremap L $
nmap g{ f{a
nmap g} F}i

"==========Make some room==========
nmap go o<ESC>k
nmap gO O<ESC>j

"==========Center the screen==========
nnoremap G Gzz
nmap n nzz
nmap N Nzz

"==========Shortcuts==========
nnoremap <Leader>fed :e $MYVIMRC<cr>
nnoremap <Leader>feR :source $MYVIMRC<cr>
