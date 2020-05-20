
" ============================================================================ "
" ===                              MAPPINGS                                === "
" ============================================================================ "

let mapleader = ','

" == basic shortcuts
nnoremap <C-S> :w<CR>
vnoremap <C-S> <esc>:w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Ctrl + C to xclip
vnoremap <C-c> "+y
" similar ctrl A
nnoremap <C-A> ggvG$
" vertical split
nnoremap <silent> vv <C-w>v
" == RESIZE WINDOW
nnoremap <S-Up> :resize +3<CR>
nnoremap <S-Down> :resize -3<CR>
nnoremap <S-Left> :vertical resize +3<CR>
nnoremap <S-Right> :vertical resize -3<CR>

" == Basic navigation
nmap <F2> :NERDTreeToggle<CR> " Open nerdtree
nnoremap <F3> :UndotreeToggle<cr> " Open undo tree
nmap <C-P> :Clap files<CR>
nmap <C-B> :Clap buffers<CR>
nmap <C-Space> :Clap<CR>

map <leader><ENTER> :Goyo<cr>

inoremap <c-c> <ESC>
