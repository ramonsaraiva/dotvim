filetype off
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

" files
Plug 'scrooloose/nerdtree', { 'do': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" syntax
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'pbogut/deoplete-elm',   { 'for': 'elm' }
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
Plug 'vim-python/python-syntax'
" Plug 'ehamberg/vim-cute-python'

" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'nightsense/vimspectr'
Plug 'cormacrelf/vim-colors-github'
Plug 'junegunn/seoul256.vim'
Plug 'w0ng/vim-hybrid'

" clojure
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-salve',                            { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-highlight',            { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni',                 { 'for': 'clojure' }

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

" elixir
Plug 'elixir-editors/vim-elixir',    {'for': 'elixir'}
Plug 'slashmili/alchemist.vim',      {'for': 'elixir'}

" elm
Plug 'ElmCast/elm-vim',              {'for': 'elm'}

" vue
Plug 'posva/vim-vue',                {'for': 'vue'}


call plug#end()

filetype plugin indent on

if has('macunix')
    language en_US
else
    language en_US.UTF-8
endif

set title
set nobackup
set nowritebackup
set noswapfile 
set noeol
set hidden
set autoread

set ignorecase
set smartcase
set hlsearch
set incsearch

" line numbers
set number
set ruler
if has('macunix') == 0
    " relativenumber is really slow on macvim
    set relativenumber
endif

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

autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType elm set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vue set tabstop=2 shiftwidth=2 softtabstop=2

set backspace=indent,eol,start

" colorscheme settings
let g:gruvbox_contrast_dark = 'soft'
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

" this is experimental
" TODO: probably use python-specific `syns`
augroup colorextend
    autocmd!
    autocmd FileType python call onedark#extend_highlight("Identifier", { "gui": "italic" })
    autocmd FileType python call onedark#extend_highlight("Repeat", { "gui": "italic" })
    autocmd FileType python call onedark#extend_highlight("Type", { "gui": "italic" })
    autocmd FileType python call onedark#extend_highlight("Define", { "gui": "italic" })
    autocmd FileType python call onedark#extend_highlight("Structure", { "gui": "italic" })
    autocmd FileType python call onedark#extend_highlight("Constant", { "gui": "italic" })
    autocmd FileType python call onedark#extend_highlight("Special", { "gui": "italic" })
augroup END

set t_Co=256
set colorcolumn=80,90
set background=dark
colorscheme onedark
set laststatus=2
if has('macunix') == 0
    " cursorline is really slow on macvim
    set cursorline
endif

set showbreak=↪\ 
set listchars=tab:\|_,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

set mouse=a

set formatoptions-=t

" neomake
autocmd! BufWritePost * Neomake

let mapleader=','

" deoplete
let g:python_host_prog = '/home/ramon/.pyenv/versions/2.7.17/bin/python'
let g:python3_host_prog = '/home/ramon/.pyenv/versions/3.8.1/bin/python'

if has('macunix') == 0
    " deoplete is PROBABLY also slow on mac
    let g:deoplete#enable_at_startup = 1
endif
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
set completeopt-=preview

" nerdtree
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.vim$', '\~$', '\.pyc$', '\.swp$', 'harvest_*', 'node_modules']
let NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks = 1

" ctrlp
let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_bufffer = 'et'

" ack
let g:ackprg = 'rg -S --vimgrep --no-heading'

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" rainbow
let g:rainbow_active = 1

" airline
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_section_y = ''
"let g:airline_section_x = ''
let g:airline_powerline_fonts = 1

" emmet
let g:user_emmet_leader_key=','

" mappings
noremap <space> viw
noremap <leader>a =ip
noremap <leader>rc :vsplit $MYVIMRC<cr>
noremap <leader>rx :vsplit ~/.cfg/.Xresources<cr>
noremap <leader>rxs :!xrdb ~/.cfg/.Xresources<cr>
noremap <leader>ra :vsplit ~/.cfg/.alacritty.yml<cr>
noremap <leader>pr :!cp -rf ~/.cfg/.pr_template /tmp/.pr_template<cr><cr>:vsplit /tmp/.pr_template<cr>:Goyo<cr>
noremap <leader>jt :!cp -rf ~/.cfg/.jira_template /tmp/.jira_template<cr><cr>:vsplit /tmp/.jira_template<cr>:Goyo<cr>
noremap <leader>n :NERDTree<cr>
noremap <leader>f :Ack<space>
noremap <leader>t :TagbarToggle<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>go :Goyo<cr>
noremap <leader>u :RunTests<cr>
noremap <leader>d :normal iimport ipdb; ipdb.set_trace()<ESC>
noremap <leader>q :q<cr>
noremap <leader>w :w<cr>
noremap <silent> ,/ :nohlsearch<CR>

" tabs and panes
noremap <leader>v <C-w>v<cr>
noremap <leader>h <C-w>n<cr>
noremap <S-l> gt
noremap <S-h> gT
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
augroup END
