" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')


" === Color Scheme
Plug 'Rigellute/rigel'

" === Git Gutter ===
" shows a git diff
Plug 'airblade/vim-gitgutter'
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '×'
let g:gitgutter_sign_modified_removed          = '×'

" === Undo Tree ===
" undo history visualizer
Plug 'mbbill/undotree'
if has("persistent_undo")
  set undodir="$HOME/.undodir"
  set undofile
endif
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 1
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

" === Nerd tree
" file explorer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeChDirMode = 2  " Change focus to actual node
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos= 'right'
let g:NERDTreeWinSize=30
let g:NERDTreeStatusline= "  "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Vim Highlight yank
" Hightlight the yank copy
Plug 'machakann/vim-highlightedyank'
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 2500

" === LightLine
" Status bar
Plug 'itchyny/lightline.vim'
let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }

" === GIT BLAMER ===
Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 1
let g:blamer_delay = 3000
let g:blamer_show_in_visual_modes = 0
let g:blamer_template = '<summary> | <committer> | <committer-time>'
let g:blamer_prefix = ' -> '

" == Identline
" displaying thin vertical lines
Plug 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

Plug 'bling/vim-bufferline'               " show the buffers
Plug 'bronson/vim-trailing-whitespace'    " just call :FixWhitespace
Plug 'terryma/vim-multiple-cursors'       " multiple cursors with <C-n>
Plug 'editorconfig/editorconfig-vim'
Plug 'itmammoth/doorboy.vim'
Plug 'alvan/vim-closetag'
call plug#end()

