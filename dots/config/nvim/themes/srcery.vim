hi Comment cterm=italic

let g:srcery_italic = 1
syntax on
colorscheme srcery
" set t_Co=256
"
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
