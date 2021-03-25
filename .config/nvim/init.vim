" basics
set encoding=utf-8
let mapleader=","
set ttyfast
set lazyredraw
set noswapfile
set nobackup
set number relativenumber
set bg=light
set tabstop=4
set sw=4
set noexpandtab
set autoindent
set smartindent
set ignorecase
set nohlsearch
set incsearch
set showmatch
set magic
set wrap linebreak

" syntax
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufRead,BufNewFile *.ms set filetype=groff
autocmd BufRead,BufNewFile *.ms set tw=70
autocmd BufRead,BufNewFile *.[1-9] set filetype=groff
autocmd BufRead,BufNewFile *.[1-9] set tw=70
autocmd BufRead,BufNewFile *.txt set tw=70
syntax on
filetype plugin indent on
