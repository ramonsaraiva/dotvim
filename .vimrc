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
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

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

set backspace=indent,eol,start

set t_Co=256
set background=dark
set colorcolumn=100
colorscheme gruvbox
set laststatus=2

set listchars=tab:»-,trail:·,precedes:<,extends:>,
set list

" custom mappings
call togglebg#map('<F5>')

" nerdtree
map <F4> :NERDTree<CR>

" select word with space
map <space> viw

" plugin settings
let NERDTreeIgnore=['\.pyc$', '\~$']

command UseBikeDev :%s/res\//www\/res\/
command UseBikeProd :%s/www\/res\//res\/
