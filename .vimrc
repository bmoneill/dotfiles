set encoding=utf-8
let mapleader = ","

syntax on
set ttyfast
set lazyredraw
set noswapfile

" ui
set wildmenu
set cmdheight=2
set number relativenumber

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

function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> /* ConditionalPairMap('/* ', ' */')
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufRead,BufNewFile *.ms set filetype=groff
autocmd BufRead,BufNewFile *.ms set tw=70
autocmd BufRead,BufNewFile *.mom set filetype=groff
autocmd BufRead,BufNewFile *.mom set tw=70
autocmd BufRead,BufNewFile *.[1-9] set filetype=groff
autocmd BufRead,BufNewFile *.[1-9] set tw=70
autocmd BufRead,BufNewFile *.md set tw=70
autocmd BufRead,BufNewFile *.txt set tw=70
autocmd BufRead,BufNewFile *.b set filetype=brainfuck
autocmd BufRead,BufNewFile *.bf set filetype=brainfuck
filetype plugin indent on

" cursor
if &term =~ '^st-256color'
	autocmd InsertEnter,InsertLeave * set cul!
	let &t_SI = "\e[6 q"
	let &t_EI = "\e[2 q"
	autocmd VimEnter * silent !echo -ne "\e[2 q"
endif
