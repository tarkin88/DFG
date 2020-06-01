let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 0

let g:NERDRemoveExtraSpaces = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


let g:NERD_c_alt_style = 1
let g:NERDCustomDelimiters = {'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }}
let g:ft = ''
fu! NERDCommenter_before()
  if &ft ==# 'markdown'
    let g:ft = 'markdown'
    let cf = context_filetype#get()
    if cf.filetype !=# 'markdown'
      exe 'setf ' . cf.filetype
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft ==# 'markdown'
    setf markdown
    let g:ft = ''
  endif
endfu
