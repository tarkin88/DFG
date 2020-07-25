let mapleader = ','

" Alternate way to save
nnoremap <C-S> :w<CR>
vnoremap <C-S> <esc>:w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <silent> <C-s> :w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>

" Ctrl + C to xclip
vnoremap <C-c> "+y

" similar ctrl A
nnoremap <C-A> ggvG$

" Move selected line / block of text in visual mode
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap <silent> <C-S-Up> :move '<-2<CR>
xnoremap <silent> <C-S-Down> :move '>+1<CR>

nnoremap <silent><Tab> <C-w>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <silent> <M-S-Down>    :resize -2<CR>
nnoremap <silent> <M-S-Up>    :resize +2<CR>
nnoremap <silent> <M-S-Right>    :vertical resize -2<CR>
nnoremap <silent> <M-S-Left>    :vertical resize +2<CR>

nnoremap  <silent>   <tab> <C-w>w <CR>

nnoremap <silent> <M-Right> :bnext<CR>
nnoremap <silent> <M-Left> :bprevious<CR>
nnoremap <silent> <M-Down> :bd<CR>
