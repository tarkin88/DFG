" === NEO VIM SETUP ===
scriptencoding utf-8
" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "


call plug#begin("~/.local/share/nvim/plugged")
" Color scheme
Plug 'joshdick/onedark.vim'

" General utils
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alvan/vim-closetag'


" Git
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'liuchengxu/vim-clap'

" Status Line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Better coding
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree' " undo history visualizer

" Syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-match-highlight'

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-cssomni'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

"Plug 'vim-vdebug/vdebug'
call plug#end()


" ============================================================================ "
" ===                               SETTINGS                               === "
" ============================================================================ "

syntax on
set termguicolors
set diffopt+=vertical             " Always use vertical diffs
set cursorline                    " set cursor
set autoindent                    " automatically set indent of new line
set smartindent
set backspace=indent,eol,start    " Make backspace behave in a same manner
set expandtab                     " Convert tabs to spaces
set shiftround                    " Round indenty to a multiple of 'shiftwidth'
set shiftwidth=2                  " Number of spaces to use for indent or unidendt
set smartindent                   " Tab respects 'tabsot', 'shifwidth'. and 'softtabstop'
set tabstop=2                     " The visible width of the tabs
set laststatus=2                  " show the status line all the time
set autoread                      " detect when a file is changed
set scrolloff=2                   " Display at least 3 lines around you cursor
set number relativenumber         " Relative numbers
set nu rnu                        " Relatine numbers
hi CursorLine ctermbg=235
highlight Cursor ctermbg=Green
set hidden
set nobackup
set noswapfile                    " get rid of swapfiles everywhere
set nowritebackup
set updatetime=300
set signcolumn=yes
set textwidth=120
set ignorecase                    " Sensitive case for local search
set smartcase
set encoding=utf-8
set magic                         " set magic on, for regex
set mat=2                         " how many tenths of a second to blink
set showmatch                     " show matching braces
filetype plugin indent on         " detecth the filetype
set list
set cmdheight=2                   " Give more space for displaying messages.

"filetype plugin on
set shortmess+=c


" ============================================================================ "
" ===                                SOURCES                               === "
" ============================================================================ "


source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/plugins_config.vim
"source ~/.config/nvim/functions.vim
