"let g:vista_default_executive = 'coc'
let g:vista_default_executive = 'ctags'

let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_ignore_kinds = ['Variable']

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

autocmd FileType vista nnoremap <buffer> <silent> aa :<c-u>call vista#cursor#FoldOrJump()<CR>

nmap <F5> :Vista!!<CR>

