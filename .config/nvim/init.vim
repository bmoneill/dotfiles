" basics
set encoding=utf-8
let mapleader = ","
set ttyfast
set lazyredraw
set noswapfile
set nobackup

" ui
set number relativenumber
set bg=light

" tabs
set tabstop=4
set sw=4
set noexpandtab
set autoindent
set smartindent

" line wrap
set wrap

" searching
set ignorecase
set nohlsearch
set incsearch
set showmatch
set magic

" plugin settings
let g:vimwiki_list = [{'path': '~/docs/wiki1/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'template_path': '~/docs/wiki1/templates/',
                      \ 'template_default': 'default',
                      \ 'path_html': '~/docs/wiki1/site_html/',
                      \ 'custom_wiki2html': 'vimwiki2md',
				      \ 'template_ext': '.tpl'},
					  \ {'path': '~/docs/wiki2/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'template_path': '~/docs/wiki2/templates/',
                      \ 'template_default': 'default',
                      \ 'path_html': '~/docs/wiki2/site_html/',
                      \ 'custom_wiki2html': 'vimwiki2md',
				      \ 'template_ext': '.tpl'}]


" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
call plug#end()

" syntax
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufRead,BufNewFile *.m[s,om] set filetype=groff
autocmd BufRead,BufNewFile *.m[s,om,d] set tw=70
autocmd BufRead,BufNewFile *.[1-9] set filetype=groff
autocmd BufRead,BufNewFile *.[1-9] set tw=70
autocmd BufRead,BufNewFile *.txt set tw=70
autocmd BufRead,BufNewFile *.b set filetype=brainfuck
autocmd BufRead,BufNewFile *.bf set filetype=brainfuck
syntax on
filetype plugin indent on
