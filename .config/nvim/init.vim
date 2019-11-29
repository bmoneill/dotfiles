" compiler and spell checker
let mapleader=","
map <leader>c :w! \| !make <CR><CR>
map <leader>s :w! \| :setlocal spell spelllang=en_us <CR>

command W w !sudo tee % > /dev/null


" basics
set nocompatible
set noswapfile
filetype off
syntax on
set autoread
set encoding=utf-8

" ui
set wildmenu
set cmdheight=2
set number relativenumber
colorscheme solarized8_high

" tabs
set mouse=a
set tabstop=4
set sw=4
set noexpandtab
set autoindent
set smartindent
set wrap

set ignorecase
set nohlsearch
set incsearch

set magic

set showmatch

set background=dark


set runtimepath+=~/.config/nvim/bundle/*
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'felipec/notmuch-vim'
"NeoBundleFetch 'ycm-core/YouCompleteMe'
NeoBundleFetch 'kmyk/brainfuck-highlight.vim'
NeoBundleFetch 'junegunn/fzf.vim'
NeoBundleFetch 'tpope/vim-surround'
call neobundle#end()

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufRead,BufNewFile *.ms set filetype=groff
autocmd BufRead,BufNewFile *.ms set tw=80
autocmd BufRead,BufNewFile *.mom set filetype=groff
autocmd BufRead,BufNewFile *.mom set tw=80
autocmd BufRead,BufNewFile *.[1-9] set filetype=groff
autocmd BufRead,BufNewFile *.[1-9] set tw=80
autocmd BufRead,BufNewFile *.md set tw=80
autocmd BufRead,BufNewFile *.b set filetype=brainfuck
autocmd BufRead,BufNewFile *.bf set filetype=brainfuck

filetype plugin indent on
