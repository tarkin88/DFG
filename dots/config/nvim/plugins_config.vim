
" ============================================================================ "
" ===                         PLUGINS CONFIG                               === "
" ============================================================================ "

" Color scheme
"
let g:srcery_italic = 1

colorscheme srcery

"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_italic=1
"colorscheme gruvbox


" == ulti snippets
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0


" == nerdtree
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos              = 'left'
let g:NERDTreeWinSize             = 30
let g:NERDTreeStatusline          = "  "
let g:NERDTreeDirArrowExpandable  = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" == highlightedyank
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 2000


" == gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '×'
let g:gitgutter_sign_modified_removed          = '×'


" == git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 2500
let g:blamer_show_in_visual_modes = 0
let g:blamer_template = '<summary> | <committer> | <committer-time>'
let g:blamer_prefix = ' -> '


" == Lightline
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline = {
  \ 'colorscheme': 'srcery',
  \ }


" == identline
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" == undotree
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


" == jedi
let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer


" == Ale, lintern
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_signs             = 1
let g:ale_use_deprecated_neovim = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error            = "\uf05e"
let g:ale_sign_warning          = "\uf071"
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_fixers = {
      \ '*': [ 'remove_trailing_lines', 'trim_whitespace'],
      \ 'vue': [ 'prettier', 'eslint'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': [
      \ 'yapf',
      \ 'autopep8',
      \ 'black',
      \ 'isort',
      \ 'add_blank_lines_for_python_control_statements',
      \ 'remove_trailing_lines',
      \ 'reorder-python-imports',
     \ ],
      \ }
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1
let g:ale_fix_on_save = 1
let g:ale_list_window_size = 8
let g:ale_open_list = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 1
let g:ale_completion_tsserver_autoimport = 1


" == vim vue plugin
let g:vim_vue_plugin_load_full_syntax = 1


" == emmet
let g:user_emmet_install_global = 1


" === Better white space management
let g:strip_whitespace_on_save = 1

" == neosnippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" == clap
let g:clap_layout = { 'relative': 'editor' }
let g:clap_open_action={'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }

" SuperTab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" LSP and Vista config
let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

let g:lsp_settings = {
\   'pyls': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

let g:vista_executive_for = {
\ 'python': 'vim_lsp',
\ }

let g:vista_ignore_kinds = ['Variable']

" Goyo
let g:goyo_width=130

" Vim vue
let g:vue_pre_processors = ['scss']


" startify
let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'}, '~/.zshrc' ]
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
let g:startify_files_number=5
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ ]
