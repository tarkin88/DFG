"██╗   ██╗██╗███╗   ███╗
"██║   ██║██║████╗ ████║
"██║   ██║██║██╔████╔██║
"╚██╗ ██╔╝██║██║╚██╔╝██║
" ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═══╝  ╚═╝╚═╝     ╚═╝

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'joshdick/onedark.vim' "One Dark Theme
Plug 'morhetz/gruvbox'
"Plug 'jacoborus/tender.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'  " Show a start screen
Plug 'scrooloose/nerdtree'  " file explorer
Plug 'xuyuanp/nerdtree-git-plugin' " git file explorer
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes'  " status bar theme
Plug 'Yggdroot/indentLine' " displaying thin vertical lines
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" General settings
set colorcolumn=120  " Set & show limit column
set number
set termguicolors  " Activa true colors en la terminal
set diffopt+=vertical  " Always use vertical diffs
set scrolloff=2  " Display at least 3 lines around you cursor

" Indentation
set autoindent			" automatically set indent of new line
set smartindent
set laststatus=2		" show the status line all the time
set autoread			" detect when a file is changed
set smarttab " tab respects 'tabstot', 'shiftwidth', and 'softtabstop'
set tabstop=4
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set noshowmode  " hide vim mode, airline show it
" coc (intellisense)
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes


" - - - - - - - - Plugins settings - - - - - - - - - -
"colorscheme onedark  " theme select
colorscheme gruvbox
"colorscheme tender


" vim-devicons
let g:DevIconsEnableFoldersOpenClose = 1

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsx'] = 'ﰆ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*vimrc.*'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.lock.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['node_modules'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['webpack\.'] = 'ﰩ'
" nerdtree
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeChDirMode = 2  " Change focus to actual node
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
" airline
let g:airline#extensions#tabline#enabled = 1  " show buffers as tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " show filename
let g:airline#extensions#bufferline#enabled = 1
let g:airline_powerline_fonts = 1 "load powerline fonts
"let g:airline_theme='onedark'
let g:airline_theme='gruvbox'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
" identline
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
" neosnippet
let g:neosnippet#enable_completed_snippet = 1
" Ale, lintern
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fixers = {
 \ '*': [
 \ 'remove_trailing_lines',
 \ 'trim_whitespace'],
 \ 'javascript': ['eslint'],
 \ }
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '┃'
let g:gitgutter_sign_modified                  = '┃'
let g:gitgutter_sign_removed                   = '┃'
let g:gitgutter_sign_removed_first_line        = '┃'
let g:gitgutter_sign_modified_removed          = '┃'
" coc
inoremap <silent><expr> <c-space> coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight') "Highlight symbol under cursor on CursorHold
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
\ ]
" FZF
nnoremap <silent> <C-p> :call FZFOpen(':FZF')<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"Polyglot
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
setlocal conceallevel=2


"- - - - - - - - - - - KeyMaps - - - - - - - - - - -
let mapleader = ','		" set the <leader>
map <F2> :NERDTreeToggle<CR>
nnoremap <C-S> :w<CR>
vnoremap <C-S> <esc>:w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Ctrl + C to xclip
vnoremap <C-c> "+y
" coc
nmap <leader>rn <Plug>(coc-rename) " Remap for rename current word
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" - - - - - - - - - functions - - - - - - - - - - -
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

