"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" files
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" ui
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive' " git
Plugin 'airblade/vim-gitgutter' " git
Plugin 'davidhalter/jedi-vim' " py autocomplete

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

call vundle#end()

filetype plugin indent on

set noswapfile 

" line numbers
set nu

" tab as spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8

let python_highlight_all=1
syntax on

autocmd FileType python set autoindent
autocmd FileType python set smartindent
autocmd FileType python set textwidth=79

set backspace=indent,eol,start

set t_Co=256
set background=dark
set colorcolumn=100
colorscheme gruvbox
set laststatus=2

set listchars=tab:▷,trail:·,nbsp:·,precedes:<,extends:>,eol:¬
set list

set mouse=a

" custom mappings
call togglebg#map('<F5>')

" nerdtree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F4> :NERDTree<CR>

" select word with space
map <space> viw

" plugin settings
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:gruvbox_contrast_dark='soft'

command UseBikeDev :%s/res\//www\/res\/
command UseBikeProd :%s/www\/res\//res\/
