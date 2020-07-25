" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" ---------------------------------------
"            General stuff
" ---------------------------------------
  Plug 'airblade/vim-rooter'
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'tpope/vim-surround'
  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'
  Plug 'kristijanhusak/vim-carbon-now-sh'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'ntpeters/vim-better-whitespace'
  " Plug 'DanManN/vim-razer'

" ---------------------------------------
"            Code Quality
" ---------------------------------------
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'kkoomen/vim-doge'
  Plug 'tmhedberg/SimpylFold'
  Plug 'tpope/vim-commentary'

" ---------------------------------------
"            Colors
" ---------------------------------------
  Plug 'sainnhe/sonokai'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'srcery-colors/srcery-vim'
  Plug 'franbach/miramare'
  Plug 'ajmwagar/vim-deus'


  " Plug 'sainnhe/gruvbox-material'

" ---------------------------------------
"            Git
" ---------------------------------------
  Plug 'APZelos/blamer.nvim'
  Plug 'airblade/vim-gitgutter'

" ---------------------------------------
"            Navigation
" ---------------------------------------
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'mbbill/undotree', { 'on': [ 'UndotreeToggle' ] }
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' } " FZF from inside Vim
  Plug 'junegunn/fzf.vim', {
            \ 'on': [
                \ 'Rg',
                \ 'FZF',
                \ 'Files',
                \ 'GitFiles',
                \ 'Buffers',
                \ 'Commits',
                \ 'BCommits',
                \ 'Tags',
                \ 'BTags',
                \ 'History',
                \ 'Lines',
                \ 'BLines',
                \ 'Marks'
            \ ] }

  Plug 'TaDaa/vimade'
  Plug 'liuchengxu/vista.vim'

  Plug 'ap/vim-buftabline'
  Plug 'voldikss/vim-floaterm', {
        \ 'on': [
        \ 'FloatermToggle'
        \ ] }

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
