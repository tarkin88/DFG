nmap <leader><ENTER> :Goyo<CR>


let g:goyo_width=130


function! s:goyo_enter()
  set noshowmode
  set number
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
