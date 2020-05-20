" === NEO VIM SETUP ===
scriptencoding utf-8
" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

call plug#begin("~/.local/share/nvim/plugged")
" Color scheme
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'


" General utils
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alvan/vim-closetag'
Plug 'junegunn/goyo.vim'
Plug 'liuchengxu/vista.vim'


" Git
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'


" === SEARCHING
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'


" File explorer
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
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
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ap/vim-css-color'
Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'posva/vim-vue'

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
set number
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
set shortmess+=c
set backspace=2
set wildmenu " Command line completion
set showcmd " Show partial commands in the last line of the screen
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set t_Co=16 " Force vim to use 16 ANSI colors
set splitbelow " Default split direction
set splitright
set showmatch


" ============================================================================ "
" ===                                SOURCES                               === "
" ============================================================================ "


source ~/.config/nvim/functions.vim
source ~/.config/nvim/plugins_config.vim
source ~/.config/nvim/keymaps.vim
