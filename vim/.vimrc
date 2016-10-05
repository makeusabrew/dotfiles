set nocompatible
set softtabstop=2
set shiftwidth=2
set tabstop=2
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
set updatetime=1000

" not always on by default
syntax enable

map <Tab> <C-w>w

let g:syntastic_javascript_checkers=['jsxhint']

let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeWinSize = 40

let coffee_compile_vert = 1

let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=45

let g:gitgutter_sign_column_always = 1

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

let mapleader = ","
nnoremap <Leader>t :NERDTreeTabsToggle<CR>
autocmd BufRead,BufNewFile *.coffee,*.html,*.js,*.jsx,*.scss setlocal sw=2 sts=2 et
autocmd BufRead,BufNewFile *.php setlocal sw=2 sts=2 et

colorscheme molokai
imap jk <Esc>
nnoremap <Leader>r :RevealBookmark
