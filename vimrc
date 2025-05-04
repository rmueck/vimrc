"
" http://babagit.ddns.net:8080/baba/vimrc.git
"
" Plugins {{{
call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/morhetz/gruvbox',
  Plug 'https://github.com/rmueck/molokai',
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
  Plug 'https://github.com/plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'https://github.com/junegunn/fzf.vim'
call plug#end()
" }}}

" Basic {{{
set nocompatible
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
:if version > 750
    set signcolumn=yes
    "set termguicolors
:endif
set scrolloff=8
" colorscheme solarized
" colorscheme PaperColor
colorscheme molokai
" colorscheme simple-dark
" colorscheme gruvbox
" colorscheme lucius
" let g:airline_theme='lucius'
"}}}

" Syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_shell = "/bin/sh"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open  = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_debug=0
" let g:syntastic_puppet_puppetlint_quiet_messages = { "level" : "warnings" }
" }}}

" NERDTree settings {{{
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=0
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.zip$', '\.pdf$', '\.jpg$', '\.doc$', '\.xls.$']
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}

" Mapping {{{
set pastetoggle=<F2>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F6> :GitGutterBufferToggle<CR>
nmap <leader>w :w!<cr>
command! W w !sudo tee % > /dev/null
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
nnoremap <Leader>e :e $MYVIMRC<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>
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
augroup default
    autocmd!
    autocmd FileType * setlocal background=dark
    " autocmd FileType * colo simple-dark
augroup END

augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    " autocmd BufWritePost ~/.vimrc    source ~/.vimrc
    autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
    autocmd BufWritePost augroup.vim so ~/.vim/augroup.vim
augroup END

augroup whitespace
    autocmd!
    autocmd BufWritePre * :call DeleteTrailingWS()
augroup END

augroup markdown
    autocmd!
    autocmd FileType markdown set textwidth=80
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal background=light
    autocmd FileType markdown colo lucius
    autocmd FileType markdown setlocal conceallevel=2
augroup END
" }}}

" set filetype for shoutcast configs {{{
au BufRead,BufNewFile sc*.conf set filetype=dosini
"}}}

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

