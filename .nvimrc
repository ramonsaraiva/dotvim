filetype off

call plug#begin('~/.local/share/nvim/plugged')

" files
Plug 'scrooloose/nerdtree', { 'do': 'NERDTreeToggle' }
Plug '~/.fzf' " fuzzy finder
Plug 'rking/ag.vim'

" syntax
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'

" ui
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lepture/vim-jinja'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'lepture/vim-jinja'

" text
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'

" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'gosukiwi/vim-atom-dark'

" clojure
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-salve',                            { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-highlight',            { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni',                 { 'for': 'clojure' }

call plug#end()

filetype plugin indent on

language en_US.UTF8
set nobackup
set noswapfile 
set hidden

set ignorecase
set smartcase
set hlsearch
set incsearch

" line numbers
set number
set ruler

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

" colorscheme settings
let g:gruvbox_contrast_dark = 'soft'

set t_Co=256
set colorcolumn=80,90
set background=dark
colorscheme onedark
set laststatus=2
set cursorline

set showbreak=↪\ 
set listchars=tab:\|_,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

set mouse=a

set formatoptions-=t

" neomake
autocmd! BufWritePost * Neomake

let mapleader=','

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" deoplete
let g:python_host_prog = '/Users/ramon/.pyenv/versions/2.7.10/envs/neovim2/bin/python'
let g:python3_host_prog = '/Users/ramon/.pyenv/versions/3.5.0/envs/neovim3/bin/python'
let g:deoplete#enable_at_startup = 0
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
set completeopt-=preview

" nerdtree
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.vim$', '\~$', '\.pyc$', '\.swp$', 'harvest_*']
let NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" rainbow
let g:rainbow_active = 1

" airline
let g:airline_theme = 'onedark'

" mappings
noremap <space> viw
noremap <leader>a =ip
noremap <leader>rc :vsplit $MYVIMRC<cr>
noremap <leader>rcs :source $MYVIMRC<cr>
noremap <leader>pr :!cp -rf ~/.cfg/.pr_template /tmp/.pr_template<cr><cr>:vsplit /tmp/.pr_template<cr>:Goyo<cr>
noremap <leader>jt :!cp -rf ~/.cfg/.jira_template /tmp/.jira_template<cr><cr>:vsplit /tmp/.jira_template<cr>:Goyo<cr>
noremap <leader>n :NERDTree<cr>
noremap <leader>A :Ag<space>
noremap <leader>f :Ag<cr>
noremap <leader>t :TagbarToggle<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>go :Goyo<cr>
noremap <silent> <C-p> :FZF -m<cr>
noremap <leader>u :RunTests<cr>
noremap <leader>d :normal iimport ipdb; ipdb.set_trace()<ESC>
noremap <leader>q :q<cr>

" tabs and panes
noremap <leader>v <C-w>v<cr>
noremap <leader>h <C-w>n<cr>
noremap <S-l> gt
noremap <S-h> gT
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
