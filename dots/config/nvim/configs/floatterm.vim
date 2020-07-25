let g:floaterm_width = 0.5
let g:floaterm_position='top'


nnoremap   <silent>   <F5>   :FloatermToggle<CR>
tnoremap   <silent>   <F5>   <C-\><C-n>:FloatermToggle<CR>

nnoremap   <silent>   <F6>    :FloatermPrev<CR>
tnoremap   <silent>   <F6>    <C-\><C-n>:FloatermPrev<CR>

nnoremap   <silent>   <F7>    :FloatermNext<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNext<CR>

tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermNew<CR>
