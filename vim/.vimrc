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

" not always on by default
syntax enable

:map <Tab> <C-w>w

let g:syntastic_javascript_checkers=['jshint']

" required for CoffeeScript goodness
filetype plugin indent on

" any local overrides just before pathogen
if filereadable($HOME.'/.vim/.vimrc.local')
  source ~/.vim/.vimrc.local
endif

execute pathogen#infect()
