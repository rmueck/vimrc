" Ruediger Mueck vimrc
"
" Install plug first!
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Plugins {{{
call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox',
  Plug 'tomasr/molokai',
  Plug 'altercation/vim-colors-solarized',
  Plug 'mbbill/undotree',
  Plug 'scrooloose/nerdtree',
  Plug 'vim-syntastic/syntastic',
  Plug 'vim-airline/vim-airline',
  Plug 'tomtom/tcomment_vim',
  Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
  Plug 'tpope/vim-surround'
call plug#end()
" }}}

" Basic {{{
syntax on
filetype plugin indent on
let mapleader = " "
let g:mapleader = " "
set exrc
set number
set relativenumber
set wildmenu
set wildmode=list:longest,full
set guicursor=
set history=5000
set noerrorbells
set formatoptions-=cro
set foldlevel=99
set foldmethod=indent
set smartindent
set nowrap
" }}}

" Tabs {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}

" Backup & Swap {{{
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" }}}

" Search {{{
set incsearch
set nohlsearch
set smartcase
set ignorecase
" }}}

" Visual {{{
set cursorline
set background=dark
let g:solarized_termcolors=256
set notermguicolors
set scrolloff=8
set signcolumn=auto
let g:molokai_original = 1
" colorscheme solarized
colorscheme molokai
"}}}

" NERDTree settings {{{
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}

" Mapping {{{
nnoremap <F5> :UndotreeToggle<CR>
nmap <leader>w :w!<cr>
set pastetoggle=<F2>
" Edit vimrc configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>r :source $MYVIMRC<CR>
" Easy windows navigation!
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
"
" :W sudo saves the file
command W w !sudo tee % > /dev/null
" }}}

" augroups {{{
augroup vim_folding
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup rm_whitespace
  autocmd!
  autocmd BufWritePre * :call DeleteTrailingWS()
augroup END
" }}}

" Functions {{{
" -------------------------
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Make VIM remember position in file after reopen
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }}}

