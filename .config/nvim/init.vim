autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufRead,BufNewFile *.ms set filetype=groff
autocmd BufRead,BufNewFile *.ms set tw=80
autocmd BufRead,BufNewFile *.[1-9] set filetype=groff
autocmd BufRead,BufNewFile *.[1-9] set tw=80
autocmd BufRead,BufNewFile *.txt set tw=80
autocmd BufRead,BufNewFile *.md set tw=80
syntax on
filetype plugin indent on

let mapleader=","
set ttyfast
set lazyredraw
set noswapfile
set nobackup
set number relativenumber
set bg=light
set tabstop=4
set sw=4
set smartindent
set ignorecase
set noexpandtab
set showmatch
set magic
set wrap linebreak

	

call plug#begin()
Plug 'jamessan/vim-gnupg'
call plug#end()
