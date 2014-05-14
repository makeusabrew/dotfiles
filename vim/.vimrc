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
set title

" not always on by default
syntax enable

map <Tab> <C-w>w

let g:syntastic_javascript_checkers=['jshint']

let coffee_compile_vert = 1

" required for CoffeeScript goodness
filetype plugin indent on

" any local overrides just before pathogen
if filereadable($HOME.'/.vim/.vimrc.local')
    source ~/.vim/.vimrc.local
endif

" gnome terminal isn't good at advertising its colour capabilities
" if $COLORTERM == 'gnome-terminal'
    set t_Co=256
" endif

execute pathogen#infect()

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
