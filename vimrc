call plug#begin('~/.vim/plugged')
call plug#end()

" Enable syntax
syntax on

" Make vi imporived
set nocompatible

" fish fix
set shell=bash

"au BufRead,BufNewFile * start

" Hide statusbar
"set noshowmode

" Enable mouse use in all modes
set mouse=a

" Lines above/below cursor
set scrolloff=5

" Stop wrapping
set nowrap

" Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4

" Save position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disable custom vim title
set titlestring=URxvt\ [vim\ %F]

" Enable line numbers
set number

" Enable intentation lines
set list
set listchars=tab:\┆\ 



"" MISC

" Disable backups
set nobackup
set nowritebackup
set noswapfile
set noundofile

" hdni stuff
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set tabstop=4
set more
set wildmenu
set history=200
set matchtime=2
set autoread
set backspace=indent,eol,start
