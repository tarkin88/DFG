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

" vertical split
nnoremap <silent><A-v> :vsplit <CR>

" horizontal split
nnoremap <silent><A-h> :split <CR>


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
nnoremap <silent> <M-Down>    :resize -2<CR>
nnoremap <silent> <M-Up>    :resize +2<CR>
nnoremap <silent> <M-Right>    :vertical resize -2<CR>
nnoremap <silent> <M-Left>    :vertical resize +2<CR>


