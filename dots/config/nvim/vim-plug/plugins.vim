" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

"color scheme
  Plug 'sainnhe/forest-night'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

  " Surround
  Plug 'tpope/vim-surround'

  " Better Comments
  Plug 'preservim/nerdcommenter'
  Plug 'mbbill/undotree' " undo history visualizer
  Plug 'APZelos/blamer.nvim'

  " Add some color
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/limelight.vim'

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'

  " Cool Icons
  Plug 'ryanoasis/vim-devicons'

  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'posva/vim-vue'

  " lint engine
  Plug 'dense-analysis/ale'

  " Status Line
  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'
  Plug 'bling/vim-bufferline'

  " Snippets are separated from the engine. Add this if you want them:
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' } " FZF from inside Vim
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  " Git
  Plug 'airblade/vim-gitgutter'

  " Vista
  Plug 'liuchengxu/vista.vim'

  " Zen mode
  Plug 'junegunn/goyo.vim'

  " debug
  Plug 'vim-vdebug/vdebug'

  " Making stuff
  Plug 'neomake/neomake'
  Plug 'mattn/emmet-vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'ap/vim-css-color'
  Plug 'machakann/vim-highlightedyank'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
