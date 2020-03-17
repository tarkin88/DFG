"██╗   ██╗██╗███╗   ███╗
"██║   ██║██║████╗ ████║
"██║   ██║██║██╔████╔██║
"╚██╗ ██╔╝██║██║╚██╔╝██║
" ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═══╝  ╚═╝╚═╝     ╚═╝

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Rigellute/rigel'
  Plug 'mhinz/vim-startify'  " Show a start screen
  Plug 'scrooloose/nerdtree'  " file explorer
  Plug 'xuyuanp/nerdtree-git-plugin' " git file explorer
  Plug 'itchyny/lightline.vim'
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
  Plug 'Raimondi/delimitMate'
  Plug 'airblade/vim-gitgutter' " shows a git diff
  Plug 'APZelos/blamer.nvim'
  Plug 'tpope/vim-surround'
  Plug 'mbbill/undotree' " undo history visualizer
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary' " comment with powers
else
  Plug 'Shougo/denite.nvim'
endif
call plug#end()

" General settings
set colorcolumn=120  " Set & show limit column
set number
set termguicolors  " Activa true colors en la terminal
set diffopt+=vertical  " Always use vertical diffs
set scrolloff=2  " Display at least 3 lines around you cursor

" cursor
set cursorline
hi CursorLine ctermbg=235
highlight Cursor ctermbg=Green

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
set noswapfile " get rid of swapfiles everywhere
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

set omnifunc=syntaxcomplete#Complete
set completefunc=LanguageClient#complete
set list


" - - - - - - - - Plugins settings - - - - - - - - - -
colorscheme rigel
" Git Blamer
let g:blamer_enabled = 1
let g:blamer_delay = 2500
let g:blamer_show_in_visual_modes = 0
let g:blamer_template = '<summary> | <committer> | <committer-time>'
let g:blamer_prefix = ' -> '
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
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos              = 'left'
let g:NERDTreeWinSize             = 30
let g:NERDTreeStatusline          = "  "
let g:NERDTreeDirArrowExpandable  = '+'
let g:NERDTreeDirArrowCollapsible = '-'



autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"lightline
let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }
" identline
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" neosnippet
let g:neosnippet#enable_completed_snippet = 1
" Ale, lintern
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_signs             = 1
let g:ale_use_deprecated_neovim = 1
let g:ale_sign_error            = '> '
let g:ale_sign_warning          = '! '
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fixers = {
 \ '*': [
 \ 'remove_trailing_lines',
 \ 'trim_whitespace'],
 \ 'javascript': ['prettier', 'eslint'],
 \ }
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1
let g:ale_fix_on_save = 1
let g:ale_list_window_size = 4
hi ALEErrorSign ctermfg=01 ctermbg=00
hi ALEWarningSign ctermfg=06 ctermbg=00

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '×'
let g:gitgutter_sign_modified_removed          = '×'


" coc
autocmd CursorHold * silent call CocActionAsync('highlight') "Highlight symbol under cursor on CursorHold
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-css',
\ ]
"Polyglot
let g:javascript_plugin_jsdoc = 1
setlocal conceallevel=2
" Ale
set statusline=%{LinterStatus()}
let g:javascript_plugin_flow = 1
" undo
if has("persistent_undo")
    set undodir="$HOME/.undodir"
    set undofile
endif
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif
" auto open diff window
if !exists('g:undotree_DiffAutoOpen')
    let g:undotree_DiffAutoOpen = 1
endif

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif


"- - - - - - - - - - - KeyMaps - - - - - - - - - - -
let mapleader = ','		" set the <leader>
nmap <F2> :NERDTreeToggle<CR>

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

" Remap keys for gotos
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cy <Plug>(coc-type-definition)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)
" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
inoremap <silent><expr> <c-space> coc#refresh()
nmap <F8> :TagbarToggle<CR>

" tabs
""This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>
" next tab
nmap <leader>l :bnext<CR>
" prev tab
nmap <leader>h :bprevious<CR>
" close tab
nmap <leader>w :bp <BAR> bd #<CR>
"show all buffers
nmap <leader>bl :ls<CR>

nnoremap <C-A> ggvG$

nnoremap <F5> :UndotreeToggle<cr>


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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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


" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


call coc#config('coc.preferences', {
\ 'messageLevel': 'error',
\})

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction


try
  " === Denite setup ==="
  " Use ripgrep for searching current directory for files
  " By default, ripgrep will respect rules in .gitignore
  "   --files: Print each file that would be searched (but don't search)
  "   --glob:  Include or exclues files for searching that match the given glob
  "            (aka ignore .git files)
  "
  " call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  " call denite#custom#var('grep', 'command', ['ag'])
  " call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  " call denite#custom#var('grep', 'recursive_opts', [])
  " call denite#custom#var('grep', 'pattern_opt', [])
  " call denite#custom#var('grep', 'separator', ['--'])
  " call denite#custom#var('grep', 'final_opts', [])
  " call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
  " call denite#custom#var('buffer', 'date_format', '')

  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--hidden'])
  " Use ripgrep in place of "grep"
  call denite#custom#var('grep', 'command', ['rg'])
  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  " Remove date from buffer list
  call denite#custom#var('buffer', 'date_format', '')


let s:denite_options = {'default' : {
 \ 'start_filter': 1,
 \ 'split': 'floating',
 \ 'statusline': 0,
 \ 'auto_resize': 1,
 \ 'source_names': 'short',
 \ 'prompt': 'λ ',
 \ 'highlight_matched_char': 'QuickFixLine',
 \ 'highlight_matched_range': 'Visual',
 \ 'highlight_window_background': 'Visual',
 \ 'highlight_mode_normal': 'Visual',
 \ 'highlight_filter_background': 'DiffAdd',
 \ 'winrow': 1,
 \ 'vertical_preview': 1
 \ }}

  " Loop through denite options and enable them
  function! s:profile(opts) abort
    for l:fname in keys(a:opts)
      for l:dopt in keys(a:opts[l:fname])
        call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
      endfor
    endfor
  endfunction

  call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" === Denite shorcuts === "
"   <C-space> - Browser currently open buffers
"   <C-p> - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <C-space> :Denite buffer<CR>
nmap <C-p> :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <Esc>
  \ <Plug>(denite_filter_quit)
  "inoremap <silent><buffer><expr> <Esc>
  "\ denite#do_map('quit')
  " nnoremap <silent><buffer><expr> <Esc>
  "\ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  "nnoremap <silent><buffer><expr> <Esc>
  "\ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
