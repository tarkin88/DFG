
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

" == Basic navigation
nmap <F2> :NERDTreeToggle<CR> " Open nerdtree
nnoremap <F3> :UndotreeToggle<cr> " Open undo tree
nmap <C-P> :Clap files<CR>
nmap <C-B> :Clap buffers<CR>

inoremap <c-c> <ESC>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))

" c-j c-k for moving in snippet
imap <expr> <c-u> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
smap <c-u> <Plug>(ultisnips_expand)
