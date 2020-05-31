
if has("persistent_undo")
  set undodir="$HOME/.undodir"
  set undofile
endif
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 1
endif
if !exists('g:undotree_DiffAutoOpen')
  let g:undotree_DiffAutoOpen = 1
endif
if !exists('g:undotree_SetFocusWhenToggle')
  let g:undotree_SetFocusWhenToggle = 1
endif

nnoremap <F3> :UndotreeToggle<cr> 

