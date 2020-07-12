nnoremap <M-f> :Rg<CR>
nnoremap <M-t> :Tags<CR>
nnoremap <M-m> :Marks<CR>

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
nnoremap <silent> <C-p> :Files<CR>
" show buffers
nnoremap <silent> <C-b> :Buffers<CR>

" Open files in vertical horizontal split
nnoremap <silent><A-v> :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>


nnoremap <silent><A-h> :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'botright split' })<CR>



let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**' -g '!{node_modules,.git,autoload}'"


if has('nvim') && exists("*nvim_open_win")
    " fix hideous sign column
    let g:fzf_colors = {
      \ "fg+": ["fg", "CursorLine", "CursorColumn", "Normal"],
      \ "bg+": ["bg", "ColorColumn", "CursorLine", "CursorColumn", "Normal"]}

    let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,3'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }

    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        call setbufvar(buf, '&signcolumn', 'no')

        let height = 10
        if &lines > 10
            let height = float2nr(&lines * 0.4) " 40%
        endif

        let width = 80
        if &columns > 110
            let width = float2nr(&columns * 0.6) " 60%
        endif

        let horizontal = float2nr((&columns - width) / 2)
        let vertical = 1

        let opts = {
            \ 'relative': 'editor',
            \ 'row': vertical,
            \ 'col': horizontal,
            \ 'width': width,
            \ 'height': height,
            \ 'anchor': 'NW',
            \ 'style': 'minimal'
            \ }

        call nvim_open_win(buf, v:true, opts)
    endfunction
endif
