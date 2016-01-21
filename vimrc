execute pathogen#infect()
syntax on
set number
" Enable intentation lines
set list
set listchars=tab:\┆\ 

" Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4

" Disable backups
set nobackup
set nowritebackup
set noswapfile
set noundofile

filetype plugin indent on

"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"CTRLP
set runtimepath^=~/.vim/bundle/ctrlp.vim

"Airline
let g:airline_powerline_fonts = 1

"gitgutter
set updatetime=250

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Overwrite commands
map <C-l> :NERDTreeToggle<CR>

