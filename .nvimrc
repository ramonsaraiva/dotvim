filetype off

call plug#begin('~/.local/share/nvim/plugged')

" files
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

" ui
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-gitgutter' " git
Plug 'lepture/vim-jinja' " jinja
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'

" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

set noswapfile 

" line numbers
set relativenumber

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
autocmd FileType python set colorcolumn=79

set backspace=indent,eol,start

set t_Co=256
set background=dark
set colorcolumn=79
colorscheme gruvbox
set laststatus=2

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set listchars=tab:▷-,trail:·,nbsp:·,precedes:<,extends:>,eol:¬
set list

set mouse=a

" nerdtree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" jedi
let g:jedi#popup_on_dot = 0

" gruvbox
let g:gruvbox_contrast_dark='soft'

" mappings
map <F4> :NERDTree<CR>
map <space> viw
map <F8> :TagbarToggle<CR>

:command Debug :normal i import ipdb; ipdb.set_trace()<ESC>
