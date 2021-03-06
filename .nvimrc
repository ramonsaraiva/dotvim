filetype off

call plug#begin('~/.local/share/nvim/plugged')

" files
Plug 'scrooloose/nerdtree', { 'do': 'NERDTreeToggle' }
Plug 'mileszs/ack.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-python/python-syntax'
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim',          { 'for': ['html', 'jinja'] }
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax', { 'for': 'python' }

" colorschemes
Plug 'joshdick/onedark.vim'

" functional
Plug 'kevinhui/vim-docker-tools'
Plug 'vim-test/vim-test'
Plug 'pwntester/octo.nvim'

" clojure
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-salve',                            { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-highlight',            { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni',                 { 'for': 'clojure' }

" javascript
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" elixir
Plug 'elixir-editors/vim-elixir',    {'for': 'elixir'}
Plug 'slashmili/alchemist.vim',      {'for': 'elixir'}

" elm
Plug 'ElmCast/elm-vim',              {'for': 'elm'}

" vue
Plug 'posva/vim-vue',                {'for': 'vue'}

" terraform
Plug 'hashivim/vim-terraform', {'for': 'terraform'}


call plug#end()

filetype plugin indent on

if has('macunix')
    language en_US
else
    language en_US.UTF-8
endif

"set lazyredraw
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

autocmd FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType elm set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vue set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType tf set tabstop=2 shiftwidth=2 softtabstop=2

set backspace=indent,eol,start

" colorscheme settings
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

function Highlights()
    hi semshiSelf cterm=italic gui=italic
    hi semshiBuiltin cterm=italic gui=italic
    hi Comment cterm=italic gui=italic
endfunction
autocmd FileType python call Highlights()

set termguicolors
set t_Co=256
set colorcolumn=80,90,100
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

" black
autocmd BufWritePost *.py silent! execute ':Black'

let mapleader=','

if has('macunix') == 0
    let g:python_host_prog = '/home/ramon/.pyenv/versions/2.7.18/bin/python'
    let g:python3_host_prog = '/home/ramon/.pyenv/versions/3.9.2/bin/python'
else
    let g:python_host_prog = '/Users/ramonsaraiva/.pyenv/2.7.18/python'
    let g:python3_host_prog = '/Users/ramonsaraiva/.pyenv/3.9.2/python'
endif

set completeopt=longest,menuone

" coc
let g:coc_disable_startup_warning = 0
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

" semshi
let g:semshi#mark_selected_nodes = 0

" nerdtree
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.vim$', '\~$', '\.pyc$', '\.swp$', 'harvest_*', 'node_modules']
let NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks = 1

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

" vim-test
let test#strategy = "neovim"
let django_service = trim(system('docker-compose ps --service | grep django'))
let g:test#python#djangotest#executable = 'docker-compose exec '.django_service.' python manage.py test'
map <C-t>n :TestNearest<cr>
map <C-t>f :TestFile<cr>
map <C-t>l :TestLast<cr>
map <C-t>v :TestVisit<cr>

" dockertools
let g:dockertools_default_all = 0

" ranger
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
map <leader>r :Ranger<CR>

" mappings
noremap <space> viw
noremap <leader>a =ip
noremap <leader>rc :vsplit $MYVIMRC<cr>
noremap <leader>rx :vsplit ~/.cfg/.Xresources<cr>
noremap <leader>rxs :!xrdb ~/.cfg/.Xresources<cr>
noremap <leader>ra :vsplit ~/.cfg/.alacritty.yml<cr>
noremap <leader>kc :vsplit ~/.cfg/kitty.conf<cr>
noremap <leader>pr :!cp -rf ~/.cfg/.pr_template.md /tmp/.pr_template.md<cr><cr>:vsplit /tmp/.pr_template.md<cr>:Goyo<cr>
noremap <leader>jt :!cp -rf ~/.cfg/.jira_template.md /tmp/.jira_template.md<cr><cr>:vsplit /tmp/.jira_template.md<cr>:Goyo<cr>
noremap <leader>n :NERDTree<cr>
noremap <leader>f :Ack<space>
noremap <leader>t :TagbarToggle<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>go :Goyo<cr>
noremap <leader>u :RunTests<cr>
noremap <leader>do :DockerToolsOpen<cr>
noremap <leader>dc :DockerToolsClose<cr>
noremap <leader>d :normal iimport ipdb; ipdb.set_trace()<ESC>
noremap <leader>q :q<cr>
noremap <leader>w :w<cr>
noremap <silent> ,/ :nohlsearch<CR>
noremap <leader>o :Octo<space>

" tabs and panes
noremap <leader>v <C-w>v<cr>
noremap <leader>h <C-w>n<cr>
noremap <S-l> gt
noremap <S-h> gT
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

map <C-p> :Telescope find_files<cr>
noremap <leader>md :MarkdownPreview<cr>

augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
augroup END

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
