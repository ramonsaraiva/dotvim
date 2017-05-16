filetype off

call plug#begin('~/.local/share/nvim/plugged')

" files
Plug 'scrooloose/nerdtree', { 'do': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy finder

" syntax
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

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
Plug 'tomasr/molokai'

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

set showbreak=↪\ 
set listchars=tab:\|_,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

set mouse=a

set formatoptions-=t

" neomake
autocmd! BufWritePost * Neomake

" deoplete
let g:python_host_prog = '/Users/ramon/.pyenv/versions/2.7.10/envs/neovim2/bin/python'
let g:python3_host_prog = '/Users/ramon/.pyenv/versions/3.5.0/envs/neovim3/bin/python'
let g:deoplete#enable_at_startup = 1

" nerdtree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" gruvbox
let g:gruvbox_contrast_dark='soft'

" mappings
noremap <F4> :NERDTree<CR>
noremap <space> viw
noremap <F8> :TagbarToggle<CR>
noremap <silent> <C-p> :FZF -m<cr>

:command Debug :normal i import ipdb; ipdb.set_trace()<ESC>
