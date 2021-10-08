" Ruediger Mueck vimrc
"
" Install plug first!
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Plugins {{{
call plug#begin('~/.vim/plugged')
  " Colors
  Plug 'https://github.com/morhetz/gruvbox',
  Plug 'https://github.com/tomasr/molokai',
  Plug 'https://github.com/altercation/vim-colors-solarized',
  Plug 'https://github.com/NLKNguyen/papercolor-theme',
  Plug 'https://github.com/zefei/simple-dark',
  Plug 'https://github.com/jonathanfilip/vim-lucius',
  " ------------------------------------------------------------
  Plug 'https://github.com/scrooloose/nerdtree',
  Plug 'https://github.com/vim-syntastic/syntastic',
  Plug 'https://github.com/vim-airline/vim-airline',
  Plug 'https://github.com/vim-airline/vim-airline-themes',
  Plug 'https://github.com/tomtom/tcomment_vim',
  Plug 'https://github.com/tpope/vim-surround',
  Plug 'https://github.com/tpope/vim-fugitive',
  Plug 'https://github.com/airblade/vim-gitgutter',
  Plug 'https://github.com/mbbill/undotree',
  Plug 'https://github.com/rodjek/vim-puppet', { 'for': 'puppet' }
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
set wildmode=full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set guicursor=
set history=5000
set noerrorbells
set formatoptions-=cro
set foldlevel=99
set foldmethod=indent
set smartindent
set splitbelow
set splitright
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
set t_Co=256
let g:solarized_termcolors=256
let g:bluedrake_256=1
let g:molokai_original = 0
set notermguicolors
set scrolloff=8
set signcolumn=auto
" colorscheme solarized
" colorscheme PaperColor
" colorscheme gruvbox
" colorscheme lucius
" colorscheme molokai
colorscheme simple-dark
let g:airline_theme='lucius'
"}}}

" NERDTree settings {{{
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}

" Mapping {{{
set pastetoggle=<F2>
nnoremap <F5> :UndotreeToggle<CR>
nmap <leader>w :w!<cr>

" Edit vimrc configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>r :source $MYVIMRC<CR>

" :W sudo saves the file
command W w !sudo tee % > /dev/null
" }}}

" Navigation {{{
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Buffer Navigation
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-l> :bnext<CR>
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

