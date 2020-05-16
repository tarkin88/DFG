" == Basic Shortcuts
let mapleader=','
nmap <C-S> :w <CR>                " Save
vnoremap <C-S> <esc>:w<CR>
inoremap <C-S> <esc>:w<CR>
nmap <C-Q> :q <CR>                " Exit
nnoremap <C-A> ggvG$              " Ctrl + A
vnoremap <C-c> "+y                " Copy yank
nnoremap <silent> vv <C-w>v       " Vertical split
nmap <F4> :buffers<CR>:buffer<Space>

" === Plugins shotcuts
nmap <F3> :UndotreeToggle<cr> " Open undo tree
nmap <F2> :NERDTreeToggle<CR> " Open nerdtree

