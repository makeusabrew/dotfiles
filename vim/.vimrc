set nocompatible
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set number
set ruler
set smartindent
set autoindent
set nowrap
set hlsearch
set wildmenu
set wildmode=list:longest

set scrolloff=3
set sidescrolloff=5

syntax enable

:map <Tab> <C-w>w

au BufRead,BufNewFile *.ejs set syntax=html

if filereadable($HOME.'/.vim/.vimrc.local')
  source ~/.vim/.vimrc.local
endif

let g:syntastic_javascript_checkers=['jshint']

execute pathogen#infect()
